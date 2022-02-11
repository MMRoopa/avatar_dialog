import 'package:avatar_dialog/avatarDialog/avatar_dialog.dart';
import 'package:avatar_dialog/gradeDialog/grade_dialog.dart';
import 'package:avatar_dialog/langDialog/lang_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';

class ChildDetails extends StatefulWidget {
  const ChildDetails({Key? key}) : super(key: key);

  @override
  _ChildDetailsState createState() => _ChildDetailsState();
}

class _ChildDetailsState extends State<ChildDetails> {
  final langController = TextEditingController();
  final gradeController = TextEditingController();
  bool isCheckedHelpOnWhatsApp = false;
  String langResult = '';
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(375, 896),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 36.h,
            width: 375.w,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 38.h, bottom: 92.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 23.w),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const ImageIcon(
                      AssetImage("assets/images/round_arrow_back.png"),
                      size: 24.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 59.w, right: 105.w),
                  child: Text(
                    "Child Details",
                    style: TextStyle(
                      color: const Color(0xFF2B2B2B),
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                    textScaleFactor: 1,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 38.h,
            width: 300.w,
            margin: EdgeInsets.only(left: 38.w, right: 38.w, bottom: 20.h),
            child: Text(
              'Help us build the best learning experience for your child',
              style: TextStyle(
                color: const Color(0xFF2B2B2B),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
              textScaleFactor: 1,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 108.h,
                    width: 108.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    margin: EdgeInsets.only(bottom: 9.h),
                    child: Image.asset(
                      'assets/images/group_30368.png',
                      height: 82.h,
                      width: 88.w,
                      //  fit: BoxFit.fill,
                      alignment: Alignment.center,
                    ),
                  ),
                  Container(
                    height: 30.h,
                    width: 134.w,
                    margin: EdgeInsets.only(bottom: 40.h),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD5E3FF),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AvatarDialog(),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 5.w),
                            child: Text(
                              'Select Avatar',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF1353CB),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(
                            child: Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: Color(0xFF1353CB),
                              size: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 338.w,
                    margin:
                        EdgeInsets.only(left: 19.w, right: 18.w, bottom: 20.h),
                    child: TextField(
                      decoration: kTextFieldDecoration.copyWith(
                        labelText: 'Child’s Nick Name*',
                        labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 16.sp,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 338.w,
                    margin:
                        EdgeInsets.only(left: 19.w, right: 18.w, bottom: 20.h),
                    child: TextField(
                      readOnly: true,
                      controller: gradeController,
                      decoration: kTextFieldDecoration.copyWith(
                        labelText: 'Grade*',
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF1353CB),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 16.sp,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const GradeDialog(),
                        ).then((val) {
                          setState(() {
                            gradeController.text = val;
                          });
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 338.w,
                    margin:
                        EdgeInsets.only(left: 19.w, right: 18.w, bottom: 20.h),
                    child: TextField(
                      decoration: kTextFieldDecoration.copyWith(
                        labelText: 'City',
                        labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 16.sp,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 338.w,
                    margin:
                        EdgeInsets.only(left: 19.w, right: 18.w, bottom: 40.h),
                    child: TextField(
                      decoration: kTextFieldDecoration.copyWith(
                        labelText: 'School',
                        labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 16.sp,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 19.w, right: 18.w, bottom: 40.h),
                      child: TextField(
                        readOnly: true,
                        controller: langController,
                        decoration: kTextFieldDecoration.copyWith(
                          labelText: 'Language',
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF1353CB),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: ScreenUtil().setSp(16),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(16),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const LangDialog();
                            },
                          ).then((val) {
                            setState(() {
                              langController.text = val;
                            });
                          });
                        },
                        onChanged: (value) {
                          value = langResult;
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 23.h,
                    width: 256.w,
                    margin: EdgeInsets.only(bottom: 37.h),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isCheckedHelpOnWhatsApp) {
                            isCheckedHelpOnWhatsApp = false;
                          } else {
                            isCheckedHelpOnWhatsApp = true;
                          }
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 16.w,
                            height: 16.h,
                            child: Checkbox(
                              checkColor: Colors.white,
                              activeColor: const Color(0xFF1353CB),
                              shape: const CircleBorder(),
                              side: const BorderSide(color: Color(0xFF1353CB)),
                              value: isCheckedHelpOnWhatsApp,
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheckedHelpOnWhatsApp = value!;
                                });
                              },
                            ),
                          ), //Che
                          Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: Text(
                              'Get instant help on Whatsapp',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: const Color(0xFF1353CB),
                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60.h,
            width: 338.w,
            margin: EdgeInsets.only(bottom: 64.h),
            decoration: const BoxDecoration(
              color: Color(0xFF1353CB),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              boxShadow: [
                BoxShadow(
                  color: Color(0x1568E580),
                  blurRadius: 10.0,
                )
              ],
            ),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'START TRIAL',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
