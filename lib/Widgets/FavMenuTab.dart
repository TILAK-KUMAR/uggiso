import 'package:flutter/material.dart';

class FavMenuTab extends StatefulWidget {
  const FavMenuTab({super.key});

  @override
  State<FavMenuTab> createState() => _FavMenuTabState();
}

class _FavMenuTabState extends State<FavMenuTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text('No Favorite Dishes Listed in container'))
      ),
    );
  }
}
