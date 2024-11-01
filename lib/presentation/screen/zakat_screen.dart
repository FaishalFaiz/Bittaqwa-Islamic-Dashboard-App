import 'package:bitaqwa_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';

class ZakatScreen extends StatefulWidget {
  ZakatScreen({super.key});

  @override
  State<ZakatScreen> createState() => _ZakatScreenState();
}

class _ZakatScreenState extends State<ZakatScreen> {
  // Controler biar text ada titik titik (belum ada depedencies)
  final MoneyMaskedTextController moneyController = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

  // variabel untuk kalkulasi
  double totalHarta = 0;

  double zakatDikeluarkan = 0;

  final double minimumHarta = 85000000;

  String formattedHarta = "";

  String formattedZakatDikeluarkan = "";

  // function untuk hitungnya
  void HitungZakat() {
    String cleanStringValue = moneyController.text.replaceAll(".", "");
    // ngubah dari string ke double
    double inputValue = double.tryParse(cleanStringValue) ?? 0;

    if (inputValue >= minimumHarta) {
      setState(() {
        totalHarta = inputValue;
        zakatDikeluarkan = (inputValue * 2.5) / 100;

        // format hasilnya
        formattedHarta = NumberFormat.currency(locale: 'id_ID', symbol: '')
            .format(totalHarta);
        formattedZakatDikeluarkan =
            NumberFormat.currency(locale: 'id_ID', symbol: '')
                .format(zakatDikeluarkan);
      });
    } else {
      // kalau harta kurang dari minimum
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Peringatan"),
          content: Text("Anda tidak wajib berzakat"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close))
          ],
        ),
      );
    }
  }

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
              keyboardType: TextInputType.number,
              controller: moneyController,
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
              onPressed: () {
                HitungZakat();
              },
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
      return SingleChildScrollView(
        padding: EdgeInsets.only(left: 40, right: 40),
        scrollDirection: Axis.horizontal,
        child: Row(
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
                    "Rp. ${formattedHarta}",
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
                    "Rp. ${formattedZakatDikeluarkan}",
                    style: TextStyle(
                      fontFamily: "PoppinsMedium",
                      color: ColorApp.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
          Image.asset(
            "assets/images/bg_header_zakat.png",
          ),
          CardHarta(),
          CardResult(),
        ],
      ),
    );
  }
}
