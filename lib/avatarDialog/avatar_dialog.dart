import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class AvatarDialog extends StatefulWidget {
  const AvatarDialog({Key? key}) : super(key: key);

  @override
  State<AvatarDialog> createState() => _AvatarDialogState();
}

class _AvatarDialogState extends State<AvatarDialog> {
  final AutoScrollController controller = AutoScrollController();
  int listLength = 30;

  int lastSelectedIndex = 20;

  Future _scrollToIndex(int index) async {
    await controller.scrollToIndex(index,
        duration: const Duration(milliseconds: 1500),
        preferPosition: AutoScrollPosition.begin);
  }

  @override
  void initState() {
    super.initState();

    _scrollToIndex(lastSelectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(
    //     BoxConstraints(
    //         maxWidth: MediaQuery.of(context).size.width,
    //         maxHeight: MediaQuery.of(context).size.height),
    //     designSize: const Size(375, 896),
    //     context: context,
    //     minTextAdapt: true,
    //     orientation: Orientation.portrait);
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
                "Select Avatar",
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
                margin: EdgeInsets.fromLTRB(15.w, 22.h, 15.w, 25.h),
                child: GridView.builder(
                    physics: const ScrollPhysics(),
                    controller: controller,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5.h,
                      crossAxisSpacing: 14.w,
                    ),
                    itemCount: listLength,
                    itemBuilder: (context, index) {
                      bool checked = (index == lastSelectedIndex);
                      return AutoScrollTag(
                        controller: controller,
                        index: lastSelectedIndex,
                        key: ValueKey(lastSelectedIndex),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              lastSelectedIndex = index;
                            });
                          },
                          child: SizedBox(
                            height: 100.h,
                            width: 100.w,
                            child: Stack(children: <Widget>[
                              Card(
                                shape: const CircleBorder(
                                  side: BorderSide.none,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      10.w, 14.h, 10.w, 10.h),
                                  child: Image.asset(
                                    'assets/images/group_30368.png',
                                    height: 76.h,
                                    width: 81.w,
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5.h,
                                right: 15.w,
                                child: Offstage(
                                  offstage: !checked,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.orangeAccent,
                                        shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
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
                  Navigator.pop(context);
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
