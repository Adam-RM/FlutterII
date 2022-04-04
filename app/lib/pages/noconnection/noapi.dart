import 'dart:io';

import 'package:flutter/material.dart';

import 'components/body.dart';

class NoApiPage extends StatelessWidget {
  const NoApiPage({Key? key}) : super(key: key);
  static String routeName = '/noapi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("No Api"),
      ),
      body: const acp(),
    );
  }
}

class acp extends StatelessWidget {
  const acp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center (
            child: Column(
              children: [
                Text("No api ;(")
              ],
            )
        )
    );
  }
}
