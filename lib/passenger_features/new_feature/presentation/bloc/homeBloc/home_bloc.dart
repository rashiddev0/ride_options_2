import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:ride_options_2/passenger_features/new_feature/data/models/location.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/bloc/homeBloc/home_state.dart';

import '../../../../../common/const/export.dart';
import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<String> locationHistory = ["Ghazi Road", "Model Town", "Punjab Socitey"];
  List<String> offersList = [
    "assets/imgs/temp/a.png",
    "assets/imgs/temp/b.png",
    "assets/imgs/temp/c.jpg",
    "assets/imgs/temp/d.jpg",
    "assets/imgs/temp/e.jpg",
    "assets/imgs/temp/f.jpg"
  ];
  List<String> bannerList = [
    "assets/imgs/temp/banner.png",
    "assets/imgs/temp/b.png",
    "assets/imgs/temp/c.jpg",
    "assets/imgs/temp/d.jpg",
    "assets/imgs/temp/e.jpg",
    "assets/imgs/temp/f.jpg"
  ];

  TextEditingController pickLocationController = TextEditingController();
  TextEditingController dropLocationController = TextEditingController();

  GoogleMapController? controller;
  final Completer<GoogleMapController> controllerCompleter = Completer();

  Set<Marker> markers = {};
  bool selectedLocation = false;
  bool fullSheet = false;

  Map pickLocationMap = {};

  List<dynamic> placeList = [];
  String? sessionToken;
  var uuid = const Uuid();

  String apiKey = 'AIzaSyCjxRhtdw74nJ9YdYaGjvY5IZUEA5Ux0JA';

  HomeBloc() : super(LocationInitial()) {
    on<GetLocation>(_fetchLocation);
  }

  Future<void> _fetchLocation(HomeEvent event, Emitter<HomeState> emit) async {
    try {
      await getCurrentLatLng();
    } catch (error) {
      emit(LocationError("error"));
    }
  }

  /*@override
  Stream<HomeState> reduce(HomeEvent event) async* {
    if (event is GetLocation) {
      yield LocationInitial();
      try {
        await getCurrentLatLng();
        LocationModel pickLocationModel  = LocationModel.fromMap(pickLocationMap);
        yield LocationLoaded(pickLocationModel);
      } catch (e) {
        yield LocationError('Failed to fetch location: $e');
      }
    }
  }*/

  getCurrentLatLng() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
      debugPrint("///45///");
    } else {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      LocationModel model = LocationModel();
      Future.delayed(const Duration(seconds: 1), () {
        /*setState(() {
          _initialPosition = LatLng(userDetailsControl.pickLat.value,
              userDetailsControl.pickLng.value);
        });*/
        if (model.lat != position.latitude) {
          getCurrentAddress(position.latitude, position.longitude, model);
        }
      });
    }
  }

  getCurrentAddress(double pickLat, double pickLng, LocationModel model) async {
    http.Response response = await http.get(Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$pickLat,$pickLng&key=$apiKey"));
    if (response.statusCode == 200) {
      String jSonData = response.body;
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        pickLat,
        pickLng,
      );
      Placemark address = placeMarks[0];
      var decodeData = jsonDecode(jSonData);
      List list = decodeData["results"][0]["formatted_address"].split(",");
      model.title = list.first;
      model.address = decodeData["results"][0]["formatted_address"];
      /*userDetailsControl.pickAddress.value =
        decodeData["results"][0]["formatted_address"];*/
      model.city = address.locality;
      model.country = address.country;
      model.lat = pickLat;
      model.lng = pickLng;
      debugPrint("////92////:${model.toMap().toString()}");
      //var data = model;
      pickLocationMap = model.toMap();
      debugPrint("////94////:${pickLocationMap.toString()}");
      pickLocationController.text = model.address!;
      emit(LocationLoaded(model));
    } else {
      debugPrint("///451///: Some thing happen : ${response.body}");
    }
  }

  getLocPrediction(String value) async {
    if (sessionToken == null) {
      sessionToken = uuid.v4();
    } else {
      String baseURL =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      /*String inCityRequest =
          '$baseURL?input=$value&key=$apiKey&sessiontoken=$sessionToken&components=country:pk';*/
      String inCityRequest =
          '$baseURL?input=$value&location=31.4573295%2C74.3655887&radius=50000&strictbounds=true&key=$apiKey&sessiontoken=$sessionToken&components=country:pk';
      /*https://maps.googleapis.com/maps/api/place/autocomplete/json
    ?input=amoeba
    &location=37.76999%2C-122.44696
    &radius=500
    &types=establishment
    &key=YOUR_API_KEY*/
      //String request = inCityRequest;
      var response = await http.get(Uri.parse(inCityRequest));
      if (response.statusCode == 200) {
        if (value.length > 3) {
          placeList = jsonDecode(response.body.toString())["predictions"];
          //debugPrint("///165///:${placeList[0]["structured_formatting"]["main_text"]}");
          log("///165///:${placeList[0]}");
          emit(GetLocationPrediction());
        }
      } else {
        debugPrint("///115///: failed to load data");
      }
    }
  }

  void moveCamera(double lat, double lng) {
    controller?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 16.0,
        ),
      ),
    );
  }

  void handleTap(LatLng tappedPoint) async {
    markers.clear();
    /*Marker marker = Marker(
      markerId: const MarkerId('1'),
      position: LatLng(tappedPoint.latitude, tappedPoint.longitude),
    );

    setState(() {
      markers.add(marker);
    });*/
    final addresses = await placemarkFromCoordinates(
        tappedPoint.latitude, tappedPoint.longitude);

    final Placemark firstPlacemark = addresses.first;
    final String fullAddress =
        "${firstPlacemark.subThoroughfare} ${firstPlacemark.thoroughfare}, "
        "${firstPlacemark.subLocality}, ${firstPlacemark.locality}, "
        "${firstPlacemark.administrativeArea} ${firstPlacemark.postalCode}, "
        "${firstPlacemark.country}";
    //_selectedLocation = tappedPoint;
    //_selectedAddress = fullAddress ?? 'Unknown address';
    // setState(() {});
  }

  showFullSheet(){
    fullSheet = !fullSheet;
    emit(OpenFullSheet());
  }

/*Future<void> getLatLngSearch(String address) async {
    var result = await locationFromAddress(address);
    if (Get.find<TemRideDetailController>().itDestination.value == true) {
      if (Get.find<TemRideDetailController>().pickLocIndex.value == 0 || Get.find<TemRideDetailController>().pickLocIndex.value == 1) {
        Get.find<TemRideDetailController>().pickLocIndex.value = 1;
        Get.find<TemRideDetailController>().destinationDetails["dropLat"] =
            result.first.latitude;
        Get.find<TemRideDetailController>().destinationDetails["dropLng"] =
            result.first.longitude;
        Get.find<TemRideDetailController>().itDestination.value = false;
        Get.find<TemRideDetailController>().getTravelTime(
            userDetailsControl.pickLat.value,
            userDetailsControl.pickLng.value,
            Get.find<TemRideDetailController>().destinationDetails["dropLat"],
            Get.find<TemRideDetailController>().destinationDetails["dropLng"]);
        Get.find<TemRideDetailController>().getRideFear(
          userDetailsControl.pickLat.value,
          userDetailsControl.pickLng.value,
          Get.find<TemRideDetailController>().destinationDetails["dropLat"],
          Get.find<TemRideDetailController>().destinationDetails["dropLng"],
          userDetailsControl.selectedIndex.value == 786 ? 0 : userDetailsControl.selectedIndex.value,
        );
        Get.off(() => const Home());
      }
      else if (Get.find<TemRideDetailController>().pickLocIndex.value == 2) {
        Get.find<TemRideDetailController>().destinationDetails["dropLatTow"] =
            result.first.latitude;
        Get.find<TemRideDetailController>().destinationDetails["dropLngTow"] =
            result.first.longitude;
        Get.find<TemRideDetailController>().itDestination.value = false;
        Get.find<TemRideDetailController>().getTravelTime(
            Get.find<TemRideDetailController>().destinationDetails["dropLat"],
            Get.find<TemRideDetailController>().destinationDetails["dropLng"],
            Get.find<TemRideDetailController>()
                .destinationDetails["dropLatTow"],
            Get.find<TemRideDetailController>()
                .destinationDetails["dropLngTow"]);
        Get.find<TemRideDetailController>().getRideFear(
          Get.find<TemRideDetailController>().destinationDetails["dropLat"],
          Get.find<TemRideDetailController>().destinationDetails["dropLng"],
          Get.find<TemRideDetailController>().destinationDetails["dropLatTow"],
          Get.find<TemRideDetailController>().destinationDetails["dropLngTow"],
          userDetailsControl.selectedIndex.value == 786 ? 0 : userDetailsControl.selectedIndex.value,
        );
        Get.off(() => const Home());
      }
      else if (Get.find<TemRideDetailController>().pickLocIndex.value == 3) {
        Get.find<TemRideDetailController>().destinationDetails["dropLatThree"] =
            result.first.latitude;
        Get.find<TemRideDetailController>().destinationDetails["dropLngThree"] =
            result.first.longitude;
        Get.find<TemRideDetailController>().itDestination.value = false;
        Get.find<TemRideDetailController>().getTravelTime(
            Get.find<TemRideDetailController>()
                .destinationDetails["dropLatTow"],
            Get.find<TemRideDetailController>()
                .destinationDetails["dropLngTow"],
            Get.find<TemRideDetailController>()
                .destinationDetails["dropLatThree"],
            Get.find<TemRideDetailController>()
                .destinationDetails["dropLngThree"]);
        Get.find<TemRideDetailController>().getRideFear(
          Get.find<TemRideDetailController>().destinationDetails["dropLatTow"],
          Get.find<TemRideDetailController>().destinationDetails["dropLngTow"],
          Get.find<TemRideDetailController>()
              .destinationDetails["dropLatThree"],
          Get.find<TemRideDetailController>()
              .destinationDetails["dropLngThree"],
          userDetailsControl.selectedIndex.value == 786 ? 0 : userDetailsControl.selectedIndex.value,
        );
        Get.off(() => const Home());
      }
      else if (Get.find<TemRideDetailController>().pickLocIndex.value == 4) {
        Get.find<TemRideDetailController>().destinationDetails["dropLatFour"] =
            result.first.latitude;
        Get.find<TemRideDetailController>().destinationDetails["dropLngFour"] =
            result.first.longitude;
        Get.find<TemRideDetailController>().itDestination.value = false;
        Get.find<TemRideDetailController>().getTravelTime(
            Get.find<TemRideDetailController>()
                .destinationDetails["dropLatThree"],
            Get.find<TemRideDetailController>()
                .destinationDetails["dropLngThree"],
            Get.find<TemRideDetailController>()
                .destinationDetails["dropLatFour"],
            Get.find<TemRideDetailController>()
                .destinationDetails["dropLngFour"]);
        Get.find<TemRideDetailController>().getRideFear(
          Get.find<TemRideDetailController>()
              .destinationDetails["dropLatThree"],
          Get.find<TemRideDetailController>()
              .destinationDetails["dropLngThree"],
          Get.find<TemRideDetailController>().destinationDetails["dropLatFour"],
          Get.find<TemRideDetailController>().destinationDetails["dropLngFour"],
          userDetailsControl.selectedIndex.value == 786 ? 0 : userDetailsControl.selectedIndex.value,
        );
        Get.off(() => const Home());
      }
    }
    else {
      userDetailsControl.pickLat.value = result.first.latitude;
      userDetailsControl.pickLng.value = result.first.longitude;
      Get.find<TemRideDetailController>().itDestination.value = false;
      Get.off(() => const Home());
    }
  }*/
}
