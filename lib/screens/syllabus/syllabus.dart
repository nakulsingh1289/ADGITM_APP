import 'dart:io';

import 'package:adgitm/common/loading.dart';
import 'package:adgitm/services/pdfAPI.dart';
import 'package:adgitm/tools/pdfViewer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Syllabus extends StatefulWidget {
  const Syllabus({Key key}) : super(key: key);

  @override
  _SyllabusState createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  String _semester = '1';
  String _branch = 'CSE';
  bool loading = false;
  String _mba = 'MBA';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Syllabus",
                style: GoogleFonts.mulish(fontSize: 16),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Text(
                      "Bachelors Of Technology",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "BRANCH",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        DropdownButton<String>(
                          value: _branch,
                          //elevation: 5,
                          // style: TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.black,
                          items: <String>[
                            'CSE',
                            'IT',
                            'ECE',
                            'EEE',
                            'MAE',
                            'ME',
                            'CIVIL',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style:  Theme.of(context).textTheme.headline6,
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
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "SEMESTER",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        DropdownButton<String>(
                          value: _semester,
                          iconEnabledColor: Colors.black,
                          items: <String>[
                            '1',
                            '2',
                            '3',
                            '4',
                            '5',
                            '6',
                            '7',
                            '8'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            );
                          }).toList(),

                          onChanged: (String value) {
                            setState(() {
                              _semester = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              loading = true;
                            });
                            final url = 'syllabus/$_branch/sem$_semester.pdf';
                            final file = await PDFApi.loadFirebase(url);
                            print(file.toString());
                            if (file == null) return;

                            openPDF(context, file);
                            setState(() {
                              loading = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            alignment: Alignment.center,
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                              // color: Colors.blue[900],
                              border: Border.all(
                                color: Theme.of(context).buttonColor,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Text(
                              "View ",
                              style: GoogleFonts.mulish(fontSize: 16, color: Theme.of(context).buttonColor,),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              loading = true;
                            });
                            final url = 'syllabus/$_branch/sem$_semester.pdf';
                            final file = await PDFApi.loadFirebase(url);
                            print(file.toString());
                            if (file == null) return;

                            openPDF(context, file);
                            setState(() {
                              loading = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            alignment: Alignment.center,
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              // color: Colors.blue[900],
                              border: Border.all(
                                color: Theme.of(context).buttonColor,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Text(
                              "Download ",
                              style: GoogleFonts.mulish(fontSize: 16, color: Theme.of(context).buttonColor,),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Department of Management",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "COURSE",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        DropdownButton<String>(
                          value: _mba,
                          iconEnabledColor: Colors.black,
                          items: <String>['MBA', 'BBA']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            );
                          }).toList(),

                          onChanged: (String value) {
                            setState(() {
                              _mba = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              // value = _semester;
                              loading = true;
                            });

                            final url = 'syllabus/$_mba.pdf';
                            final file = await PDFApi.loadFirebase(url);
                            print(file.toString());
                            if (file == null) return;

                            openPDF(context, file);
                            setState(() {
                              loading = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            alignment: Alignment.center,
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                              // color: Colors.blue[900],
                              border: Border.all(
                                color: Theme.of(context).buttonColor,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Text(
                              "View ",
                              style: GoogleFonts.mulish(fontSize: 16, color: Theme.of(context).buttonColor,),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              loading = true;
                            });

                            final url = 'syllabus/$_mba.pdf';
                            final file = await PDFApi.loadFirebase(url);
                            print(file.toString());
                            if (file == null) return;

                            openPDF(context, file);
                            setState(() {
                              loading = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            alignment: Alignment.center,
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              // color: Colors.blue[900],
                              border: Border.all(
                                color: Theme.of(context).buttonColor,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Text(
                              "Download ",
                              style: GoogleFonts.mulish(fontSize: 16,color: Theme.of(context).buttonColor,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );
}
