import 'package:delimeal_project/widgets/main_drawer.dart';
import 'package:flutter/material.dart';


class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String,bool> CurrentFilter;

   FilterScreen(this.CurrentFilter,this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan      = false;
  bool _lactoseFree= false;

  @override
  void initState() {
    _glutenFree  = widget.CurrentFilter['gluten']!;
    _lactoseFree = widget.CurrentFilter['lactose']!;
    _vegan       = widget.CurrentFilter['vegan']!;
    _vegeterian  = widget.CurrentFilter['vegiterian']!;
    super.initState();
  }

  Widget _BuildSwitchListTitle(String title, String subtitle, bool currentValue,
      Function(bool)? upDateValue) {
    return SwitchListTile(
      
      title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
      value: currentValue,
      subtitle: Text(
        subtitle,
      ),
      inactiveTrackColor: Colors.black
      ,
      onChanged: upDateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('your filters'),
          backgroundColor: Colors.pink,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed:(){
                final selectedFilters={
  'gluten':_glutenFree,
  'lactose':_lactoseFree,
  'vegan':_vegan,
  'vegiterian':_vegeterian,
};

                widget.saveFilters(selectedFilters);

                } ,
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your Meal selection',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                _BuildSwitchListTitle('Glutten-Free',
                    'Only include gluten free meals', _glutenFree, (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                _BuildSwitchListTitle('Lactose-Free',
                    'Only include Lactose free meals', _lactoseFree, (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
                _BuildSwitchListTitle(
                    'Vegeterian', 'Only include vegeterian  meals', _vegeterian,
                    (value) {
                  setState(() {
                    _vegeterian = value;
                  });
                }),
                _BuildSwitchListTitle(
                    'Vegan', 'Only include Vegan meals', _vegan, (value) {
                  setState(() {
                    _vegan = value;
                  });
                })
              ],
            ))
          ],
        ));
  }
}
