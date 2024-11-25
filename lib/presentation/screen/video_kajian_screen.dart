import 'package:bitaqwa_app/data/data_video.dart';
import 'package:bitaqwa_app/presentation/screen/detail_video.dart';
import 'package:bitaqwa_app/utils/color.dart';
import 'package:flutter/material.dart';

class VideoKajianScreen extends StatelessWidget {
  const VideoKajianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text(
          "Video Kajian",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        child: ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailVideo(
                      title: videos[index]['title']!,
                      ustadz: videos[index]['ustadz']!,
                      account: videos[index]['account']!,
                      url: videos[index]['url']!,
                      description: videos[index]['description']!,
                    );
                  },
                ));
              },
              child: Card(
                margin: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///. get data from local
                    AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          videos[index]['thumbnail']!,
                          fit: BoxFit.cover,
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8,
                        top: 8,
                      ),
                      child: Text(
                        videos[index]['account']!,
                        style: TextStyle(
                          fontFamily: 'PoppinsRegular',
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Text(
                        videos[index]['ustadz']!,
                        style: TextStyle(
                          fontFamily: 'PoppinsRegular',
                          color: ColorApp.primary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        videos[index]['title']!,
                        style: TextStyle(
                          fontFamily: 'PoppinsSemiBold',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
