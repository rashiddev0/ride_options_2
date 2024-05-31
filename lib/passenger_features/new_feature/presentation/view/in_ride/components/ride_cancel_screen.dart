import 'package:flutter/cupertino.dart';
import 'package:ride_options_2/common/custom_widgets/custom_button.dart';
import 'package:ride_options_2/common/custom_widgets/custom_textfield.dart';
import 'package:ride_options_2/passenger_features/new_feature/presentation/bloc/in_ride_map_bloc/in_ride_map_bloc.dart';

import 'package:ride_options_2/passenger_features/new_feature/presentation/bloc/in_ride_map_bloc/in_ride_map_bloc.dart';

import '../../../../../../common/const/export.dart';
import '../../../bloc/in_ride_map_bloc/in_ride_map_state.dart';
import 'cencel_resson_model.dart';

class RideCancelScreen extends StatelessWidget {
  const RideCancelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final inRideMapBloc = BlocProvider.of<InRideMapBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cancel ride"),
        centerTitle: true,
      ),
      body: BlocConsumer<InRideMapBloc, InRideMapState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                flex: 2,
                child: ListView.separated(
                  itemCount: inRideMapBloc.cancelReasons.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h,);
                  },
                  itemBuilder: (context, index) {
                    return CancelReasonsModel(reasons: inRideMapBloc.cancelReasons[index],);
                  },
                ),
              ),
              TextFormField(
                maxLines: 4,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                    border: OutlineInputBorder(
                      // Add border
                      borderSide: BorderSide(width: 0.5.w, color: inRideMapBloc.cancelReasonController.text.isNotEmpty ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor),
                      borderRadius: BorderRadius.circular(12.r), // Add border radius
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.w, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    hintText: "Description", // Hint text
                    hintStyle: Theme.of(context).textTheme.bodyMedium
                ),
              ),
              addHeight(24.h),
              CustomButton(title: "Submit", onTap: (){},borderColor: Theme.of(context).primaryColor,),
              
            ],
          );
        },
      ),
    );
  }
}
