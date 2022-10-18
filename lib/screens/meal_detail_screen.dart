import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;
  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      height: 170,
      width: 350,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(0xff1f005c),
                  Color(0xff5b0060),
                  Color(0xff870160),
                  Color(0xffac255e),
                  Color(0xffca485c),
                  Color(0xffe16b5c),
                  Color(0xfff39060),
                  Color(0xffffb56b),
                ]),
          ),
        ),
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 270,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingridients:'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Padding(
                  padding: EdgeInsets.all(2),
                  child: Card(
                    color: Color.fromARGB(255, 245, 245, 245),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps:'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xffac255e),
                          Color(0xffca485c),
                          Color(0xffe16b5c),
                          Color(0xfff39060),
                          Color(0xffffb56b),
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 31, 31, 31),
                      child: Text(
                        '# ${(index + 1)}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  title: Text(
                    selectedMeal.steps[index],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 55,
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 243, 145, 96),
          child: Container(
            child: Icon(
              isFavorite(mealId) ? Icons.star : Icons.star_border,
              color: Color.fromARGB(255, 225, 225, 225),
            ),
          ),
          onPressed: () => toggleFavorite(mealId),
        ),
      ),
    );
  }
}
