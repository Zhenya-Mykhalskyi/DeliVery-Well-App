import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              //   Color(0xff1f005c),
              //   Color(0xff5b0060),
              //   Color(0xff870160),
              //   Color(0xffac255e),
              //   Color(0xffca485c),
              //   Color(0xffe16b5c),
              //   Color(0xfff39060),
              //   Color(0xffffb56b),

              Color.fromARGB(255, 0, 165, 140),
              Color.fromARGB(255, 0, 75, 64),
              Color.fromARGB(255, 0, 0, 0),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
        ),
        child: const Text(
          'DeliVery Well',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
            // backgroundColor: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      )),
      body: GridView(
        padding: const EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                catData.id,
                catData.title,
                catData.color,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 130,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}