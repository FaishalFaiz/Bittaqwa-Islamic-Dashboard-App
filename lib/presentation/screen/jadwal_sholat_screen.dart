import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/color.dart';
import '../widgets/time.dart';

class JadwalSholatScreen extends StatefulWidget {
  const JadwalSholatScreen({super.key});

  @override
  State<JadwalSholatScreen> createState() => _JadwalSholatScreenState();
}

class _JadwalSholatScreenState extends State<JadwalSholatScreen> {
  // variable list kumpulan waktu solat
  Map<String, dynamic>? _jadwalSholat;

  // variable untuk nama lokasi user
  String? _locationName;

  // variable untuk mengecek apakah ada internet atau tidak
  bool _isLoading = true;

  // 1 Buat function untuk mengambil data api
  Future<Map<String, dynamic>?> getJadwalSholat(
    String city,
    String year,
    String month,
  ) async {
    final url = 'https://api.myquran.com/v2/sholat/jadwal/$city/$year/$month';

    final response = await http.get(Uri.parse(url));

    // 2 buat pengkondisin jika datanya berhasil didapat
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      if (jsonData['status'] == true) {
        // Ambil array 'jadwal'
        List<dynamic> jadwalArray = jsonData['data']['jadwal'];

        // Ambil tanggal hari ini
        String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

        // Cari data jadwal untuk tanggal hari ini
        final todayJadwal = jadwalArray.firstWhere(
          (item) => item['date'] == today,
          orElse: () => null, // Null jika tidak ada data untuk tanggal ini
        );

        return todayJadwal;
      } else {
        throw Exception('Gagal mendapatkan data jadwal dari API baru');
      }
    } else {
      throw Exception('Gagal mengambil data dari API');
    }
  }

  // 3 buat function untuk mengambil lokasi user
  Future<void> getLocation() async {
    // 4 minta akses lokasi ke user dan masukkan permission ke android manifest
    var status = await Permission.location.request();
    // 5 pengkondisian jika lokasi diizinkan atau tidak diizinkan
    if (status.isGranted) {
      try {
        // 6 Ambil titik koordinat user
        Position position = await Geolocator.getCurrentPosition();
        // 7 ambil nama lokasi
        List<Placemark> placemark = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        Placemark place = placemark.first;

        // 8 buat variable untuk menampung lokasi, tahun, dan bulan
        String city = "1411"; // ID Kota untuk API
        String month = DateFormat('MM').format(DateTime.now());
        String year = DateFormat('yyyy').format(DateTime.now());

        // 9 memasukkan data variable diatas kedalam api
        Map<String, dynamic>? jadwalSholat =
            await getJadwalSholat(city, year, month);

        // 10 buat variable baru dan masukkan hasil data akhir
        setState(() {
          _jadwalSholat = jadwalSholat;
          _locationName = "${place.subAdministrativeArea}, ${place.locality}";
          _isLoading = false;
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        print(
            "Terjadi kesalahan ketika mengambil lokasi dan jadwal sholat: $e");
      }
    } else {
      print('Lokasi tidak diizinkan');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body:
          // jika masih loading (datanya masih di proses)
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              // jika data sholat (subuh s/d isya ternyata kosong)
              : _jadwalSholat == null
                  ? const Center(child: Text('Data sholat kosong'))
                  // jika ternyata data sholat tersedia
                  : Container(
                      color: Colors.blue[50],
                      child: Stack(
                        children: [
                          Image.asset(
                              'assets/images/bg_header_jadwal_sholat.png'),
                          Column(
                            children: [
                              const SizedBox(height: 48),
                              Text(
                                // E buat hari, d buat tanggal, M buat bulan
                                DateFormat('EEEE, d MMMM', 'id_ID')
                                    .format(DateTime.now()),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontFamily: "PoppinsSemiBold",
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Color.fromARGB(255, 10, 132, 139),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    _locationName ?? "Mengambil lokasi",
                                    style: const TextStyle(
                                      fontFamily: "PoppinsRegular",
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 48),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 32, horizontal: 24),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Time(
                                      Sholat: "Subuh",
                                      Waktu: _jadwalSholat?["subuh"] ?? "-",
                                    ),
                                    const SizedBox(height: 16),
                                    Container(
                                      height: 2,
                                      color: Colors.blue[100],
                                    ),
                                    const SizedBox(height: 16),
                                    Time(
                                      Sholat: "Dzuhur",
                                      Waktu: _jadwalSholat?["dzuhur"] ?? "-",
                                    ),
                                    const SizedBox(height: 16),
                                    Container(
                                      height: 2,
                                      color: Colors.blue[100],
                                    ),
                                    const SizedBox(height: 16),
                                    Time(
                                      Sholat: "Ashar",
                                      Waktu: _jadwalSholat?["ashar"] ?? "-",
                                    ),
                                    const SizedBox(height: 16),
                                    Container(
                                      height: 2,
                                      color: Colors.blue[100],
                                    ),
                                    const SizedBox(height: 16),
                                    Time(
                                      Sholat: "Maghrib",
                                      Waktu: _jadwalSholat?["maghrib"] ?? "-",
                                    ),
                                    const SizedBox(height: 16),
                                    Container(
                                      height: 2,
                                      color: Colors.blue[100],
                                    ),
                                    const SizedBox(height: 16),
                                    Time(
                                      Sholat: "Isya",
                                      Waktu: _jadwalSholat?["isya"] ?? "-",
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
