import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Birthday Calendar',
      home: Home(),
    );
  }
}
