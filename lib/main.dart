import 'package:flutter/material.dart';
import 'package:musicPlayer/src/models/music_player_model.dart';
import 'package:provider/provider.dart';
import './src/screens/music_player_screen.dart';
import 'package:musicPlayer/src/themes/theme.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MusicPlayerModel>.value(value: MusicPlayerModel()),
      ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music Player',
        theme: miTema,
        home: MusicPlayerScreen(),
      ),
    );
  }
}