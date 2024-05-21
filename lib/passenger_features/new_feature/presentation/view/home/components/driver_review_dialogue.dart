/*
import 'package:rideoptions/Common/Component/consts/consts.dart';
import 'package:rideoptions/Common/custom_widgets/custom_button.dart';

// ignore: must_be_immutable
class DriverReviewDialogue extends StatefulWidget {
  String? pictureUrl;
  String? totalFare;

  DriverReviewDialogue({this.pictureUrl, this.totalFare});

  @override
  State<DriverReviewDialogue> createState() => _DriverReviewDialogueState();
}

class _DriverReviewDialogueState extends State<DriverReviewDialogue> {
  int selectedStart = 0;
  bool selectedStartErrorVisible = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      contentPadding: EdgeInsets.all(25.r),
      content: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            SvgPicture.asset(
              icTick,
              width: 124.w,
              height: 124.h,
            ),
            SizedBox(
              width: 230.w,
              child: Center(
                child: AppText(
                  "You have reached your destination!",
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10),
            */
/*AppText(
              "Would you like to give a rating to your captain.",
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: greyColor,
            ),*//*

            AppText(
              "Give: ",
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: greyColor,
            ),
            SizedBox(height: 20),
            AppText(
              "${widget.totalFare}",
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  5,
                  (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedStart = index + 1;
                          });
                        },
                        child: selectedStart > index
                            ? Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 235, 213, 17),
                              )
                            : Icon(
                                Icons.star,
                                color: greyColor,
                              ),

                        //     Image.asset(
                        //   selectedStart > index
                        //       ? "assets/images/selected_star.png"
                        //       : "assets/images/unselected_star.png",
                        //   width: 25,
                        // ),
                      )),
            ),
            SizedBox(height: 15),
            Visibility(
              visible: selectedStartErrorVisible,
              child: AppText(
                "Please rate us before submitting.",
                color: redColor,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              title: 'Submit review',
              onTap: () {
                if (selectedStart != 0) {
                  Navigator.pop(context, selectedStart);
                } else {
                  setState(() {
                    selectedStartErrorVisible = true;
                  });
                }
              },
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: AppText(
                "Maybe Later",
                fontWeight: FontWeight.w700,
                color: blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
