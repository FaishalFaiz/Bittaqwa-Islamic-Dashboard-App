import 'package:bitaqwa_app/presentation/widgets/time.dart';
import 'package:bitaqwa_app/utils/color.dart';
import 'package:flutter/material.dart';

class JadwalSholatScreen extends StatelessWidget {
  const JadwalSholatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text(
          "Jadwal Sholat",
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
      body: Container(
        color: Color(0xffE4F2FD),
        child: Stack(
          children: [
            Image.asset("assets/images/bg_header_jadwal_sholat.png"),
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Senin, 18 Nov 2024",
                  style: TextStyle(
                    fontFamily: "PoppinsBold",
                    fontSize: 24,
                    color: ColorApp.white,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: ColorApp.white,
                    ),
                    Text(
                      "Karanganyar, Jawa Tengah",
                      style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        color: ColorApp.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.all(24),
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: ColorApp.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Time(Sholat: "Subuh", Waktu: "04:00"),
                      SizedBox(
                        height: 16,
                      ),
                      Divider(
                        color: Color(0xffCBE5DD),
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Time(Sholat: "Subuh", Waktu: "04:00"),
                      SizedBox(
                        height: 16,
                      ),
                      Divider(
                        color: Color(0xffCBE5DD),
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Time(Sholat: "Subuh", Waktu: "04:00"),
                      SizedBox(
                        height: 16,
                      ),
                      Divider(
                        color: Color(0xffCBE5DD),
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Time(Sholat: "Subuh", Waktu: "04:00"),
                      SizedBox(
                        height: 16,
                      ),
                      Divider(
                        color: Color(0xffCBE5DD),
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Time(Sholat: "Subuh", Waktu: "04:00"),
                      SizedBox(
                        height: 16,
                      ),
                      Divider(
                        color: Color(0xffCBE5DD),
                        thickness: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
