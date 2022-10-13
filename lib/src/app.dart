import 'package:belajar_flutter/src/screens/screens.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Belajar Dengan Salt',
      home: SplashScreen(),
    );
  }
}
