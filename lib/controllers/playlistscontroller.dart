import 'package:get/get.dart';
import 'package:music_app/models/musicmodel.dart';

class PlaylistController extends GetxController {
  var listMusic = [
    MusicModel(
      name: "เด็ด",
      artis: "Pixxie",
      image:
          "https://scontent.fbkk2-8.fna.fbcdn.net/v/t1.6435-9/144484492_218825133217470_169011479002079458_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=7f8c78&_nc_ohc=XaVAx1fiKH0AX-phkF2&_nc_ht=scontent.fbkk2-8.fna&oh=00_AfB8r1ktY_y8VXMmMo53aMMo37ow3o9PyGKutcbjPRzkQA&oe=65571E76",
      music:
          "https://firebasestorage.googleapis.com/v0/b/pixxie-b3166.appspot.com/o/ded.wav?alt=media&token=dc4062d3-99e7-4efe-98f3-94f16f31b7a0&_gl=1*1uco0u0*_ga*MzM1NTY4MTg3LjE2OTc3ODQzNzI.*_ga_CW55HF8NVT*MTY5Nzc4NDM3MS4xLjEuMTY5Nzc4NTQ4Ny45LjAuMA..",
    ),
    MusicModel(
      name: "มูเตลู",
      artis: "Pixxie",
      image:
          "https://cms.dmpcdn.com/musicarticle/2021/10/04/0d62bce0-250d-11ec-8107-c7a737382372_original.jpg",
      music:
          "https://firebasestorage.googleapis.com/v0/b/pixxie-b3166.appspot.com/o/mutelu.wav?alt=media&token=aa08475b-7f21-4507-95b1-6f9a61b5b7f6&_gl=1*gu7w3w*_ga*MzM1NTY4MTg3LjE2OTc3ODQzNzI.*_ga_CW55HF8NVT*MTY5Nzc4NDM3MS4xLjEuMTY5Nzc4NTY2OC42MC4wLjA.",
    ),
    MusicModel(
      name: "เกินต้าน (Too Cute)",
      artis: "Pixxie",
      image:
          "https://images.genius.com/436c218caf01d3db6588ed0f46848af7.1000x1000x1.jpg",
      music:
          "https://firebasestorage.googleapis.com/v0/b/pixxie-b3166.appspot.com/o/too%20cute.wav?alt=media&token=d0d0c693-103f-416c-ba6b-4cba80c7cc4d&_gl=1*1581ndr*_ga*MzM1NTY4MTg3LjE2OTc3ODQzNzI.*_ga_CW55HF8NVT*MTY5Nzc4NDM3MS4xLjEuMTY5Nzc4NTcxMi4xNi4wLjA.",
    ),
    MusicModel(
      name: "ไม่ได้ก็ไม่เอาแล้ว (Whatever)",
      artis: "Pixxie",
      image:
          "https://images.genius.com/218851e1326920790050a16203a4d9b1.1000x1000x1.jpg",
      music:
          "https://firebasestorage.googleapis.com/v0/b/pixxie-b3166.appspot.com/o/whatever.wav?alt=media&token=18362644-bd4c-48f1-af9e-ddfa1a80888f&_gl=1*1hk0bzp*_ga*MzM1NTY4MTg3LjE2OTc3ODQzNzI.*_ga_CW55HF8NVT*MTY5Nzc4NDM3MS4xLjEuMTY5Nzc4NTcyOS42MC4wLjA.",
    ),
    MusicModel(
      name: "งอนละ (Boo)",
      artis: "Pixxie",
      image:
          "https://images.genius.com/1bdeed965ac38c711e0e3f17e7c5fb02.1000x1000x1.jpg",
      music:
          "https://firebasestorage.googleapis.com/v0/b/pixxie-b3166.appspot.com/o/boo.wav?alt=media&token=9c8dd3c0-645a-4274-ab8e-1ce27ac980e9&_gl=1*pn3eeh*_ga*MzM1NTY4MTg3LjE2OTc3ODQzNzI.*_ga_CW55HF8NVT*MTY5Nzc4NDM3MS4xLjEuMTY5Nzc4NTQzNi42MC4wLjA.",
    ),
    MusicModel(
      name: "DEJAYOU",
      artis: "Pixxie",
      image: "https://i.scdn.co/image/ab67616d0000b2737eed64905d129d52667201f2",
      music:
          "https://firebasestorage.googleapis.com/v0/b/pixxie-b3166.appspot.com/o/dejayou.wav?alt=media&token=ff23a6e9-413e-495e-b1fc-e0d5391597ba&_gl=1*1ltlg9y*_ga*MzM1NTY4MTg3LjE2OTc3ODQzNzI.*_ga_CW55HF8NVT*MTY5Nzc4NDM3MS4xLjEuMTY5Nzc4NTUwOS42MC4wLjA.",
    ),
    MusicModel(
      name: "ลองเลิกกันดีไหม (Next Chapter)",
      artis: "Pixxie",
      image:
          "https://t2.genius.com/unsafe/340x340/https%3A%2F%2Fimages.genius.com%2Ff8b1b217fd9189bf1616292ed60337fe.1000x1000x1.jpg",
      music:
          "https://firebasestorage.googleapis.com/v0/b/pixxie-b3166.appspot.com/o/next%20chapter.wav?alt=media&token=3b42c72b-e00c-4dc5-95fa-dbf3e037da28&_gl=1*uakwx2*_ga*MzM1NTY4MTg3LjE2OTc3ODQzNzI.*_ga_CW55HF8NVT*MTY5Nzc4NDM3MS4xLjEuMTY5Nzc4NTY5NS4zMy4wLjA.",
    ),
  ].obs;
}
