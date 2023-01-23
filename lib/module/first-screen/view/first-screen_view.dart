import 'package:flutter/material.dart';
import 'package:fhe_template/core.dart';
import 'package:get/get.dart';

class FirstScreenView extends StatelessWidget {
  const FirstScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirstScreenController>(
      init: FirstScreenController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("FirstScreen"),
          ),
          body: SingleChildScrollView(
            child: RefreshIndicator(
              onRefresh: () async {
                controller.getData();
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: controller.dataUser.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var item = controller.dataUser[index];
                        return InkWell(
                          onTap: () {
                            Get.to(DetailScreenView(item: item));
                          },
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                backgroundImage: NetworkImage(
                                  item["avatar"],
                                ),
                              ),
                              title: Text(
                                item["first_name"] + "" + item["last_name"],
                                style: const TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              subtitle: Text(
                                item["email"],
                                style: const TextStyle(
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
