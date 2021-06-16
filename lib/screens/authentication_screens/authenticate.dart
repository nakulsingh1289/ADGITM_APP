import 'package:adgitm/common/loading.dart';
import 'package:adgitm/screens/authentication_screens/register.dart';
import 'package:adgitm/screens/authentication_screens/signIn.dart';
import 'package:adgitm/services/auth.dart';
import 'package:adgitm/temp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool loading = false;
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: SafeArea(
                child: Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                        Image(
                          image: AssetImage("assets/images/logo.png"),
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.height * 0.25,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // Text("Welcome to ADGITM",
                        //     style: GoogleFonts.mulish(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 30,
                        //       color: Colors.blue[900],
                        //     )),
                        // SizedBox(
                        //   height:  MediaQuery.of(context).size.height * 0.05,
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Login with",
                          style: GoogleFonts.mulish(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          elevation: 3,
                          color: Colors.blue[800],
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.userSecret,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Guest",
                              style: GoogleFonts.mulish(color: Colors.white),
                            ),
                            onTap: () async {
                              setState(() {
                                loading = true;
                              });
                              await _auth.signInAnon();
                              setState(() {
                                loading = false;
                              });
                            },
                            trailing: FaIcon(FontAwesomeIcons.arrowCircleRight,
                                color: Colors.white),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          elevation: 3,
                          color: Colors.blue[800],
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignInEmail()));
                            },
                            leading: FaIcon(FontAwesomeIcons.envelope,
                                color: Colors.white),
                            title: Text(
                              "Email",
                              style: GoogleFonts.mulish(color: Colors.white),
                            ),
                            trailing: FaIcon(
                              FontAwesomeIcons.arrowCircleRight,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          elevation: 3,
                          color: Colors.blue[800],
                          child: ListTile(
                            onTap: () {
                              _auth.signInWithGoogle();
                            },
                            leading: FaIcon(FontAwesomeIcons.google,
                                color: Colors.white),
                            title: Text(
                              "Google",
                              style: GoogleFonts.mulish(color: Colors.white),
                            ),
                            trailing: FaIcon(
                              FontAwesomeIcons.arrowCircleRight,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Don't have an account? Sign Up",
                    // textAlign: TextAlign.start,
                    style: GoogleFonts.mulish(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue[900],
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 55,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Register()));
                      },
                      leading: FaIcon(
                        FontAwesomeIcons.envelope,
                        color: Colors.blue[900],
                      ),
                      title: Text(
                        "Email",
                        style: GoogleFonts.mulish(
                          color: Colors.blue[900],
                        ),
                      ),
                      trailing: FaIcon(
                        FontAwesomeIcons.arrowCircleRight,
                        color: Colors.blue[900],
                      ),
                    ),
                  )
                ],
              ),
            )),
          );
  }
}
