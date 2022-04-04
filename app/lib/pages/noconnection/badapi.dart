import 'dart:io';

import 'package:flutter/material.dart';

import 'components/body.dart';

class ApiAvailablePage extends StatelessWidget {
  const ApiAvailablePage({Key? key}) : super(key: key);
  static String routeName = '/badapi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Available"),
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
                Text("Api Available ;_;")
              ],
            )
        )
    );
  }
}
