import 'dart:io';

import 'package:adgitm/common/loading.dart';
import 'package:adgitm/services/pdfAPI.dart';
import 'package:adgitm/tools/pdfViewer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PlacementScreen extends StatefulWidget {
  const PlacementScreen({Key key}) : super(key: key);

  @override
  _PlacementScreenState createState() => _PlacementScreenState();
}

class _PlacementScreenState extends State<PlacementScreen> {
  bool loading = false;
  String dropdownValue = 'ECE';
  String value = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text("Placement Section",
                  style: GoogleFonts.mulish(color: Colors.white)),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 2,
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: FaIcon(FontAwesomeIcons.calendarAlt),
                                title: Text(
                                  'Hiring Companies Year Wise',
                                  style: GoogleFonts.mulish(),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.center,
                                children: [
                                  // GestureDetector(
                                  //   onTap: () {},
                                  //   child: Container(
                                  //     padding: EdgeInsets.symmetric(
                                  //         vertical: 5, horizontal: 10),
                                  //     alignment: Alignment.center,
                                  //     width: 80,
                                  //     height: 25,
                                  //     decoration: BoxDecoration(
                                  //       border: Border.all(
                                  //         color: Theme.of(context).buttonColor,
                                  //       ),
                                  //       borderRadius:
                                  //           BorderRadius.circular(20.0),
                                  //     ),
                                  //     child: Text(
                                  //       "Download",
                                  //       style: GoogleFonts.mulish(
                                  //           color:
                                  //               Theme.of(context).buttonColor,
                                  //           fontSize: 12),
                                  //     ),
                                  //   ),
                                  // ),
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        loading = true;
                                      });
                                      final url =
                                          'Placement/HIRING-COMPANIES.pdf';
                                      final file =
                                          await PDFApi.loadFirebase(url);
                                      // print(file.toString());
                                      setState(() {
                                        loading = false;
                                        return;
                                      });
                                      if (file == null) {
                                        return;
                                      }
                                      openPDF(context, file);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      alignment: Alignment.center,
                                      width: 70,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).buttonColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Text(
                                        "View",
                                        style: GoogleFonts.mulish(
                                            color:
                                                Theme.of(context).buttonColor,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 10,
                                  // )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                        Card(
                          elevation: 2,
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: FaIcon(FontAwesomeIcons.building),
                                title: Text(
                                  'Major Hiring Companies',
                                  style: GoogleFonts.mulish(),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.center,
                                children: [
                                  // GestureDetector(
                                  //   onTap: () {},
                                  //   child: Container(
                                  //     padding: EdgeInsets.symmetric(
                                  //         vertical: 5, horizontal: 10),
                                  //     alignment: Alignment.center,
                                  //     width: 80,
                                  //     height: 25,
                                  //     decoration: BoxDecoration(
                                  //       border: Border.all(
                                  //         color: Theme.of(context).buttonColor,
                                  //       ),
                                  //       borderRadius:
                                  //           BorderRadius.circular(20.0),
                                  //     ),
                                  //     child: Text(
                                  //       "Download",
                                  //       style: GoogleFonts.mulish(
                                  //           color:
                                  //               Theme.of(context).buttonColor,
                                  //           fontSize: 12),
                                  //     ),
                                  //   ),
                                  // ),
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        loading = true;
                                      });
                                      final url =
                                          'Placement/major-companies-1024x930-converted.pdf';
                                      final file =
                                          await PDFApi.loadFirebase(url);
                                      print(file.toString());
                                      setState(() {
                                        loading = false;
                                        return;
                                      });
                                      if (file == null) return;
                                      openPDF(context, file);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      alignment: Alignment.center,
                                      width: 70,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).buttonColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Text(
                                        "View",
                                        style: GoogleFonts.mulish(
                                            color:
                                                Theme.of(context).buttonColor,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                        Card(
                          elevation: 2,
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: FaIcon(FontAwesomeIcons.history),
                                title: Text(
                                  'Previous Years Placement Records',
                                  style: GoogleFonts.mulish(),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.center,
                                children: [
                                  // GestureDetector(
                                  //   onTap: () {},
                                  //   child: Container(
                                  //     padding: EdgeInsets.symmetric(
                                  //         vertical: 5, horizontal: 10),
                                  //     alignment: Alignment.center,
                                  //     width: 80,
                                  //     height: 25,
                                  //     decoration: BoxDecoration(
                                  //       border: Border.all(
                                  //         color: Theme.of(context).buttonColor,
                                  //       ),
                                  //       borderRadius:
                                  //           BorderRadius.circular(20.0),
                                  //     ),
                                  //     child: Text(
                                  //       "Download",
                                  //       style: GoogleFonts.mulish(
                                  //           color:
                                  //               Theme.of(context).buttonColor,
                                  //           fontSize: 12),
                                  //     ),
                                  //   ),
                                  // ),
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        loading = true;
                                      });
                                      final url =
                                          'Placement/Placement-Record.pdf';
                                      final file =
                                          await PDFApi.loadFirebase(url);
                                      print(file.toString());
                                      if (file == null) return;
                                      setState(() {
                                        loading = false;
                                        return;
                                      });
                                      openPDF(context, file);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      alignment: Alignment.center,
                                      width: 70,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).buttonColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Text(
                                        "View",
                                        style: GoogleFonts.mulish(
                                            color:
                                                Theme.of(context).buttonColor,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                        Card(
                          elevation: 2,
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: FaIcon(FontAwesomeIcons.calendarAlt),
                                title: Text(
                                  'Placement Policy',
                                  style: GoogleFonts.mulish(),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.center,
                                children: [
                                  // GestureDetector(
                                  //   onTap: () {},
                                  //   child: Container(
                                  //     padding: EdgeInsets.symmetric(
                                  //         vertical: 5, horizontal: 10),
                                  //     alignment: Alignment.center,
                                  //     width: 80,
                                  //     height: 25,
                                  //     decoration: BoxDecoration(
                                  //       border: Border.all(
                                  //         color: Theme.of(context).buttonColor,
                                  //       ),
                                  //       borderRadius:
                                  //           BorderRadius.circular(20.0),
                                  //     ),
                                  //     child: Text(
                                  //       "Download",
                                  //       style: GoogleFonts.mulish(
                                  //           color:
                                  //               Theme.of(context).buttonColor,
                                  //           fontSize: 12),
                                  //     ),
                                  //   ),
                                  // ),
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        loading = true;
                                      });
                                      final url =
                                          'Placement/Placement-Policy.pdf';
                                      final file =
                                          await PDFApi.loadFirebase(url);
                                      setState(() {
                                        loading = false;
                                        return;
                                      });
                                      print(file.toString());
                                      if (file == null) return;
                                      openPDF(context, file);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      alignment: Alignment.center,
                                      width: 70,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).buttonColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Text(
                                        "View",
                                        style: GoogleFonts.mulish(
                                            color:
                                                Theme.of(context).buttonColor,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Branch wise Record",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: FaIcon(FontAwesomeIcons.arrowDown),
                            iconSize: 16,
                            // elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.blue[900],
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>['ECE', 'CSE']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 2, 20, 2),
                                  child: Text(
                                    value,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  value = dropdownValue;
                                  loading = true;
                                });

                                final url = value == 'CSE'
                                    ? 'Placement/cse.pdf'
                                    : 'Placement/ece2020.pdf';
                                final file = await PDFApi.loadFirebase(url);
                                // print(file.toString());
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
                                  style: GoogleFonts.mulish(
                                    fontSize: 16,
                                    color: Theme.of(context).buttonColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );
}
