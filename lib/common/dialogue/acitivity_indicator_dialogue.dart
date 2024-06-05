import 'package:flutter/material.dart';


loadingAlertDialog(
    {required BuildContext context, String? text, Color? color}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (ctx) {
      return WillPopScope(
        onWillPop: () async => true,
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 0.5,
                    blurRadius: 15,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(color ?? Theme.of(context).primaryColor),
                    strokeWidth: 2.5,
                  ),
                  const SizedBox(width: 25),
                  Text(
                    text ?? "Loading Please Wait...",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
