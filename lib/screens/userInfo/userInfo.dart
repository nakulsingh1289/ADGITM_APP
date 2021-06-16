import 'package:adgitm/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {

  final AuthService _auth = AuthService();
  TextEditingController _name = TextEditingController();
  TextEditingController _rno = TextEditingController();
  String _branch = 'CSE';
  String _shift = 'Morning';
  String _semester = '1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Profile",
          style: GoogleFonts.mulish(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: TextButton(
                onPressed: () {
                  _auth.signOut();
                  Navigator.pop(context);
                },
                child: Text(
                  "Log Out",
                  style: GoogleFonts.mulish(color: Colors.white),
                )),
          )
        ],
      ),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  textCapitalization: TextCapitalization.words,
                  controller: _name,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: "Enter your Name",
                      hintStyle: GoogleFonts.mulish(),
                      icon: FaIcon(FontAwesomeIcons.userCircle, color: Theme.of(context).iconTheme.color,),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[900]),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _rno,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Enrollment Number",
                      hintStyle: GoogleFonts.mulish(),
                      icon: FaIcon(FontAwesomeIcons.sortNumericDownAlt, color: Theme.of(context).iconTheme.color),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[900]),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("BRANCH", style: Theme.of(context).textTheme.headline6,),
                    DropdownButton<String>(
                      value: _branch,
                      style: GoogleFonts.mulish(fontSize: 16),
                      iconEnabledColor: Colors.black,
                      items: <String>[
                        'CSE',
                        'ECE',
                        'IT',
                        'EEE',
                        'MAE',
                        'ME',
                        'CIVIL',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: Theme.of(context).textTheme.headline6
                          ),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          _branch = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "SHIFT",
                        style: Theme.of(context).textTheme.headline6
                    ),
                    DropdownButton<String>(
                      value: _shift,
                      style: GoogleFonts.mulish(fontSize: 16),
                      iconEnabledColor: Colors.black,
                      items: <String>['Morning', 'Evening']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                              style: Theme.of(context).textTheme.headline6
                          ),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          _shift = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "SEMESTER",
                        style: Theme.of(context).textTheme.headline6
                    ),
                    DropdownButton<String>(
                      // focusColor:Colors.white,
                      value: _semester,
                      //elevation: 5,
                      // style: TextStyle(color: Colors.white),
                      iconEnabledColor: Colors.black,
                      items: <String>['1', '2', '3', '4', '5', '6', '7', '8']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                              style: Theme.of(context).textTheme.headline6
                          ),
                        );
                      }).toList(),
                      //
                      onChanged: (String value) {
                        setState(() {
                          _semester = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _save();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Information saved")));
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        alignment: Alignment.center,
                        width: 170,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          border: Border.all(
                            color: Colors.blue[900],
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Text(
                          "Save Information",
                          style: GoogleFonts.mulish(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadValues();
  }

  void _loadValues() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _branch = (prefs.getString('branch') ?? 'CSE');
      _shift = (prefs.getString('shift') ?? 'Morning');
      _semester = (prefs.getString('semester') ?? '1');
      _name.text = (prefs.getString('name') ?? '1');
      _rno.text = (prefs.getString('rollNo') ?? '1');
      // print(_branch+ _shift+ _semester+ _name.text + _rno.text);
    });
  }

  void _save() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('branch', _branch);
      prefs.setString('shift', _shift);
      prefs.setString('semester', _semester);
      prefs.setString('name', _name.text);
      prefs.setString('rollNo', _rno.text);

      // print(_branch+ _shift+ _semester+ _name.text + _rno.text);
    });
  }

}
