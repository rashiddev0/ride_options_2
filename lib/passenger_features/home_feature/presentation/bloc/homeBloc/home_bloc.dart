import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

import '../../../../../common/const/export.dart';
import '../../../data/models/dropLocation.dart';
import '../../../data/models/location.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<String> locationHistory = ["Ghazi Road", "Model Town", "Punjab Socitey"];
  List<String> commentList = [
    "I'm on pickup location",
    "Hurry up",
    "Call me when you reach",
    "No calls text only",
    "Wait 5 mints "
  ];
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
  List<String> rideCategoryName = [
    "Bike",
    "Auto",
    "Ride",
    "Ride AC",
  ];
  List<String> rideCategoryDisc = [
    "This is Bike",
    "This is Auto",
    "This is Ride",
    "This is Ride AC",
  ];
  List<String> rideCategoryImg = [
    AppAssets.bike,
    AppAssets.auto,
    AppAssets.car,
    AppAssets.car,
  ];
  List<int> rideCategoryRate = [
    200,
    300,
    400,
    500,
  ];

  TextEditingController pickLocationController = TextEditingController();
  TextEditingController dropLocationController = TextEditingController();
  TextEditingController userCommentController = TextEditingController();
  TextEditingController fareController = TextEditingController();

  GoogleMapController? controller;
  final Completer<GoogleMapController> controllerCompleter = Completer();

  LatLng centerLocation = const LatLng(41.4219057, -102.0840772);
  bool selectedLocation = false;
  int? selectedRideIndex;
  bool pickLocationTextController = false;

  Timer? myTimer;

  Map pickLocationMap = {};
  Map dropLocationMap = {};

  List<dynamic> placeList = [];
  String? sessionToken;
  var uuid = const Uuid();

  String apiKey = 'AIzaSyCjxRhtdw74nJ9YdYaGjvY5IZUEA5Ux0JA';

  HomeBloc() : super(LocationInitial()) {
    on<GetLocation>(_fetchLocation);
    /*on<HomeEvent>((event, emit) async {
      if (event is LocationMapEvent) {
        _setMarker(
            event,
            emit,
            event.model,
            event.locationMap,
            event.markerIcon,
            event.markers,
            event.markerID);
        emit(SetPickMarkerState(markers: event.markers,markerID: event.markerID,markerIcon: event.markerIcon,locationMap: event.locationMap,model: event.model));
      }
    });*/
  }

  Future<void> _fetchLocation(HomeEvent event, Emitter<HomeState> emit) async {
    try {
      await getCurrentLatLng();
    } catch (error) {
      emit(LocationError("error"));
    }
  }

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

  getDropAddress(double dropLat, double dropLng,
      DropLocationModel model) async {
    http.Response response = await http.get(Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$dropLat,$dropLng&key=$apiKey"));
    if (response.statusCode == 200) {
      String jSonData = response.body;
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        dropLat,
        dropLng,
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
      model.lat = dropLat;
      model.lng = dropLng;
      debugPrint("////92////:${model.toMap().toString()}");
      //var data = model;
      dropLocationMap = model.toMap();
      debugPrint("////184////:${dropLocationMap.toString()}");
      //lat: 31.4686679, lng: 74.3180427
      dropLocationController.text = model.address!;
      emit(DropLocationLoaded(model));
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

  getSelectedIndex(int index) {
    selectedRideIndex = index;
    emit(RideIndex());
  }

  checkLocationTextController(bool isActive) {
    pickLocationTextController = isActive;
    emit(PickLocationController(isActive));
  }

  getLatLngFromAddress(List<dynamic> placeList, int index) async {
    var result = await locationFromAddress(placeList[index]["description"]);
    LocationModel model = LocationModel(
      title: placeList[index]["structured_formatting"]["main_text"],
      address: placeList[index]["description"],
      city: "",
      country: "",
      lat: result.first.latitude,
      lng: result.first.longitude,
    );
    pickLocationMap = model.toMap();
  }

  getLatLngFromAddressDrop(List<dynamic> placeList,
      int index,) async {
    var result = await locationFromAddress(placeList[index]["description"]);
    DropLocationModel model = DropLocationModel(
      title: placeList[index]["structured_formatting"]["main_text"],
      address: placeList[index]["description"],
      city: "",
      country: "",
      lat: result.first.latitude,
      lng: result.first.longitude,
    );
    dropLocationMap = model.toMap();
  }

  hideButton(bool hide) {
    selectedLocation = hide;
    emit(HideButton(hideButton: hide));
  }

  clearPickLocation(TextEditingController controller, Map locationMap) {
    controller.clear();
    locationMap.clear();
    emit(ClearPickLocation(controller: controller, locationMap: locationMap));
  }

  setLocation() {
    emit(setLocation());
  }

  getTravelTime(double pointALat, double pointALng, double pointBLat,
      double pointBLng) async {
    String directionBaseUrl =
        "https://maps.googleapis.com/maps/api/directions/json";
    String directionApiUrl =
        "$directionBaseUrl?origin=$pointALat,$pointALng&destination=$pointBLat,$pointBLng&key=$apiKey";
    var response = await http.get(Uri.parse(directionApiUrl));
    if (response.statusCode == 200) {
      debugPrint("///301///${jsonDecode(response.body)}");
      var data = jsonDecode(response.body.toString())["routes"][0];
      debugPrint("///303///$data");
      final legs = data["legs"][0];
      var travelTime = legs["duration"]["value"];
      if (travelTime <= 3599) {
        int sec = travelTime % 60;
        int min = (travelTime / 60).floor();
        String minute = min
            .toString()
            .length <= 1 ? "0$min" : "$min";
        String second = sec
            .toString()
            .length <= 1 ? "0$sec" : "$sec";
        String travelT = "$minute min, $second sec";
        return travelT;
      }
      else {
        int minte = travelTime % 60;
        int hours = (travelTime / 3600).floor();
        String minute = minte
            .toString()
            .length <= 1 ? "0$minte" : "$minte";
        String hour = hours
            .toString()
            .length <= 1 ? "0$hours" : "$hours";
        String travelT = "$hour hr, $minute min";
        return travelT;
      }
    }
    else {
      throw Exception("///727//faild to load data//$Exception");
    }
  }

  setFareInField(){
    emit(SetFareFieldState());
  }

/*  _setMarker(HomeEvent event, Emitter<HomeState> emit, LocationModel model,
      Map locationMap, String markerIcon, Set<Marker> markers,
      Uint8List? markerID) async {
    LocationModel model = LocationModel.fromMap(locationMap);
    markers.clear();
    markerID =
    await getBytesFromAsset(markerIcon, (100.h).toInt());

    if (model.address != null) {
      markers.add(
        Marker(
          markerId: const MarkerId("id-1"),
          icon: BitmapDescriptor.fromBytes(markerID!),
          position: LatLng(model.lat!, model.lng!),
        ),
      );
    }
    emit(SetPickMarkerState(model: model,
        locationMap: locationMap,
        markerIcon: markerIcon,
        markerID: markerID,
        markers: markers));
  }*/
}
