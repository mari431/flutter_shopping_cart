import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../model/simage.model.dart';
import '../screens/detail_screen.dart';

class MController extends GetxController {
  late Future<List<SImage>> futureImages;

  @override
  void onInit() {
    futureImages = loadMagazinesFromFile();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<List<SImage>> loadMagazinesFromFile() async {
    // Load JSON string from assets
    String jsonString =
        await rootBundle.loadString('assets/shopping_list.json');

    // Decode the JSON string into a list of maps
    List<dynamic> jsonResponse = json.decode(jsonString);

    // Convert the list of maps into a list of Magazine objects
    return jsonResponse.map((json) => SImage.fromJson(json)).toList();
  }

  Future<void> gotoDetailScreen(
      BuildContext context, String assetImage, String name) async {
    Get.to(
      () => DetailScreen(
        assetImage: '$assetImage',
        name: '$name',
      ),
      transition: Transition.zoom,
      duration: Duration(seconds: 1),
    );
  }
}
