import 'package:avatar_dialog/avatarDialog/avatar_dialog.dart';
import 'package:avatar_dialog/childDetails/constants.dart';
import 'package:avatar_dialog/gradeDialog/grade_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final gradeController = TextEditingController(text: '10th');
  bool dataBackUpOnOff = false;
  bool chatBackUpOnOff = false;

  bool editPersonalInfo = false;
  bool editAccntInfo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title(context),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          backgroundBlendMode: BlendMode.color,
          image: DecorationImage(
            image: AssetImage("assets/images/base.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            avatar(context),
            personalInfo(),
            accountInfo(),
            subscription(),
            otherDetails(),
            version(),
            footerImage(),
          ],
        ),
      ),
    );
  }

  AppBar title(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_sharp,
          size: 22,
          color: Colors.black,
        ),
      ),
      title: Text(
        "My Profile",
        style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins'),
        maxLines: 1,
        textAlign: TextAlign.left,
      ),
      actions: [
        PopupMenuButton(
            padding: EdgeInsets.only(right: 14.w),
            offset: const Offset(-30, 40),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            icon: const Icon(
              Icons.more_vert_sharp,
              color: Colors.black,
              size: 24.0,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  height: 40.h,
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  value: 0,
                  child: Center(
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          color: const Color(0xFF2B2B2B),
                          fontSize: 16.sp,
                          fontFamily: 'Poppins'),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                Navigator.pop(context);
              }
            }),
      ],
    );
  }

  Container avatar(BuildContext context) {
    return Container(
      height: 190.h,
      width: 337.w,
      margin: EdgeInsets.fromLTRB(18.w, 20.h, 20.w, 10.h),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFC23FA1),
            Color(0xFFED615E),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 108.h,
            width: 108.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(top: 20.h, bottom: 10.h),
            child: Image.asset(
              'assets/images/group_30368.png',
              height: 82.h,
              width: 88.w,
              alignment: Alignment.center,
            ),
          ),
          Container(
            height: 30.h,
            width: 152.w,
            margin: EdgeInsets.only(bottom: 21.h),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.white,
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
                  Text(
                    'Change Avatar',
                    style: TextStyle(
                      color: const Color(0xFF1353CB),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: const Icon(
                      Icons.keyboard_arrow_right_sharp,
                      color: Color(0xFF1353CB),
                      size: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container footerImage() {
    return Container(
      width: 375.w,
      height: 95.h,
      margin: EdgeInsets.only(top: 76.h),
      child: Image.asset(
        "assets/images/group_31.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Container version() {
    return Container(
      height: 26.h,
      alignment: Alignment.center,
      child: Text(
        'Version: Flexgnv1.2',
        style: TextStyle(
            color: const Color(0xFF2B2B2B),
            fontSize: 16.sp,
            fontFamily: 'Poppins'),
        maxLines: 1,
      ),
    );
  }

  Container subscription() {
    return Container(
      height: 456.h,
      width: 337.w,
      margin: EdgeInsets.fromLTRB(18.w, 10.h, 20.w, 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFC9DCFF), width: 2.0),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(21.w, 20.h, 58.w, 12.h),
            child: Row(
              children: [
                Text(
                  'Subscription:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'),
                  maxLines: 1,
                ),
                Text(
                  ' Trial Expired',
                  style: TextStyle(
                      color: const Color(0xFFFF0000),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 21.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your free trial has expired.',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: 'Poppins'),
                  maxLines: 1,
                ),
                Text(
                  'Activate the full version to continue using the app.',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: 'Poppins'),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container otherDetails() {
    return Container(
      height: 234.h,
      width: 337.w,
      margin: EdgeInsets.fromLTRB(18.w, 10.h, 20.w, 25.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFC9DCFF), width: 2.0),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(21.w, 20.h, 19.w, 28.h),
            alignment: Alignment.centerLeft,
            child: Text(
              'Other Details',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins'),
              textAlign: TextAlign.left,
              maxLines: 1,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Image.asset(
                  'assets/images/Share.png',
                  fit: BoxFit.scaleDown,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 134.w),
                child: Text(
                  'Share the App',
                  style: TextStyle(
                      color: const Color(0xFF2B2B2B),
                      fontSize: 14.sp,
                      fontFamily: 'Poppins'),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 19.w),
                child: const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 28.h),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: Image.asset(
                    'assets/images/Data_backup.png',
                    fit: BoxFit.scaleDown,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 134.w),
                  child: Text(
                    'Data Back Up',
                    style: TextStyle(
                        color: const Color(0xFF2B2B2B),
                        fontSize: 14.sp,
                        fontFamily: 'Poppins'),
                    textAlign: TextAlign.left,
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 19.w),
                  child: FlutterSwitch(
                    width: 22.0,
                    height: 14.0,
                    activeSwitchBorder:
                        Border.all(color: const Color(0xFF2DAD9D)),
                    activeToggleColor: const Color(0xFF2DAD9D),
                    activeColor: Colors.white,
                    inactiveColor: Colors.white,
                    inactiveToggleColor: Colors.black,
                    inactiveSwitchBorder: Border.all(color: Colors.black),
                    toggleSize: 8.0,
                    value: dataBackUpOnOff,
                    borderRadius: 10.0,
                    padding: 2.0,
                    // showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        dataBackUpOnOff = val;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 28.h, bottom: 21.h),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: Image.asset(
                    'assets/images/Chat_backup.png',
                    fit: BoxFit.scaleDown,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 134.w),
                  child: Text(
                    'Chat Back Up',
                    style: TextStyle(
                        color: const Color(0xFF2B2B2B),
                        fontSize: 14.sp,
                        fontFamily: 'Poppins'),
                    textAlign: TextAlign.left,
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 19.w),
                  child: FlutterSwitch(
                    width: 22.0,
                    height: 14.0,
                    activeSwitchBorder:
                        Border.all(color: const Color(0xFF2DAD9D)),
                    activeToggleColor: const Color(0xFF2DAD9D),
                    activeColor: Colors.white,
                    inactiveColor: Colors.white,
                    inactiveToggleColor: Colors.black,
                    inactiveSwitchBorder: Border.all(color: Colors.black),
                    toggleSize: 8.0,
                    value: chatBackUpOnOff,
                    borderRadius: 10.0,
                    padding: 2.0,
                    // showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        chatBackUpOnOff = val;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container personalInfo() {
    return Container(
      height: 220.h,
      width: 337.w,
      margin: EdgeInsets.fromLTRB(18.w, 10.h, 20.w, 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFC9DCFF), width: 2.0),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Container(
            width: 295.w,
            margin: EdgeInsets.fromLTRB(21.w, 19.h, 16.w, 11.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal info',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'),
                  maxLines: 1,
                ),
                editPersonalInfo
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            editPersonalInfo = false;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 90.w),
                          child: Container(
                            alignment: Alignment.center,
                            height: 32.h,
                            width: 91.w,
                            child: Text(
                              'SAVE',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                              maxLines: 1,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xFF1353CB),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            editPersonalInfo = true;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 160.w),
                          child: const Icon(
                            Icons.edit_outlined,
                            size: 18.0,
                          ),
                        ),
                      ),
              ],
            ),
          ),
          Container(
            height: 50.h,
            width: 300.w,
            margin: EdgeInsets.fromLTRB(20.w, 10.h, 16.w, 10.h),
            child: TextField(
              readOnly: editPersonalInfo ? false : true,
              controller: TextEditingController(
                text: 'Ranveer Chauhan',
              ),
              decoration: kTextFieldDecoration.copyWith(
                labelText: 'Child’s Nick Name*',
                labelStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16.sp,
                  fontFamily: 'Poppins',
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Container(
            height: 50.h,
            width: 300.w,
            margin: EdgeInsets.fromLTRB(20.w, 10.h, 16.w, 23.h),
            child: TextField(
                readOnly: editPersonalInfo ? false : true,
                controller: gradeController,
                decoration: kTextFieldDecoration.copyWith(
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Color(0xFF1353CB),
                    size: 20.0,
                  ),
                  labelText: 'Grade',
                  labelStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 16.sp,
                    fontFamily: 'Poppins',
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontFamily: 'Poppins',
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
                }),
          ),
        ],
      ),
    );
  }

  Container accountInfo() {
    return Container(
      height: 220.h,
      width: 337.w,
      margin: EdgeInsets.fromLTRB(18.w, 10.h, 20.w, 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFC9DCFF), width: 2.0),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Container(
            width: 295.w,
            margin: EdgeInsets.fromLTRB(21.w, 20.h, 16.w, 9.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account info',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'),
                  maxLines: 1,
                ),
                editAccntInfo
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            editAccntInfo = false;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 90.w),
                          child: Container(
                            alignment: Alignment.center,
                            height: 32.h,
                            width: 91.w,
                            child: Text(
                              'SAVE',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                              maxLines: 1,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xFF1353CB),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            editAccntInfo = true;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 160.w),
                          child: const Icon(
                            Icons.edit_outlined,
                            size: 18.0,
                          ),
                        ),
                      ),
              ],
            ),
          ),
          Container(
            height: 50.h,
            width: 300.w,
            margin: EdgeInsets.fromLTRB(20.w, 10.h, 16.w, 10.h),
            child: TextField(
              readOnly: editAccntInfo ? false : true,
              controller: TextEditingController(text: "+91 9876543210"),
              keyboardType: TextInputType.number,
              decoration: kTextFieldDecoration.copyWith(
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16.sp,
                  fontFamily: 'Poppins',
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Container(
            height: 50.h,
            width: 300.w,
            margin: EdgeInsets.fromLTRB(20.w, 10.h, 16.w, 23.h),
            child: TextField(
              readOnly: editAccntInfo ? false : true,
              controller:
                  TextEditingController(text: 'Ashish.malhotra12@gmail.com'),
              keyboardType: TextInputType.emailAddress,
              decoration: kTextFieldDecoration.copyWith(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16.sp,
                  fontFamily: 'Poppins',
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
