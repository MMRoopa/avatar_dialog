import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  String phoneNumber = "";
  String? selectedCountry = '+91';
  bool enableContinue = false;
  TextEditingController myController = TextEditingController();

  List<String> countryList = [
    '+91',
    '+1',
    '+61',
  ];

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
          numberEditor(context),
          termsConditions(),
          continueBtn(context),
        ],
      ),
    );
  }

  Container numberEditor(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 61.h,
      width: 341.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF1353CB),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 12.h, 15.w, 12.h),
            child: SizedBox(
              width: 80.w,
              height: 30.h,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                  isDense: true,
                  elevation: 5,
                  icon: const Icon(
                    Icons.arrow_drop_down_sharp,
                    color: Colors.black,
                  ),
                  value: selectedCountry,
                  items: countryList.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedCountry = value!;
                    });
                  },
                ),
              ),
            ),
          ),
          VerticalDivider(
            color: const Color(0xFF707070),
            thickness: 1,
            indent: 10.h,
            endIndent: 10.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 15.w),
            width: 130.w,
            child: TextField(
              controller: myController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Phone number',
              ),
              onChanged: (String value) {
                setState(() {
                  if (value.length >= 10) {
                    enableContinue = true;
                    phoneNumber = value;
                  } else {
                    enableContinue = false;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Container continueBtn(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 46.w, right: 45.w, bottom: 30.h),
      child: enableContinue
          ? GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 60.h,
                width: 284.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'CONTINUE',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                      maxLines: 1,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.white,
                      size: 28.h,
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF1353CB),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
              ),
            )
          : Container(
              alignment: Alignment.center,
              height: 60.h,
              width: 284.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CONTINUE',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                    maxLines: 1,
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Colors.white,
                    size: 28.h,
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                color: Color(0xFFB1B1B1),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
    );
  }

  Container termsConditions() {
    return Container(
        height: 37.h,
        margin: EdgeInsets.only(top: 109.h, bottom: 31.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'By tapping on continue,',
              style: TextStyle(
                color: const Color(0xFF2B2B2B),
                fontSize: 12.sp,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'I accept the ',
                  style: TextStyle(
                    color: const Color(0xFF2B2B2B),
                    fontSize: 12.sp,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Terms & Conditions.',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: const Color(0xFF1353CB),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Container pageText() {
    return Container(
      height: 43.h,
      margin: EdgeInsets.only(top: 36.h, bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Welcome to Flexagn!',
            style: TextStyle(
              color: const Color(0xFF2B2B2B),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          Text(
            'Please Enter your mobile number to proceed',
            style: TextStyle(
              color: const Color(0xFF2B2B2B),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ],
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

  Container titleWidget(BuildContext context) {
    return Container(
      height: 36.h,
      width: 375.w,
      margin: EdgeInsets.only(top: 38.h, bottom: 33.h),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 23.w, top: 5.h),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: const Color(0xFF2B2B2B),
                size: 28.h,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Hello Parents",
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
