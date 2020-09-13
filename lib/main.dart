import 'package:flutter/material.dart';
import './src/screens/music_player_screen.dart';
import 'package:musicPlayer/src/themes/theme.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: miTema,
      home: MusicPlayerScreen(),
    );
  }
}