import 'package:adgitm/common/themedata.dart';
import 'package:adgitm/screens/wrapper.dart';
import 'package:adgitm/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      initialData: null,
      value : AuthService().user,

      child: MaterialApp(
        // theme: themeData,
        darkTheme: themeDataDark,
        theme: themeData,
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}