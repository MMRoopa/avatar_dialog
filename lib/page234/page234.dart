import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Page234 extends StatefulWidget {
  const Page234({Key? key}) : super(key: key);

  @override
  State<Page234> createState() => _Page234State();
}

class _Page234State extends State<Page234> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  List<Map> carouselItems = [
    {
      'id': '1',
      'image': 'assets/images/creative_1.png',
      'heading': 'Build a Daily Habbit!',
      'subheading': 'Buckle up to enjoy your new learning adventure.',
    },
    {
      'id': '2',
      'image': 'assets/images/creative_2.png',
      'heading': 'Learn Together!',
      'subheading': 'Learning with friends is a real fun.',
    },
    {
      'id': '3',
      'image': 'assets/images/creative_3.png',
      'heading': 'Measure what you learn!',
      'subheading': 'Immerse yourself in something new everyday.',
    },
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          backgroundBlendMode: BlendMode.color,
          image: DecorationImage(
            image: AssetImage("assets/images/base.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 192.w,
              height: 28.h,
              margin: EdgeInsets.only(left: 91.w, top: 113.h, right: 91.w),
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/group_30878.png",
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 23.w, top: 33.h, right: 22.w),
                  child: CarouselSlider(
                    items: carouselItems
                        .map((Map item) =>
                            Builder(builder: (BuildContext context) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 300.h,
                                    width: 330.w,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(item['image']),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 28.h,
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                    child: Text(
                                      item['heading'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                    child: Text(
                                      item['subheading'],
                                      style: TextStyle(
                                        color: const Color(0xFF6F6F6F),
                                        fontSize: 14.sp,
                                        fontFamily: 'Poppins',
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              );
                            }))
                        .toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                      height: 379.h,
                      viewportFraction: 1,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: carouselItems.length,
                  effect: WormEffect(
                      spacing: 4.w,
                      dotHeight: 6.h,
                      dotWidth: 6.w,
                      type: WormType.thin,
                      dotColor: const Color(0xFFB7B7B7),
                      activeDotColor: const Color(0xFF1353CB)
                      // strokeWidth: 5,
                      ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 46.w, right: 45.w, top: 40.h),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60.h,
                  width: 284.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'GET STARTED',
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
              ),
            ),
            Container(
              width: 375.w,
              height: 138.h,
              margin: EdgeInsets.only(top: 69.h),
              child: Image.asset(
                "assets/images/group_31.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
