import 'package:flutter_svg/svg.dart';

import '../../../../common/const/colors.dart';
import '../../../../common/const/export.dart';
import '../../../../common/const/strings.dart';



class AccountType extends StatelessWidget {
  const AccountType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Choose one",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: 24.h, left: 12.w, right: 12, bottom: 54.h),
          child: Column(
            children: [
              SvgPicture.asset(
                AppAssets.proQuestion,
              ),
              Text(AppStrings.howDoYouWant,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center),
              addHeight(12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 18.h,
                      left: 16.w,
                      right: 16.w,
                      bottom: 16.h,
                    ),
                    width: 115.w,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.w, 2.h),
                          blurRadius: 10,
                          color: Color.fromRGBO(0, 0, 0, 0.06),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          AppAssets.passengerIcon,
                        ),
                        addHeight(16.h),
                        Text(
                          AppStrings.passenger,
                        ),
                      ],
                    ),
                  ),
                  addWidth(30.w),
                  Container(
                    padding: EdgeInsets.only(
                      top: 18.h,
                      left: 26.w,
                      right: 26.w,
                      bottom: 17.h,
                    ),
                    width: 115.w,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 2.h),
                          blurRadius: 10,
                          color: Color.fromRGBO(0, 0, 0, 0.06),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        /*SvgPicture.asset(
                              icDriverUn,
                            ),
                            addHeight(16.h),
                            Text(
                              "driver",
                            ),*/
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: 86.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(
                          width: 1.w, color: Theme.of(context).primaryColor)),
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
