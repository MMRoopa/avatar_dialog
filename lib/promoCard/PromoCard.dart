import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PromoCard extends StatefulWidget {
  final Function() onButtonClickCallback;
  const PromoCard({Key? key, required this.onButtonClickCallback})
      : super(key: key);

  @override
  State<PromoCard> createState() => _PromoCardState();
}

class _PromoCardState extends State<PromoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Color(0xFFFFEDF5)),
      height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              "assets/images/group_6075.png",
              width: MediaQuery.of(context).size.width * 0.40,
              height: MediaQuery.of(context).size.width * 0.40,
              alignment: Alignment.center,
            ),
          ),
          const AutoSizeText.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(text: 'Online '),
                TextSpan(
                    text: 'Parent Teachers ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'Meeting'),
              ],
            ),
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
            maxLines: 1,
            minFontSize: 12,
          ),
          const AutoSizeText(
            'Caption related to the above subject could come here',
            style: TextStyle(
              color: Color(0xFF6F6F6F),
              fontSize: 12.0,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.left,
            maxLines: 1,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
            child: GestureDetector(
              onTap: () {
                widget.onButtonClickCallback();
                // call game play home screen
              },
              child: Container(
                alignment: Alignment.center,
                height: 32.0,
                width: 100.0,
                child: const AutoSizeText(
                  'EXPLORE',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                  maxLines: 1,
                ),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(60.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
