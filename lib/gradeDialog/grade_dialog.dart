import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradeDialog extends StatefulWidget {
  const GradeDialog({Key? key}) : super(key: key);

  @override
  _GradeDialogState createState() => _GradeDialogState();
}

class _GradeDialogState extends State<GradeDialog> {
  final List<String> _list = [
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    'K-5',
  ];
  int selectedIndex = -1;
  String gradeSelected = '';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFFFFFFF),
      alignment: Alignment.bottomCenter,
      insetPadding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(35.0)),
      ),
      child: SizedBox(
        height: 510.h,
        width: 355.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 44.h),
              child: Text(
                "Select Grade",
                style: TextStyle(
                  color: const Color(0xFF1353CB),
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.w,
                      crossAxisSpacing: 15.h,
                    ),
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      bool checked = (index == selectedIndex);
                      bool lastIndex = (index == (_list.length - 1));
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            if (lastIndex) {
                              gradeSelected = _list[index];
                            } else {
                              gradeSelected = _list[index] + 'th';
                            }
                          });
                        },
                        child: Container(
                          height: 80.h,
                          width: 95.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFBFBFBF)),
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: Stack(fit: StackFit.expand, children: <Widget>[
                            Card(
                              margin: const EdgeInsets.all(3.0),
                              color: checked
                                  ? const Color(0xFF2DAD9D)
                                  : const Color(0xFFFFF8C9),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _list[index],
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.bold,
                                        color: checked
                                            ? Colors.white
                                            : const Color(0XFF5F5200),
                                      ),
                                      maxLines: 1,
                                    ),
                                    Transform.translate(
                                        offset: const Offset(2, -14),
                                        child: !lastIndex
                                            ? Text(
                                                'th',
                                                style: TextStyle(
                                                  fontFamily: 'poppins',
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: checked
                                                      ? Colors.white
                                                      : const Color(0XFF5F5200),
                                                ),
                                                maxLines: 1,
                                              )
                                            : null),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8.h,
                              right: 8.w,
                              child: Offstage(
                                offstage: !checked,
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                  size: 20.h,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      );
                    }),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 21.h),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, gradeSelected);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.h,
                  width: 243.w,
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
                    color: Color(0xFF1353CB),
                    borderRadius: BorderRadius.all(Radius.circular(60.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
