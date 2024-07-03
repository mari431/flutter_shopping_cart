import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/screens/shopping_list_view.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          ShoppingListView()
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSize {
  static const IconData heart = IconData(0xf442);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // clipBehavior: Clip.none,
      title: Text('F-Shopping Cart'),
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: Colors.green,
          ),
          onPressed: () {
            // Add your onPressed code here!
          },
        ),
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.green,
          ),
          onPressed: () {
            // Add your onPressed code here!
          },
        ),
      ],

      elevation: 0, // Remove the default elevation
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(4.0), // Adjust the height as needed
        child: Container(
          height: 1,
          decoration: BoxDecoration(
            color: Colors.transparent, // Set color to transparent
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(1),
                spreadRadius: 0.1,
                blurRadius: 15,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
