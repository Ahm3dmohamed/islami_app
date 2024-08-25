import 'package:flutter/material.dart';
import 'package:islami/model/core/themes/ui_utils.dart';
import 'package:islami/modules/layout/pages/settings/settings.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';
import 'package:just_audio/just_audio.dart';

class RadioScreen extends StatefulWidget {
  static const String routeName = "RadioScreen";

  RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  final _audioPlayer = AudioPlayer(); // Create an AudioPlayer instance

  @override
  void initState() {
    super.initState();
    _initializeAudio();
  }

  Future<void> _initializeAudio() async {
    try {
      // Set audio source to the asset
      await _audioPlayer.setAsset('assets/audio/al Nabaa.mp3');
    } catch (e) {
      print('Error initializing audio: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Dispose of the audio player to free resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSplash(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Settings.routeName);
            },
            icon: Icon(
              Icons.settings,
              size: 44,
              color: Color(0xffB7935F).withOpacity(.6),
            ),
          ),
          title: Text(
            appTranslation(context).radioTab,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.normal,
              fontFamily: 'Qran',
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 120),
              child: Center(
                child: Image.asset('assets/images/radio_image.png'),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                ElevatedButton(
              onPressed: () => _audioPlayer.pause(),
              child:const Icon(Icons.pause_circle_outline_rounded),
            ),
            ElevatedButton(
              onPressed: () => _audioPlayer.play(),
              child:const Icon(Icons.play_circle_outline_outlined),
            ),
            ElevatedButton(
              onPressed: () => _audioPlayer.stop(),
              child:const Icon(Icons.stop_circle_outlined),
            ),
            ],
          )
          ],
        ),
      ),
    );
  }
}
