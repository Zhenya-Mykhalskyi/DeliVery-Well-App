import 'package:flutter/material.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        //     textTheme:
        //     Theme.of(context).textTheme.apply(
        //   bodyColor: Colors.pinkAccent, //<-- SEE HERE
        //   displayColor: Colors.pinkAccent, //<-- SEE HERE
        // ),
        primarySwatch: Colors.pink,
        accentColor: Colors.pink,
        canvasColor: Color.fromARGB(255, 15, 1, 15),

        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              // bodyColor: Color.fromARGB(255, 255, 14, 1),
              bodyText1: TextStyle(
                color: Color.fromARGB(255, 235, 235, 235),
              ),
              bodyText2: TextStyle(
                color: Color.fromARGB(255, 235, 235, 235),
              ),
              headline3: TextStyle(
                fontSize: 16,
                fontFamily: 'RobotoCondensed',
                color: Color.fromARGB(255, 235, 235, 235),
              ),
              headline4: TextStyle(
                fontSize: 18,
                fontFamily: 'RobotoCondensed',
                color: Color.fromARGB(255, 235, 235, 235),
              ),
            ),
      ),
      initialRoute: '/',
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
