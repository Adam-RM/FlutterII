import 'dart:io';

import 'package:flutter/material.dart';

import 'components/body.dart';

class NoConnectionPage extends StatelessWidget {
const NoConnectionPage({Key? key}) : super(key: key);
static String routeName = '/noconnection';

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text("NoConnection"),
),
body: const Body(),
);
}
}
