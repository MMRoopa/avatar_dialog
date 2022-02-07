import 'dart:core';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class LangDialog extends StatefulWidget {
  const LangDialog({Key? key}) : super(key: key);

  @override
  _LangDialogState createState() => _LangDialogState();
}

class _LangDialogState extends State<LangDialog> {
  final AutoScrollController controller = AutoScrollController();

  final List<String> _list = [
    'Hindi',
    'Bengali',
    'Punjabi',
    'Kannada',
    'Tamil',
    'Telugu',
    'Marathi',
    'Urdu',
    'Malayalam',
    'Others'
  ];

  int lastSelectedIndex = 12;

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
      insetPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(35.0)),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.65,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 44.0),
              child: const AutoSizeText(
                "Select Language",
                style: TextStyle(
                  color: Color(0xFF1353CB),
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                minFontSize: 18.0,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    left: 15.0, top: 20.0, right: 15.0, bottom: 20.0),
                child: GridView.builder(
                    physics: const ScrollPhysics(),
                    controller: controller,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
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
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: AutoSizeText(
                                      _list[index],
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,
                                        color: checked
                                            ? Colors.white
                                            : const Color(0XFF5F5200),
                                      ),
                                      minFontSize: 20.0,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Offstage(
                                  offstage: !checked,
                                  child: const Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                    size: 20.0,
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
              margin: const EdgeInsets.only(bottom: 21.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: 243.0,
                  child: const AutoSizeText(
                    'CONTINUE',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                    maxLines: 1,
                    minFontSize: 12.0,
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
