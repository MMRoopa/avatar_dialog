import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  List<Map> items = [
    {
      'id': '1',
      'icon': 'assets/images/Bookmark.png',
      'title': 'Bookmarks',
    },
    {
      'id': '2',
      'icon': 'assets/images/Achievements.png',
      'title': 'Achievements',
    },
    {
      'id': '3',
      'icon': 'assets/images/Contact.png',
      'title': 'Contact Us',
    },
    {
      'id': '4',
      'icon': 'assets/images/T&C.png',
      'title': 'Terms & Conditions',
    },
    {
      'id': '5',
      'icon': 'assets/images/Policy.png',
      'title': 'Privacy Policy',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: const Text('Drawer')),
        body: const Center(
          child: Text('My Page!'),
        ),
        drawer: SizedBox(
          height: 786.h,
          width: 314.w,
          child: Drawer(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),

            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: Stack(
              children: [
                Column(
                  children: <Widget>[
                    header(context),
                    listItems(),
                    footerImage(),
                  ],
                ),
                Transform.translate(
                  offset: Offset(334.w, 0.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Container listItems() {
    return Container(
      height: 543.h,
      width: 293.w,
      margin: EdgeInsets.only(left: 10.w, right: 10.w),
      alignment: AlignmentDirectional.centerStart,
      child: ListView.builder(
          itemCount: 5, //items.length,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              contentPadding: EdgeInsets.only(
                  left: 14.w, top: 5.h, right: 10.w, bottom: 5.h),
              minVerticalPadding: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              selectedTileColor: const Color(0xFFEFF0FF),
              trailing: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                child: const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              horizontalTitleGap: 10.w,
              title: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                child: Text(
                  items[index]['title'],
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF2B2B2B),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              minLeadingWidth: 24.w,
              leading: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                child: Image.asset(
                  items[index]["icon"],
                  fit: BoxFit.scaleDown,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            );
          }),
    );
  }

  SizedBox footerImage() {
    return SizedBox(
      width: 314.w,
      height: 114.h,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20)),
        child: Image.asset(
          "assets/images/group_31.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  GestureDetector header(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 98.h,
        width: 293.w,
        margin: EdgeInsets.fromLTRB(11.w, 11.h, 10.w, 20.h),
        child: DrawerHeader(
          padding: const EdgeInsets.all(0.0),
          margin: const EdgeInsets.all(0.0),
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 75.h,
                width: 75.w,
                margin: EdgeInsets.fromLTRB(10.w, 11.h, 8.w, 11.h),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  'assets/images/group_30368.png',
                  height: 61.h,
                  width: 57.w,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(
                width: 165.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi Ranveer',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      maxLines: 2,
                    ),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      maxLines: 1,
                    ),
                    Text(
                      '6th Grade',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          color: Colors.white),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10.w),
                child: const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
