import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class LangDialog extends StatefulWidget {
  const LangDialog({Key? key}) : super(key: key);

  @override
  _LangDialogState createState() => _LangDialogState();
}

class _LangDialogState extends State<LangDialog> {
  final AutoScrollController controller = AutoScrollController();

  final List<String> _list = [
    'हिन्दी',
    'বাংলা',
    'ਪੰਜਾਬੀ',
    'ಕನ್ನಡ',
    'தமிழ்',
    'తెలుగు',
    'मराठी',
    'اردو',
    'മലയാളം',
    'Others'
  ];

  int lastSelectedIndex = 12;
  String selectedLanguage = '';

  Future _scrollToIndex(int index) async {
    await controller.scrollToIndex(index,
        duration: const Duration(milliseconds: 1500),
        preferPosition: AutoScrollPosition.begin);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollToIndex(lastSelectedIndex);
  }

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
                "Select Language",
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
                margin: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 20.h),
                child: GridView.builder(
                    physics: const ScrollPhysics(),
                    controller: controller,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 15.w,
                      childAspectRatio: 1 / 0.6,
                    ),
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      bool checked = (index == lastSelectedIndex);
                      return AutoScrollTag(
                        controller: controller,
                        index: lastSelectedIndex,
                        key: ValueKey(lastSelectedIndex),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              lastSelectedIndex = index;
                              selectedLanguage = _list[index];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFBFBFBF)),
                              shape: BoxShape.rectangle,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            child: Stack(children: <Widget>[
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
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.w, right: 8.w),
                                    child: Text(
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
                        ),
                      );
                    }),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 21.h),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, selectedLanguage);
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
