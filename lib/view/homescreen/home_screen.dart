import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_16_apr/controller/data_model_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final DataModelController controller = Get.put(DataModelController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(),
          body: controller.isLoading.value
              ? const SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: SizedBox(
                      width: 600,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Uid')),
                          DataColumn(label: Text('DocType')),
                          DataColumn(label: Text('Image')),
                        ],
                        rows: controller.galleryItems.map((item) {
                          return DataRow(cells: [
                            DataCell(
                                SizedBox(width: 50, child: Text(item.name))),
                            DataCell(SizedBox(
                                width: 40, child: Text(item.uid.toString()))),
                            DataCell(SizedBox(
                                width: 35,
                                child: Text(
                                  controller.getDocTypeString(item.docType),
                                ))),
                            DataCell(SizedBox(
                                width: 50,
                                height: 100,
                                child: Image.network(item.imageUrl))),
                          ]);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
        ));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TableRow tableRow = const TableRow(children: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Content 1"),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Content 2"),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Content 3"),
      ),
    ]);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              child: Table(
                border: TableBorder.all(),
                defaultColumnWidth: const FixedColumnWidth(90),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [tableRow, tableRow, tableRow],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
