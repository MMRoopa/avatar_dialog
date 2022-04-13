import 'package:avatar_dialog/purchase_dialog/otp_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurchaseDialog extends StatefulWidget {
  const PurchaseDialog({Key? key}) : super(key: key);

  @override
  _PurchaseDialogState createState() => _PurchaseDialogState();
}

class _PurchaseDialogState extends State<PurchaseDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFFFFFFF),
      alignment: Alignment.bottomCenter,
      insetPadding: EdgeInsets.only(left: 11.w, right: 10.w, bottom: 12.h),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Container(
        height: 510.h,
        width: 354.w,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            title(),
            blueJeansCap(),
            text(),
            number(),
            continueBtn(context),
          ],
        ),
      ),
    );
  }

  Container continueBtn(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => const OtpDialog(),
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: 51.h,
          width: 245.w,
          child: Text(
            'CONTINUE',
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
            maxLines: 1,
          ),
          decoration: const BoxDecoration(
            color: Color(0xFF1452CA),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
        ),
      ),
    );
  }

  Container number() {
    return Container(
      height: 24.h,
      width: 138.w,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 99.h),
      child: Text(
        "+91-9717311486",
        style: TextStyle(
          color: const Color(0xFF2B2B2B),
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
        ),
        textAlign: TextAlign.center,
        maxLines: 1,
      ),
    );
  }

  Container text() {
    return Container(
      height: 41.h,
      width: 326.w,
      margin: EdgeInsets.fromLTRB(14.w, 15.h, 14.w, 10.h),
      child: Text(
        "We will send an OTP to your registered number (mention below) to confirm purchase",
        style: TextStyle(
            color: const Color(0xFFB1B1B1),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            height: 1.5),
        textAlign: TextAlign.center,
        maxLines: 2,
      ),
    );
  }

  Container blueJeansCap() {
    return Container(
      height: 100.h,
      width: 294.w,
      margin: EdgeInsets.only(
        left: 30.w,
        right: 30.w,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFF2F6FF),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15.w, 12.h, 34.w, 12.h),
            child: Image.asset(
              'assets/images/Group_5838.png',
              height: 76.h,
              width: 71.w,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Blue jeans Cap",
                  style: TextStyle(
                    color: const Color(0xFF3C3C3C),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    Text(
                      "For",
                      style: TextStyle(
                        color: const Color(0xFF2B2B2B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                    Image.asset(
                      "assets/images/Group_5839.png",
                      width: 32.0,
                      height: 32.0,
                    ),
                    Text(
                      "200 Flxegem",
                      style: TextStyle(
                        color: const Color(0xFF2B2B2B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container title() {
    return Container(
      height: 71.h,
      width: 188.w,
      margin: EdgeInsets.only(top: 39.h, bottom: 30.h),
      child: Text(
        "Purchase confirmation",
        style: TextStyle(
          color: const Color(0xFF2B2B2B),
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
          height: 1.0,
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
      ),
    );
  }
}
