import 'package:delimeal_project/screens/categories_screen.dart';
import 'package:delimeal_project/screens/favorite_screen.dart';
import 'package:delimeal_project/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
final List<Meal> favoriteMeals;


  const TabScreen(this.favoriteMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
 List<Map<String,dynamic>> _pages=[];
int _selectPageIndex=0;

@override
  void initState() {
    _pages=[
 {'page':CategoriesScreen(),'title':'Categories'} ,
  {'page':FavoriteScreen(widget.favoriteMeals),'title':'Favorites'}
];

    super.initState();
  }
  void _selectPage(int index){
    setState(() {
    _selectPageIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectPageIndex]['title']),
          // bottom: TabBar(tabs: <Widget>[
          //   Tab(icon: Icon(Icons.category),text: 'Categories',),
          //   Tab(icon: Icon(Icons.star),text: 'Favorites',)
          // ]),
           backgroundColor: Colors.pink,
        ),
        drawer: MainDrawer(),
        body:_pages[_selectPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap:_selectPage ,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          currentIndex: _selectPageIndex,
          type:BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label:  'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label:  'Favorites',
        )
        ],
        ),
      
    );
  }
}