import 'package:adgitm/common/constants.dart';
import 'package:adgitm/common/loading.dart';
import 'package:adgitm/screens/authentication_screens/signIn.dart';
import 'package:adgitm/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: SafeArea(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.0),
                      Text("Register",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.blue[900],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue[900],
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email", style: GoogleFonts.mulish()),
                            Row(
                              children: [
                                FaIcon(FontAwesomeIcons.envelope, color: Colors.black,),
                                SizedBox(width: 10),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        // hintText: "enter email",
                                        contentPadding: EdgeInsets.all(8.0),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue[900]),
                                        )),
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    },
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue[900],
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Password", style: GoogleFonts.mulish()),
                            Row(
                              children: [
                                FaIcon(FontAwesomeIcons.key, color: Colors.black,),
                                SizedBox(width: 10),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        // hintText: "enter password ",
                                        contentPadding: EdgeInsets.all(8.0),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue[900]),
                                        )),
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    },
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              setState(() => loading = true);
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Could not sign up, please try again later")));
                                });
                              } else {
                                Navigator.of(context).pop();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              alignment: Alignment.center,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.blue[900],
                                border: Border.all(
                                  color: Colors.blue[900],
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.mulish(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: GoogleFonts.mulish(
                                fontSize: 14, color: Colors.black87),
                          ),
                          TextButton(
                            child: Text("Sign In"),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => SignInEmail()));
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
