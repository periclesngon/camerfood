import 'package:delimeal_project/screens/categories_screen.dart';
import 'package:delimeal_project/screens/category_meal_screen.dart';
import 'package:delimeal_project/screens/meal_detail_sceen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.amber,
          ),
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Relaway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyMedium: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                titleMedium: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold
                ),
              )),
      initialRoute: '/',
      routes: {
        '/':(ctx)=>CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx)=> CategoryMealsScreen(),
        mealDetailSceen.routeName:(ctx)=>mealDetailSceen(),

      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
      // },
      // onUnknownRoute: ,
    );
  }
}

