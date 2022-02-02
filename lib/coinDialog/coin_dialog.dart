import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DialogPopUp extends StatelessWidget {
  const DialogPopUp({
    Key? key,
  }) : super(key: key);

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
        height: MediaQuery.of(context).size.height * 0.55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: AutoSizeText(
                "My Coins",
                style: TextStyle(
                  color: Color(0xFF2DAD9D),
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(28.0, 20.0, 40.0, 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/group_70577.png",
                    width: 32.0,
                    height: 32.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          AutoSizeText(
                            'Flxegem',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          AutoSizeText(
                            'This contains all of your green and blue gems',
                            style: TextStyle(
                              color: Color(0xFF707070),
                              fontSize: 14.0,
                              fontFamily: 'Poppins',
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(23.0, 0.0, 22.0, 40.0),
              padding: const EdgeInsets.fromLTRB(13.0, 26.0, 13.0, 26.0),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xFFFFDC00),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  AutoSizeText(
                    'The fun way to spend your earnings is coming soon!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 22.0,
                  ),
                  AutoSizeText(
                    'Till then try earn as many as possible',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
