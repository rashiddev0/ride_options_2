import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:ride_options_2/common/custom_widgets/custom_appbar.dart';
import 'package:ride_options_2/common/utils/utility_function.dart';

import '../../../../common/const/export.dart';
import '../component/driver_details_tile.dart';
import '../component/dropdown_selection.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class VehicleInfoScreen extends StatelessWidget {
  List<ValueItem> _getVehicleBrandList(context) {
    return [
      ValueItem(label: AppLocalizations.of(context)!.honda, value: 1),
      ValueItem(label: AppLocalizations.of(context)!.suzuki, value: 2),
      ValueItem(label: AppLocalizations.of(context)!.united, value: 3),
      ValueItem(label: AppLocalizations.of(context)!.yamaha, value: 4),
      ValueItem(label: AppLocalizations.of(context)!.roadPrince, value: 5),
      ValueItem(label: AppLocalizations.of(context)!.unique, value: 6),
      ValueItem(label: AppLocalizations.of(context)!.crown, value: 7)
    ];
  }

  List<ValueItem> _getVehicleModelList(context) {
    return [
      ValueItem(label: AppLocalizations.of(context)!.city, value: 1),
      ValueItem(label: AppLocalizations.of(context)!.civic, value: 2),
      ValueItem(label: AppLocalizations.of(context)!.none, value: 3),
      ValueItem(label: AppLocalizations.of(context)!.nWeg, value: 4),
      ValueItem(label: AppLocalizations.of(context)!.hrv, value: 5),
      ValueItem(label: AppLocalizations.of(context)!.vezel, value: 6),
      ValueItem(label: AppLocalizations.of(context)!.insight, value: 7)
    ];
  }


  @override
  Widget build(BuildContext context) {
    context.read<DriverAuthCubit>().setDataVehicleInfoInit();
    List<ValueItem> vehicleBrands = _getVehicleBrandList(context);
    List<ValueItem> vehicleModels = _getVehicleModelList(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(AppLocalizations.of(context)!.vehicle_info),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
          BlocBuilder<DriverAuthCubit, DriverAuthState>(
              builder: (context, state) {
                return
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DropDownSelection(
                        options: vehicleBrands,
                        onOptionSelected: (option) {
                           context.read<DriverAuthCubit>().selectBrand(option[0]);
                        },
                        hint:state.selectedBrand?.label?? AppLocalizations.of(context)!.selectVehicle,
                        searchLabel: AppLocalizations.of(context)!.search,
                      ),
                      addHeight(12.h),
                      DropDownSelection(
                          options: vehicleModels,
                          onOptionSelected: (option) {
                             context.read<DriverAuthCubit>().selectModel(option[0]);
                          },
                          hint:state.selectedModel?.label?? AppLocalizations.of(context)!.selectModel,
                          searchLabel: AppLocalizations.of(context)!.search),
                      addHeight(8.h),
                      DriverDetailTile(
                        onTap: () {
                          context.read<DriverAuthCubit>().selectVehicleModel(context);
                        },
                        title:state.vehicleModelDate?.year.toString()?? AppLocalizations.of(context)!.model_year,
                        icon2: "",
                        icon: AppAssets.down,
                      ),
                      DriverDetailTile(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoute.vehiclePhotoScreen,
                          );
                        },
                        title: AppLocalizations.of(context)!.vehicle_photo,
                        icon2: "",
                        icon: AppAssets.down,
                      ),
                      const Spacer(),
                      ElevatedButton(
                          onPressed: (){
                            context.read<DriverAuthCubit>().setDataVehicleInfoOnPress(context);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.save,
                            style: Theme.of(context).textTheme.headlineMedium,
                          )),
                    ],
                  );})
        ),
      ),
    );
  }
}
