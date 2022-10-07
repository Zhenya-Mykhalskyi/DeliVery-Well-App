import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selecCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
        'color': color,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selecCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              color,
              color.withBlue(150),
            ],
            begin: Alignment(8, 1.3),

            // end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(15),
          // border: Border.all(
          //   color: Color.fromARGB(255, 209, 209, 209),
          //   width: 1.5,
          // ),
        ),
      ),
    );
  }
}
