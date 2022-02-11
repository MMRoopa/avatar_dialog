import 'dart:core';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
                "Select Grade",
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
                margin:
                    const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
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
                          height:
                              (MediaQuery.of(context).size.width * 0.3) * 0.83,
                          width: MediaQuery.of(context).size.width * 0.3,
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
                                    AutoSizeText(
                                      _list[index],
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,
                                        color: checked
                                            ? Colors.white
                                            : const Color(0XFF5F5200),
                                      ),
                                      maxLines: 1,
                                      minFontSize: 20.0,
                                    ),
                                    Transform.translate(
                                        offset: const Offset(2, -14),
                                        child: !lastIndex
                                            ? AutoSizeText(
                                                'th',
                                                style: TextStyle(
                                                  fontFamily: 'poppins',
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: checked
                                                      ? Colors.white
                                                      : const Color(0XFF5F5200),
                                                ),
                                                maxLines: 1,
                                                minFontSize: 6.0,
                                              )
                                            : null),
                                  ],
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
                      );
                    }),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 21.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, gradeSelected);
                },
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
