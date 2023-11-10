import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/playlistscontroller.dart';
import 'package:music_app/utils/appcolors.dart';
import 'package:music_app/utils/font_style.dart';
import 'package:music_app/widgets/tilemusic.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({super.key});

  final playlistController = Get.put(PlaylistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.darkpurple2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          iconSize: 30,
          onPressed: () {
            // Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset('assets/bg/winter_playlist/winter_playlist_bg.jpg'),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.darkpurple2,
                    AppColors.darkpurple2,
                    AppColors.darkpurple2,
                    AppColors.darkpurple2,
                    AppColors.darkpurple2,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Winter Playlist",
                      style: FontWhite.font20Bold,
                    ),
                  ),
                  playandpause(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "01:12:09/04:00:00",
                      style: FontWhite.font12,
                    ),
                  ),
                  TileMusic(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget playandpause() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Slider(
            value: 200,
            min: 0,
            max: 1000,
            onChanged: (value) {},
            activeColor: AppColors.lightpurple,
            inactiveColor: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          iconSize: 60,
          icon: const Icon(
            Icons.play_circle_fill_rounded,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
