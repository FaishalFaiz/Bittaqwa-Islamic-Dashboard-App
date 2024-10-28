import 'package:bitaqwa_app/utils/color.dart';
import 'package:flutter/material.dart';

class ZakatScreen extends StatelessWidget {
  const ZakatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget CardHarta() {
      return Container(
        margin: EdgeInsets.all(24),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorApp.grey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Harta",
              style: TextStyle(
                color: ColorApp.primary,
                fontFamily: "PoppinsMedium",
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: ColorApp.primary),
                ),
                label: Text("Masukkan total harta"),
                labelStyle: TextStyle(
                  color: ColorApp.darkGrey,
                ),
                prefix: Text("Rp. "),
                fillColor: ColorApp.white,
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text("Ok"),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size(double.infinity, 0),
                padding: EdgeInsets.all(12),
              ),
            ),
          ],
        ),
      );
    }

    Widget CardResult() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.red[300]!,
            ),
            child: Column(
              children: [
                Text(
                  "Total Uang",
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    color: ColorApp.white,
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  "Rp. 0",
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    color: ColorApp.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.purple,
            ),
            child: Column(
              children: [
                Text(
                  "Zakat Dikeluarkan",
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    color: ColorApp.white,
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  "Rp. 0",
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    color: ColorApp.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text(
          "Kalkulator Zakat",
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
      body: ListView(
        children: [
          Image.asset("assets/images/bg_header_zakat.png"),
          CardHarta(),
          CardResult(),
        ],
      ),
    );
  }
}
