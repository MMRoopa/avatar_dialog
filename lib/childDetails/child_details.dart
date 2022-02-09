import 'package:auto_size_text/auto_size_text.dart';
import 'package:avatar_dialog/avatarDialog/avatar_dialog.dart';
import 'package:avatar_dialog/gradeDialog/grade_dialog.dart';
import 'package:avatar_dialog/langDialog/lang_dialog.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ChildDetails extends StatefulWidget {
  const ChildDetails({Key? key}) : super(key: key);

  @override
  _ChildDetailsState createState() => _ChildDetailsState();
}

class _ChildDetailsState extends State<ChildDetails> {
  final langController = TextEditingController();
  final gradeController = TextEditingController();
  bool isCheckedHelpOnWhatsApp = false;
  String langResult = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 38.0, bottom: 92.0, left: 23.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const ImageIcon(
                    AssetImage("assets/images/round_arrow_back.png"),
                    size: 24.0,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 59.0),
                  child: const AutoSizeText(
                    "Child Details",
                    style: TextStyle(
                      color: Color(0xFF2B2B2B),
                      fontSize: 26.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    minFontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 38.0, right: 38.0, bottom: 20.0),
            child: const AutoSizeText(
              "Help us build the best learning experience for your child",
              style: TextStyle(
                color: Color(0xFF2B2B2B),
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              minFontSize: 6.0,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.3,
                    width: MediaQuery.of(context).size.width * 0.3,
                    margin: const EdgeInsets.only(bottom: 9.0),
                    child: Card(
                      shape: const CircleBorder(
                        side: BorderSide.none,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 14.0, 10.0, 10.0),
                        child: Image.asset(
                          'assets/images/group_30368.png',
                          height: MediaQuery.of(context).size.width * 0.25,
                          width: MediaQuery.of(context).size.width * 0.25,
                          fit: BoxFit.fill,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 40.0),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AvatarDialog(),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 30.0,
                        width: 134.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFFD5E3FF),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 5.0, 13.0, 4.0),
                          child: Row(
                            children: const [
                              AutoSizeText(
                                'Select Avatar',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xFF1353CB),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                                maxLines: 1,
                                minFontSize: 6.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: Color(0xFF1353CB),
                                  size: 8.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(19, 40, 18, 20),
                    child: TextField(
                      decoration: kTextFieldDecoration.copyWith(
                        labelText: 'Child’s Nick Name*',
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(19, 20, 18, 20),
                    child: TextField(
                      readOnly: true,
                      controller: gradeController,
                      decoration: kTextFieldDecoration.copyWith(
                        labelText: 'Grade*',
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF1353CB),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const GradeDialog(),
                        ).then((val) {
                          setState(() {
                            gradeController.text = val;
                          });
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(19, 20, 18, 20),
                    child: TextField(
                      decoration:
                          kTextFieldDecoration.copyWith(labelText: 'City'),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(19, 20, 18, 20),
                    child: TextField(
                      decoration: kTextFieldDecoration.copyWith(
                        labelText: 'School',
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(19, 20, 18, 20),
                    child: TextField(
                      readOnly: true,
                      controller: langController,
                      decoration: kTextFieldDecoration.copyWith(
                        labelText: 'Language',
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF1353CB),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const LangDialog();
                          },
                        ).then((val) {
                          setState(() {
                            langController.text = val;
                          });
                        });
                      },
                      onChanged: (value) {
                        value = langResult;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 37),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: const Color(0xFF1353CB),
                            shape: const CircleBorder(),
                            side: const BorderSide(color: Color(0xFF1353CB)),
                            value: isCheckedHelpOnWhatsApp,
                            onChanged: (bool? value) {
                              setState(() {
                                isCheckedHelpOnWhatsApp = value!;
                              });
                            },
                          ), //Che
                          TextButton(
                            onPressed: () {
                              setState(() {
                                if (isCheckedHelpOnWhatsApp) {
                                  isCheckedHelpOnWhatsApp = false;
                                } else {
                                  isCheckedHelpOnWhatsApp = true;
                                }
                              });
                            },
                            child: const AutoSizeText(
                              'Get instant help on Whatsapp',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFF1353CB),
                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              minFontSize: 6.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 19.0, right: 18.0, bottom: 64.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 60.0,
                width: 338.0,
                child: const AutoSizeText(
                  'START TRIAL',
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
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1568E580),
                      blurRadius: 10.0,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
