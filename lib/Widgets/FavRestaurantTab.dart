import 'package:flutter/material.dart';

class FavRestaurantTab extends StatefulWidget {
  const FavRestaurantTab({super.key});

  @override
  State<FavRestaurantTab> createState() => _FavRestaurantTabState();
}

class _FavRestaurantTabState extends State<FavRestaurantTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Center(child: Text('No Favorite Hotels Listed in Container')),

      ),
    );
  }
}
