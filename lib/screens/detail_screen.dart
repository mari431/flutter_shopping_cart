import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String assetImage;
  final String name;

  DetailScreen({required this.assetImage, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    width: 411,
                    padding: const EdgeInsets.all(8),
                    height: 600,
                    child: Image.asset(assetImage,
                        width: 250, height: 250, fit: BoxFit.fill),
                  ),
                  Positioned(
                      left: 20,
                      bottom: 30,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            color: Colors.black54,
                            child: Text(
                              'S',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            color: Colors.black54,
                            child: Text(
                              'M',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            color: Colors.black54,
                            child: Text(
                              'L',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                      bottom: 25,
                      right: 30,
                      child: Container(
                        width: 250,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Buy',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, // Background color
                            // Other properties like padding, shape, etc.
                          ),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
