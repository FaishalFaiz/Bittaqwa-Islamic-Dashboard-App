// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bitaqwa_app/utils/color.dart';

class DetailDoa extends StatelessWidget {
  final String title;
  final String arabicText;
  final String translation;
  final String reference;
  const DetailDoa({
    Key? key,
    required this.title,
    required this.arabicText,
    required this.translation,
    required this.reference,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text(
          "Doa",
          style: TextStyle(
            fontFamily: "PoppinsMedium",
            color: ColorApp.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ColorApp.white,
          ),
        ),
      ),
      // body
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_detail_doa.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(33),
            padding: EdgeInsets.all(23),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorApp.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200]!,
                  spreadRadius: 5,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  title,
                  style: TextStyle(
                    fontFamily: "PoppinsBold",
                    fontSize: 24,
                    color: ColorApp.text,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  arabicText,
                  style: TextStyle(
                    fontFamily: "PoppinsRegular",
                    fontSize: 24,
                    color: ColorApp.text,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  translation,
                  style: TextStyle(
                    fontFamily: "PoppinsRegular",
                    fontSize: 16,
                    color: Colors.blue[200],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  reference,
                  style: TextStyle(
                    fontFamily: "PoppinsRegular",
                    fontSize: 13,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
