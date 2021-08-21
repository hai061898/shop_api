import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
    final List categories = [
    "TShirt",
    "Pants",
    "Jeans",
    "Jackets",
    "Shirt",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      margin: EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context,index)=> Container(
           margin: EdgeInsets.only(right: 8),
           decoration: BoxDecoration(  
               borderRadius: BorderRadius.circular(4.0),
            color: index == 0 ? Colors.black87 : Colors.transparent,
           ),
            padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Text(
            categories[index],
            style: TextStyle(
              color: index == 0 ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}