import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/controller.dart';
import '../model/simage.model.dart';

class ShoppingListView extends StatefulWidget {
  @override
  _ShoppingListViewState createState() => _ShoppingListViewState();
}

class _ShoppingListViewState extends State<ShoppingListView> {
  final _mcontroller = Get.put(MController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 599,
        child: FutureBuilder<List<SImage>>(
          future: _mcontroller.futureImages,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  SImage magazine = snapshot.data![index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){
                          _mcontroller.gotoDetailScreen(context,magazine.assetImage,magazine.name);
                        },
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ///----image start
                            Container(
                                color: Colors.grey,
                                width: 250, // Adjust width as needed
                                height: 250, // Adjust height as needed
                                child: Card(
                                    color: Colors.transparent,
                                    child: Image.asset(magazine.assetImage))),

                            ///----image end
                            ///---Price start
                            Positioned(
                              top: 5,
                              left: 5,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                // color: Colors.black54,
                                child: Text(
                                  '${magazine.price}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            ///---Price end
                            ///----Name Start
                            Positioned(
                              bottom: 10,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                color: Colors.black54,
                                child: Text(
                                  '${magazine.name}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            ///----Name end
                            ///----heart icon start
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),

                            ///----heart icon end
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  );
                },
              );
            } else {
              return Center(child: Text('No list found'));
            }
          },
        ),
      ),
    );
  }
}
