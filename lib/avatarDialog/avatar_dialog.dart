import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
                "Select Avatar",
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
                margin: const EdgeInsets.fromLTRB(15.0, 22.0, 15.0, 25.0),
                child: GridView.builder(
                    physics: const ScrollPhysics(),
                    controller: controller,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 14,
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
                            height: MediaQuery.of(context).size.width * 0.3,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Stack(children: <Widget>[
                              Card(
                                shape: const CircleBorder(
                                  side: BorderSide.none,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 14.0, 10.0, 10.0),
                                  child: Image.asset(
                                    'assets/images/group_30368.png',
                                    height: MediaQuery.of(context).size.width *
                                        0.25,
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 15,
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
              margin: const EdgeInsets.only(bottom: 21.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
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
