import 'package:audio_player_demo/ui/audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audio_player_demo/config/app_color.dart' as app_colors;

class DetailAudioPage extends StatefulWidget {
  const DetailAudioPage({Key? key}) : super(key: key);

  @override
  State<DetailAudioPage> createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage> {

  late AudioPlayer mPlayer;

  @override
  void initState() {
    super.initState();
    mPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: app_colors.audioBluishBackground,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight / 3,
            child: Container(
              color: app_colors.audioBlueBackground,
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            top: screenHeight * 0.2,
            height: screenHeight * 0.36,
            child: Container(
              color: Colors.white,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  const Text(
                    "秋天的秘密",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir",
                    ),
                  ),
                  const Text(
                    "周传雄",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  AudioPlayerWidget(audioPlayer:mPlayer)
                ],
              ),
            ),
          ),
          Positioned(
              top: screenHeight*0.12,
              left: (screenWidth-150)/2,
              right:(screenWidth-150)/2,
              height: screenHeight*0.16,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white,width: 2),
                  color: app_colors.audioGreyBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.circle,
                        border: Border.all(color: Colors.white,width: 5),
                      image: const DecorationImage(
                        image: AssetImage("img/blog.png"),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
          ),
          ),
        ],
      ),
    );
  }


}
