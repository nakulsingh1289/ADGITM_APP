import 'package:adgitm/screens/authentication_screens/authenticate.dart';
import 'package:adgitm/screens/home/home.dart';
import 'package:adgitm/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
// final user = Provider.of<User>(context);
// if (user == null){
//   return Authenticate();
// } else {
//   print('-----------------------------------------user -------------------------------------');
//   return Home();
// }
//   }
// }
