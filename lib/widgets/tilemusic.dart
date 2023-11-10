import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/utils/font_style.dart';

import '../controllers/playlistscontroller.dart';

class TileMusic extends StatelessWidget {
  TileMusic({super.key});

  final playlistController = Get.put(PlaylistController());

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: playlistController.listMusic.length,
        itemBuilder: (context, index) {
          var music = playlistController.listMusic[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              onTap: () {},
              leading: Container(
                width: Get.width * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: NetworkImage(music.image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                music.name!,
                style: FontWhite.font16,
              ),
              subtitle: Text(
                "00:00 - 40:00",
                style: FontWhite.font12,
              ),
            ),
          );
        },
      ),
    );
  }
}
