

import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:ride_options_2/common/utils/utility_function.dart';

import '../../../../common/const/export.dart';
import '../../../../common/custom_widgets/custom_button.dart';
import '../component/driver_details_tile.dart';
import '../component/dropdown_selection.dart';

class VehicleInfoScreen extends StatelessWidget {



  List<ValueItem> _getVehicleBrandList(context){
    return [
      ValueItem(label:  AppLocalizations.of(context)!.honda, value: 1),
      ValueItem(label:  AppLocalizations.of(context)!.suzuki, value: 2),
      ValueItem(label: AppLocalizations.of(context)!.united, value: 3),
      ValueItem(label:  AppLocalizations.of(context)!.yamaha, value: 4),
      ValueItem(label:  AppLocalizations.of(context)!.roadPrince, value: 5),
      ValueItem(label:  AppLocalizations.of(context)!.unique, value: 6),
      ValueItem(label:  AppLocalizations.of(context)!.crown, value: 7)
    ];
  }



  List<ValueItem> _getVehicleModelList(context){
    return [
      ValueItem(label:  AppLocalizations.of(context)!.city, value: 1),
      ValueItem(label:  AppLocalizations.of(context)!.civic, value: 2),
      ValueItem(label:  AppLocalizations.of(context)!.none, value: 3),
      ValueItem(label:  AppLocalizations.of(context)!.nWeg, value: 4),
      ValueItem(label:  AppLocalizations.of(context)!.hrv, value: 5),
      ValueItem(label:  AppLocalizations.of(context)!.vezel, value: 6),
      ValueItem(label:  AppLocalizations.of(context)!.insight, value: 7)
    ];
  }






  String? selectedBrand;

  UtilityFunction utilityFunction=UtilityFunction();
  @override
  Widget build(BuildContext context) {
    List<ValueItem> vehicleBrands = _getVehicleBrandList(context);
    List<ValueItem> vehicleModels = _getVehicleModelList(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context)!.vehicle_info
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[


            DropDownSelection(options: vehicleBrands, onOptionSelected: (option) {  }, hint:  AppLocalizations.of(context)!.selectVehicle, searchLabel:  AppLocalizations.of(context)!.search
                ,),

            addHeight(12.h),
            DropDownSelection(options: vehicleModels, onOptionSelected: (option) {  }, hint: AppLocalizations.of(context)!.selectModel, searchLabel:   AppLocalizations.of(context)!.search),
            addHeight(8.h),
            DriverDetailTile(onTap: () {
              utilityFunction.selectYear(context);

            }, title: AppLocalizations.of(context)!.model_year, icon2: "", icon: AppAssets.down,),

            DriverDetailTile(onTap: () {
              Navigator.pushNamed(context, AppRoute.vehiclePhotoScreen,);

              }, title: AppLocalizations.of(context)!.vehicle_photo, icon2: "", icon: AppAssets.down,),

            const Spacer(),

            ElevatedButton(onPressed:null, child: Text(AppLocalizations.of(context)!.save,
              style:  Theme.of(context).textTheme.headlineMedium,
            )),

          ],
        ),
      ),
    );
  }
}