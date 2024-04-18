import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_16_apr/controller/data_model_controller.dart';

class HomeScreen2 extends StatelessWidget {
  HomeScreen2({super.key});

  final DataModelController controller = Get.put(DataModelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: controller.dummyDataList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final data = controller.dummyDataList[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data.employeeName),
                            );
                          }),
                    )
            ],
          )),
    );
  }
}
