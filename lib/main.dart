import 'package:delimeal_project/models/dummy_data.dart';
import 'package:delimeal_project/models/meal.dart';
// import 'package:delimeal_project/screens/categories_screen.dart';
import 'package:delimeal_project/screens/category_meal_screen.dart';
import 'package:delimeal_project/screens/filter_screen.dart';
import 'package:delimeal_project/screens/meal_detail_sceen.dart';
import 'package:delimeal_project/screens/tab_sceen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
Map<String ,bool> _filters ={
  'gluten':false,
  'lactose':false,
  'vegan':false,
  'vegiterian':false,
};
List<Meal> _avalableMeals= DUMMY_MEALS;
List<Meal> _favoriteMeals=[];
 void _setFilters(Map<String,bool> filterData){
  setState(() {
    _filters=filterData;
    _avalableMeals=DUMMY_MEALS.where((element){ 
      if(_filters['gluten']! && !element.isGlutenFree){
        return false;
      }
       if(_filters['lactose']! && !element.isLactoseFree){
        return false;
      }
       if(_filters['vegan']! && !element.isVegan){
        return false;
      }
       if(_filters['vegiterian']! && !element.isVegetarian){
        return false;
      }
      return true;
    }).toList();
  });
 }

 void _toggleFavorite(String mealId){
  final existingIndex=
  _favoriteMeals.indexWhere((element) => element.id==mealId);
  if(existingIndex>=0){
    setState(() {
      _favoriteMeals.removeAt((existingIndex) );
    });
  }
  else
  setState(() {
    _favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id==mealId));
  });
 }
bool _isMealFavorite(String id){
  return _favoriteMeals.any((element) => element.id==id);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:  Colors.pink,
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
        '/':(ctx)=>TabScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx)=> CategoryMealsScreen(_avalableMeals),
        mealDetailSceen.routeName:(ctx)=>mealDetailSceen(_toggleFavorite,_isMealFavorite),
        FilterScreen.routeName:(ctx)=>FilterScreen(_filters,_setFilters),

      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
      // },
      // onUnknownRoute: ,
    );
  }
}

