import 'package:bitaqwa_app/presentation/screen/doa_list.dart';
import 'package:bitaqwa_app/presentation/widgets/carddoa.dart';
import 'package:bitaqwa_app/utils/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DoaScreen extends StatelessWidget {
  const DoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      // appbar
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text(
          "Doa-Doa",
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
      body: Column(
        children: [
          Image.asset(
            "assets/images/bg_header_dashboard_morning.png",
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: GridView.count(
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                crossAxisCount: 3,
                padding: EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                children: [
                  CardDoa(
                    imageUrl: "assets/images/ic_menu_doa.png",
                    CardTitle: "Malam",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoaListScreen(
                              category: "Pagi & Malam",
                            ),
                          ));
                    },
                  ),
                  CardDoa(
                    imageUrl: "assets/images/ic_doa_rumah.png",
                    CardTitle: "Rumah",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoaListScreen(
                              category: "Rumah",
                            ),
                          ));
                    },
                  ),
                  CardDoa(
                    imageUrl: "assets/images/ic_doa_makanan_minuman.png",
                    CardTitle: "Makan",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoaListScreen(
                              category: "Makanan & Minuman",
                            ),
                          ));
                    },
                  ),
                  CardDoa(
                    imageUrl: "assets/images/ic_doa_perjalanan.png",
                    CardTitle: "Safar",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoaListScreen(
                              category: "Perjalanan",
                            ),
                          ));
                    },
                  ),
                  CardDoa(
                    imageUrl: "assets/images/ic_doa_sholat.png",
                    CardTitle: "Sholat",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoaListScreen(
                              category: "Sholat",
                            ),
                          ));
                    },
                  ),
                  CardDoa(
                    imageUrl: "assets/images/ic_doa_etika_baik.png",
                    CardTitle: "Etika Baik",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoaListScreen(
                              category: "Etika Baik",
                            ),
                          ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
