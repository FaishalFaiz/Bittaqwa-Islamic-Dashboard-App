import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  final String Sholat;
  final String Waktu;
  const Time({super.key, required this.Sholat, required this.Waktu});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Sholat,
          style: TextStyle(fontFamily: "PoppinsRegular"),
        ),
        Spacer(),
        Text(
          Waktu,
          style: TextStyle(fontFamily: "PoppinsRegular"),
        ),
        SizedBox(
          width: 15,
        ),
        Image.asset("assets/images/img_clock.png"),
      ],
    );
  }
}
