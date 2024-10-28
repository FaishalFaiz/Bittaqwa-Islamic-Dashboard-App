import 'package:bitaqwa_app/utils/color.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Widget Header() {
      return Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage("assets/images/bg_header_dashboard_morning.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: ColorApp.white,
                ),
                child: Text(
                  "Assalamu'alaikum Faiz",
                  style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 13),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Subuh",
              style: TextStyle(
                fontFamily: "PoppinsMedium",
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "04:48",
              style: TextStyle(
                fontFamily: "PoppinsBold",
                fontSize: 36,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: ColorApp.red,
                  size: 17,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Kabupaten Karanganyar",
                  style: TextStyle(
                    fontFamily: "PoppinsRegular",
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget CardMenus() {
      return Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: ColorApp.primary,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/doa');
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/ic_menu_doa.png"),
                    Text("Doa-doa",
                        style: TextStyle(
                          fontFamily: "PoppinsSemiBold",
                          fontSize: 14,
                          color: ColorApp.white,
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/zakat');
                },
                child: Column(
                  children: [
                    Image.asset("assets/images/ic_menu_zakat.png"),
                    Text("Zakat",
                        style: TextStyle(
                          fontFamily: "PoppinsSemiBold",
                          fontSize: 14,
                          color: ColorApp.white,
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  Image.asset("assets/images/ic_menu_video_kajian.png"),
                  Text("Video Kajian",
                      style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        fontSize: 14,
                        color: ColorApp.white,
                      )),
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  Image.asset("assets/images/ic_menu_jadwal_sholat.png"),
                  Text("Jadwal Sholat",
                      style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        fontSize: 14,
                        color: ColorApp.white,
                      )),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget Inspiration() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Inspirasi",
                style: TextStyle(
                  fontFamily: "PoppinsSemiBold",
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Image.asset(
              "assets/images/img_inspiration_2.jpeg",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 8,
            ),
            Image.asset(
              "assets/images/img_inspiration_3.jpeg",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 8,
            ),
            Image.asset(
              "assets/images/img_inspiration_4.jpeg",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 8,
            ),
            Image.asset(
              "assets/images/img_inspiration_5.jpeg",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 8,
            ),
            Image.asset(
              "assets/images/img_inspiration_6.jpeg",
              fit: BoxFit.cover,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: ColorApp.white,
      body: ListView(
        children: [
          Header(),
          CardMenus(),
          Inspiration(),
        ],
      ),
    );
  }
}
