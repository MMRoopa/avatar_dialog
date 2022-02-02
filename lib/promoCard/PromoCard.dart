import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PromoCard extends StatefulWidget {
  final Function() playHome;
  const PromoCard({Key? key, required this.playHome}) : super(key: key);

  @override
  State<PromoCard> createState() => _PromoCardState();
}

class _PromoCardState extends State<PromoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100.0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Color(0xFFFFEDF5)),
      height: MediaQuery.of(context).size.height * 0.40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              "assets/images/group_6075.png",
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.width * 0.45,
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
              color: Colors.black,
              fontSize: 12.0,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.left,
            maxLines: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: GestureDetector(
              onTap: () {
                widget.playHome();
                // call game play home screen
              },
              child: Container(
                alignment: Alignment.center,
                height: 36.0,
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
