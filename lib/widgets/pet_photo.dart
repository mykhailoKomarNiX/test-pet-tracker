import 'package:flutter/material.dart';
import 'package:petTracker/localizations.dart';
import 'package:petTracker/widgets/status_circle.dart';

class PetPhoto extends StatefulWidget {
  @override
  _PetPhotoState createState() => _PetPhotoState();
}

class _PetPhotoState extends State<PetPhoto> {
  String get device => AppLocalizations.of(context).translate('device');
  String get petPhoto => AppLocalizations.of(context).translate('petPhoto');
  String get petName => AppLocalizations.of(context).translate('petName');
  String get petBreedAndPetAge =>
      AppLocalizations.of(context).translate('petBreedAndPetAge');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: Center(
            child: Text(
              petPhoto,
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
        Positioned(
            left: 30.0,
            top: 130,
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    petName,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Container(
                  child: Text(
                    petBreedAndPetAge,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ))),
        Positioned(
            right: 20.0,
            top: 20,
            child: Container(
              width: 125,
              height: 35,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  StatusCircle(),
                  Container(
                      margin: EdgeInsets.only(left: 5), child: Text(device)),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            )),
      ],
    );
  }
}

