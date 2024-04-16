import 'package:get/get.dart';
import 'package:project_16_apr/model/data_model.dart';
import 'package:project_16_apr/services/api_services.dart';

class DataModelController extends GetxController {
  var galleryItems = <GalleryItem>[].obs;
  var isLoading = false.obs;

  fetchDatafromServer() async {
    isLoading.value = true;
    final data = await makePostRequest();
    if (data != []) {
      galleryItems.value = data;
    }
    isLoading.value = false;
  }

  String getDocTypeString(int docType) {
    switch (docType) {
      case 0:
        return 'Image';
      case 1:
        return 'Video';
      case 2:
        return 'PDF';
      case 3:
        return 'Audio';
      case 4:
        return 'Document';
      default:
        return 'Unknown';
    }
  }

  @override
  void onInit() {
    fetchDatafromServer();
    super.onInit();
  }
}
