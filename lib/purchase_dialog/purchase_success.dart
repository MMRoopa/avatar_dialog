import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurchaseSuccess extends StatefulWidget {
  const PurchaseSuccess({Key? key}) : super(key: key);

  @override
  _PurchaseSuccessState createState() => _PurchaseSuccessState();
}

class _PurchaseSuccessState extends State<PurchaseSuccess> {
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
        },
        child: Container(
          alignment: Alignment.center,
          height: 51.h,
          width: 245.w,
          child: Text(
            'OKAY',
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

  Container text() {
    return Container(
      height: 41.h,
      width: 224.w,
      margin: EdgeInsets.fromLTRB(14.w, 40.h, 14.w, 108.h),
      child: Text(
        "Dummy text, final text will come at this place",
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
            padding: EdgeInsets.fromLTRB(15.w, 18.h, 25.w, 1.h),
            child: Image.asset(
              'assets/images/Group_5838.png',
              height: 76.h,
              width: 71.w,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 12.h),
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
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  "Purchased",
                  style: TextStyle(
                    color: const Color(0xFF2DAD9D),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
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
        "Purchased successfully",
        style: TextStyle(
          color: const Color(0xFF2DAD9D),
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
