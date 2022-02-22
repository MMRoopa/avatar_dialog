import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key}) : super(key: key);

  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final CustomTimerController _timerController = CustomTimerController();
  bool enableContinue = false;
  bool enableResend = false;
  bool wrongCode = false;
  //Color errorCodeBorder = const Color(0xFFFF0000);
  String otp = '1234';

  @override
  void dispose() {
    _timerController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _timerController.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          titleWidget(context),
          image(),
          pageText(),
          phoneNumber(context),
          otpEditor(context),
          errorText(),
          resendText(),
          continueBtn(context),
        ],
      ),
    );
  }

  Container errorText() {
    return Container(
      height: 20.h,
      margin: EdgeInsets.only(top: 15.h),
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
          : null,
    );
  }

  Container continueBtn(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 46.w, right: 45.w, bottom: 46.h),
      child: enableContinue | enableResend
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                height: 60.h,
                width: 284.w,
                child: Text(
                  enableResend ? 'RESEND >' : 'CONTINUE',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                  maxLines: 1,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF1353CB),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  boxShadow: [
                    BoxShadow(color: Color(0xFF1568E5), blurRadius: 10.0)
                  ],
                ),
              ),
            )
          : Container(
              alignment: Alignment.center,
              height: 60.h,
              width: 284.w,
              child: Text(
                'CONTINUE >',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
                maxLines: 1,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFFB1B1B1),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
    );
  }

  Container otpEditor(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40.w, right: 40.w),
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        obscureText: false,
        pinTheme: PinTheme(
          fieldOuterPadding: EdgeInsets.only(right: 10.w),
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(6.0),
          fieldHeight: 50.h,
          fieldWidth: 61.w,
          // selectedColor: const Color(0xFF1353CB),
          activeColor:
              wrongCode ? const Color(0xFFFF0000) : const Color(0xFF1353CB),
          activeFillColor: Colors.white,
          inactiveColor: const Color(0xFF1353CB),
        ),
        animationDuration: const Duration(milliseconds: 300),
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          setState(() {
            if (value != otp.substring(0, value.length)) {
              wrongCode = true;
            } else {
              wrongCode = false;
            }
          });
        },
        onCompleted: (String value) {
          setState(() {
            if (value == otp) {
              enableContinue = true;
            }
          });
        },
      ),
    );
  }

  Container resendText() {
    return Container(
      height: 20.h,
      margin: EdgeInsets.only(top: 245.h, bottom: 31.h),
      child: enableResend
          ? Text(
              'Didn’t receive the OTP? Resend',
              style: TextStyle(
                color: const Color(0xFF2B2B2B),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Resend Code in ',
                  style: TextStyle(
                    color: const Color(0xFF2B2B2B),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                CustomTimer(
                    controller: _timerController,
                    begin: const Duration(seconds: 45),
                    end: const Duration(),
                    onChangeState: (state) {
                      if (state == CustomTimerState.finished) {
                        setState(() {
                          enableResend = true;
                        });
                      }
                    },
                    builder: (remaining) {
                      return Text(
                        remaining.seconds,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      );
                    }),
                Text(
                  ' seconds',
                  style: TextStyle(
                    color: const Color(0xFF2B2B2B),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ],
            ),
    );
  }

  Container pageText() {
    return Container(
      height: 20.h,
      margin: EdgeInsets.only(top: 33.h, bottom: 12.h),
      child: Text(
        'Enter the 4-digit code sent to you at',
        style: TextStyle(
          color: const Color(0xFF2B2B2B),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
        ),
        textAlign: TextAlign.center,
        maxLines: 1,
      ),
    );
  }

  Container image() {
    return Container(
      width: 155.w,
      height: 150.h,
      alignment: Alignment.center,
      child: Image.asset(
        "assets/images/group_70216.png",
        alignment: Alignment.center,
        fit: BoxFit.fill,
      ),
    );
  }

  Container phoneNumber(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.h, bottom: 30.h),
      alignment: Alignment.center,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.pop(context);
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            '+91 98768 76509',
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFF1353CB),
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.sp),
            child: const Icon(
              Icons.edit,
              color: Color(0xFF1353CB),
              size: 18.0,
            ),
          ),
        ]),
      ),
    );
  }

  Container titleWidget(BuildContext context) {
    return Container(
      height: 36.h,
      width: 375.w,
      margin: EdgeInsets.only(top: 38.h, bottom: 33.h),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 23.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Color(0xFF2B2B2B),
                size: 24.0,
              ),
            ),
          ),
          Center(
            child: Text(
              "Phone verification",
              style: TextStyle(
                color: const Color(0xFF2B2B2B),
                fontSize: 26.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
