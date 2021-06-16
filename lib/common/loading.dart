import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(

        child: SpinKitDoubleBounce(
          color: Colors.blue[900],
          size: 100.0,
        ),
      ),
    );
  }
}
