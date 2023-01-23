import 'package:flutter/material.dart';
import '../controller/detail-screen_controller.dart';
import 'package:fhe_template/core.dart';
import 'package:get/get.dart';

class DetailScreenView extends StatelessWidget {
  final Map item;
  const DetailScreenView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailScreenController>(
      init: DetailScreenController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("DetailScreen"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    height: 160.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          item["avatar"],
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Name: ${item["first_name"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "email: ${item["email"]}",
                        style: const TextStyle(
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
