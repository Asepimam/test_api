import 'package:fhe_template/core.dart';
import 'package:fhe_template/setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await initialize();

  

  runApp(
    GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const FirstScreenView(),
    ),
  );
}
