import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicPlayer/src/widgets/custom_appbar.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [CustomAppBar(), _ImagenDiscoYDuracion(), _TituloPlay()],
      )),
    );
  }
}

class _TituloPlay extends StatelessWidget {
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
            onPressed: () {},
            backgroundColor: Color(0xfff8cb51),
            child: Icon(
              Icons.play_arrow,
              size: 35,
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
    return Container(
      child: Column(
        children: [
          Text(
            '34:23',
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
                  height: 80,
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
            '34:23',
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
            Image(
              image: AssetImage('assets/aurora.jpg'),
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
