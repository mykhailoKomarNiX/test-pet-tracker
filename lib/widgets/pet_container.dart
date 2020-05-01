import 'package:flutter/material.dart';
import 'package:petTracker/widgets/pet.dart';

class PetContainer extends StatefulWidget {
  @override
  _PetContainerState createState() => _PetContainerState();
}

class _PetContainerState extends State<PetContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Pet(border: true),
          Pet(),
          Pet(),
        ],
      ),
    );
  }
}

