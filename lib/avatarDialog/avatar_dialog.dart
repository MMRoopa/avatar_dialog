import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class AvatarDialog extends StatefulWidget {
  const AvatarDialog({Key? key, required this.serverIndex}) : super(key: key);

  final int serverIndex;

  @override
  State<AvatarDialog> createState() => _AvatarDialogState();
}

class _AvatarDialogState extends State<AvatarDialog> {
  final AutoScrollController controller = AutoScrollController();
  int listLength = 30;

  int selectedIndex = -1;

  Future _scrollToIndex(int index) async {
    await controller.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    setState(() {
      selectedIndex = index - 1;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollToIndex(widget.serverIndex);
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
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 44.0),
                child: AutoSizeText(
                  "Select Avatar",
                  style: TextStyle(
                    color: Color(0xFF1353CB),
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(15.0, 22.0, 15.0, 25.0),
                child: GridView.builder(
                    physics: const ScrollPhysics(),
                    controller: controller,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                    ),
                    itemCount: listLength,
                    itemBuilder: (context, index) {
                      return AutoScrollTag(
                        controller: controller,
                        index: index,
                        key: ValueKey(index),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: SizedBox(
                            width: 100.0,
                            height: 100.0,
                            child: Card(
                                margin: const EdgeInsets.fromLTRB(
                                    7.0, 2.0, 7.0, 3.0),
                                color: (selectedIndex == index)
                                    ? Colors.blue
                                    : Colors.lime,
                                shape: const CircleBorder(
                                  side: BorderSide.none,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 14.0, 10.0, 10.0),
                                  child: Image.asset(
                                    'assets/images/group_30368.png',
                                    width: 81.0,
                                    height: 76.0,
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center,
                                  ),
                                )),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 21.0),
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
      ),
    );
  }
}
