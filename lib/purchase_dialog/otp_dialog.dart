import 'package:avatar_dialog/purchase_dialog/purchase_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpDialog extends StatefulWidget {
  const OtpDialog({Key? key}) : super(key: key);

  @override
  _OtpDialogState createState() => _OtpDialogState();
}

class _OtpDialogState extends State<OtpDialog> {
  bool wrongCode = false;
  String otpRecieved = '1234';
  String otpEntered = '';

  bool validateOTPOnContinue() {
    setState(() {
      if (otpEntered != otpRecieved) {
        wrongCode = true;
      } else {
        wrongCode = false;
      }
    });
    return wrongCode;
  }

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
            otpEditor(context),
            errorText(),
            continueBtn(context),
          ],
        ),
      ),
    );
  }

  Container continueBtn(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.h, bottom: 30.h),
      child: GestureDetector(
        onTap: () {
          if (validateOTPOnContinue() == false) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => const PurchaseSuccess(),
            );
          }
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
      margin: EdgeInsets.only(bottom: 10.h),
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
      height: 20.h,
      width: 254.w,
      margin: EdgeInsets.fromLTRB(14.w, 15.h, 14.w, 10.h),
      child: Text(
        "Enter the 4-digit code sent to you at",
        style: TextStyle(
            color: const Color(0xFF2B2B2B),
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

  Container otpEditor(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: 50.w,
        right: 50.w,
      ),
      child: PinCodeTextField(
        scrollPadding: const EdgeInsets.all(0.0),
        mainAxisAlignment: MainAxisAlignment.center,
        appContext: context,
        length: 4,
        obscureText: false,
        errorTextSpace: 10.h,
        pinTheme: PinTheme(
          fieldOuterPadding: EdgeInsets.only(left: 5.w, right: 5.w),
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(6.0),
          fieldHeight: 50.h,
          fieldWidth: 50.w,
          selectedColor:
              wrongCode ? const Color(0xFFFF0000) : const Color(0xFF1353CB),
          activeColor:
              wrongCode ? const Color(0xFFFF0000) : const Color(0xFF1353CB),
          activeFillColor: Colors.white,
          inactiveColor:
              wrongCode ? const Color(0xFFFF0000) : const Color(0xFF1353CB),
        ),
        animationDuration: const Duration(milliseconds: 300),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            if (value.length < 4) {
              // enableContinue = false;
            }
            wrongCode = false;
          });
        },
        onCompleted: (String value) {
          setState(() {
            // enableContinue = true;
          });

          otpEntered = value;
        },
      ),
    );
  }

  SizedBox errorText() {
    return SizedBox(
        height: 20.h,
        child: wrongCode
            ? Text(
                'Incorrect verification code',
                style: TextStyle(
                  color: const Color(0xFFFF0000),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              )
            : null);
  }
}
