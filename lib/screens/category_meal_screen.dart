import 'package:delimeal_project/meal_item.dart';
// import 'package:delimeal_project/models/dummy_data.dart';
import 'package:delimeal_project/models/meal.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final  List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
   late String categoryTitle;
   late List<Meal> displayedMeals;
   var _loadingInitData=false; 
  @override
  void initState() {
   
    super.initState();
  }
  @override
  void didChangeDependencies() {
    if(!_loadingInitData){
      final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
     categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    
    displayedMeals= widget.availableMeals.where(
      (element) {
        return element.categories.contains(categoryId);
      },
    ).toList();
     _loadingInitData=true; 
    }
    
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((element) => element.id==mealId);
    });
  }
  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
           backgroundColor: Colors.pink,
        
        ),
        body: ListView.builder(
          itemBuilder: (ctx,index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              // removeItem: ()=>_removeMeal(displayedMeals[index].id
              );
            
          },
          itemCount: displayedMeals.length,
        ),);
  }
}
