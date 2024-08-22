import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../meal_item.dart';

class FavoriteScreen extends StatelessWidget {

  
  
final List<Meal> favoriteMeals;
  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
      child: Text('The you have no favorite yet-Start adding some',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
    );

    }
    else
    return  ListView.builder(
          itemBuilder: (ctx,index) {
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
              // removeItem: ()=>_removeMeal(favoriteMeals[index].id),
            );
          },
          itemCount: favoriteMeals.length,
        );
    
    
  }
} 