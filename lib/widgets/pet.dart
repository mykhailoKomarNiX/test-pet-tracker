import 'package:flutter/material.dart';

class Pet extends StatefulWidget {
  Pet({this.border = false});

  final bool border;
  @override
  _PetState createState() => _PetState();
}

class _PetState extends State<Pet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: widget.border ? Border.all() : null,
          shape: BoxShape.circle,
          color: Colors.grey),
    );
  }
}
