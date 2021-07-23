import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  // const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as String;
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meal'),
        ),
        body: Text('Meal Details Page'),
      ),
    );
  }
}
