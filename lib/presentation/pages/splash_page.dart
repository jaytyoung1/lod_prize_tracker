import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff14344f),
      child: Image.asset('assets/lod_full_logo.PNG'),
    );
  }
}
