import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;

    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String subtitle,
    Function(bool) updateValue,
    bool currentValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favorites'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(
              Icons.save,
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your Meals',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only show gluten-free meals',
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  _glutenFree,
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only show Vegetarian meals',
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                  _vegetarian,
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only show lactose-free meals',
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  _lactoseFree,
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only show Vegan meals',
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  _vegan,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
