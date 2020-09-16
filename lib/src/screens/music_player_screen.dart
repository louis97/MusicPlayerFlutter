import 'package:animate_do/animate_do.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicPlayer/src/helpers/helpers.dart';
import 'package:musicPlayer/src/models/music_player_model.dart';
import 'package:musicPlayer/src/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _Background(),
          Column(
            children: [
              CustomAppBar(),
              _ImagenDiscoYDuracion(),
              _TituloPlay(),
              Expanded(child: _Lyrics())
            ],
          ),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.center,
              colors: [
                Color(0xff33333e),
                Color(0xff201e28),
              ])),
    );
  }
}

class _Lyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> lyrics = getLyrics();
    return Container(
        child: ListWheelScrollView(
            diameterRatio: 1.5,
            itemExtent: 42,
            children: lyrics
                .map((e) => Text(
                      e,
                      style: TextStyle(
                          fontSize: 20, color: Colors.white.withOpacity(0.6)),
                    ))
                .toList()));
  }
}

class _TituloPlay extends StatefulWidget {
  @override
  __TituloPlayState createState() => __TituloPlayState();
}

class __TituloPlayState extends State<_TituloPlay>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool firstTimePlaying = true;
  AnimationController controller;
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(microseconds: 500));
    super.initState();
  }

  void open() {
    final musicPlayerModel =
        Provider.of<MusicPlayerModel>(context, listen: false);
    assetsAudioPlayer.open(
      Audio("assets/Breaking-Benjamin-Far-Away.mp3"),
      // autoPlay: true,
      showNotification: true,
      // autoStart: false,
    );
    assetsAudioPlayer.currentPosition.listen((event) {
      musicPlayerModel.current = event;
    });
    assetsAudioPlayer.current.listen((event) {
      musicPlayerModel.songDuration = event.audio.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      margin: EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Column(
            children: [
              Text('Far Away',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8), fontSize: 30)),
              Text('-Breaking Bejanmin-',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 15))
            ],
          ),
          Spacer(),
          FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            onPressed: () {
              MusicPlayerModel mpm =
                  Provider.of<MusicPlayerModel>(context, listen: false);
              if (isPlaying) {
                controller.reverse();
                this.isPlaying = false;
                mpm.controller.stop();
              } else {
                controller.forward();
                this.isPlaying = true;
                mpm.controller.repeat();
              }
              if(firstTimePlaying){
                this.open();
                this.firstTimePlaying=false;
                assetsAudioPlayer.playOrPause();
              }else{
                assetsAudioPlayer.playOrPause();
              }
              setState(() {});
            },
            backgroundColor: Color(0xfff8cb51),
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: controller,
            ),
          )
        ],
      ),
    );
  }
}

class _ImagenDiscoYDuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          _ImagenDisco(),
          SizedBox(
            width: 30,
          ),
          _BarraProgreso(),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class _BarraProgreso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle ts = TextStyle(color: Colors.white.withOpacity(0.4));
    final mpm = Provider.of<MusicPlayerModel>(context);
    final porcentaje= mpm.porcentage;

    return Container(
      child: Column(
        children: [
          Text(
            '${mpm.songTotalDuration}',
            style: ts,
          ),
          SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                height: 250,
                width: 2,
                color: Colors.white.withOpacity(0.1),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 250 * mpm.porcentage,
                  width: 2,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${mpm.currentSecond}',
            style: ts,
          ),
        ],
      ),
    );
  }
}

class _ImagenDisco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MusicPlayerModel mpm = Provider.of<MusicPlayerModel>(context);
    return Container(
      padding: EdgeInsets.all(20),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          gradient: LinearGradient(begin: Alignment.topLeft, colors: [
            Color(0xff484750),
            Color(0xff1e1c24),
          ])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              duration: Duration(milliseconds: 10000),
              infinite: true,
              manualTrigger: true,
              animate: false,
              controller: (animationcontroller) =>
                  mpm.controller = animationcontroller,
              child: Image(
                image: AssetImage('assets/aurora.jpg'),
              ),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(100)
                  // shape: BoxShape.circle
                  ),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: Color(0xff1c1c25),
                  borderRadius: BorderRadius.circular(100)
                  // shape: BoxShape.circle
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
