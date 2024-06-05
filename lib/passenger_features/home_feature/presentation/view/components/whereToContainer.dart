import '../../../../../../common/const/export.dart';
import '../../bloc/homeBloc/home_bloc.dart';
import '../../bloc/homeBloc/home_state.dart';
import 'locationHisotoryTile.dart';

class WhereToContainer extends StatelessWidget {
  final VoidCallback onTap;
  List locationHistory  = [];
  WhereToContainer({super.key, required this.onTap,required this.locationHistory});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return BlocBuilder<HomeBloc, HomeState>(
  builder: (context, state) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 28.w),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          height: 55.h,
          width: 361.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            /*boxShadow: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 10.r,
                offset: Offset(0, 2.h),
                spreadRadius: 0,
              )
            ],*/
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: 24.sp,
              ),
              addWidth(12.w),
              Text(
                "${AppLocalizations.of(context)!.to}?",
                //"${homeBloc.pickLocationController.text??""}?",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              Expanded(
                flex: 2,
                child: ListView.separated(
                  itemCount: locationHistory.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(10.h),

                  itemBuilder: (context,index){
                    return LocationHistoryTile(address: locationHistory[index],);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10.w);
                  },
                ),
              ),

            ],
          )),
    );
  },
);
  }
}

