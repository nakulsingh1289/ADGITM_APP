import 'dart:io';

import 'package:adgitm/models/notice_model.dart';
import 'package:adgitm/services/pdfAPI.dart';
import 'package:adgitm/tools/pdfViewer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key key}) : super(key: key);

  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  List<NoticeModel> title = List();
  List<NoticeModel> list = List();
  bool loading = false;

  void _getData() async {
    final response =
        await http.get(Uri.parse('http://www.ipu.ac.in/notices.php'));
    dom.Document document = parser.parse(response.body);

    final elements = document.getElementsByTagName('tr').sublist(0,500);
    title = elements.map((e) {
      var temp = e.getElementsByTagName('td');
      if (temp.length == 2) {
        String link = e.getElementsByTagName('a')[0].attributes['href'];
        String title = e.getElementsByTagName('a')[0].innerHtml;
        String date = e.getElementsByTagName('td')[1].innerHtml;
        return NoticeModel(title, date, link);
      }
    }).toList();

    for (NoticeModel n in title) {
      if (n == null) {
        continue;
      } else {
        list.add(n);
      }
    }
    print(list.length);
    setState(() {});
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notices",
          style: GoogleFonts.mulish(),
        ),
        actions: [
          GestureDetector(
            onTap:  () {
              list = List();
              title = List();
              setState(() {
                loading = true;
              });

              _getData();

              setState(() {
                loading = false;
              });
            },
            child: Container(
              child: Row(
                children: [
                  Text("Refresh", style: GoogleFonts.mulish(fontSize: 13), ),
                  SizedBox(width: 4,),
                  FaIcon(FontAwesomeIcons.redo, size: 16,),
                  SizedBox(width: 16,),
                ],
              ),
            ),
          )
        ],
      ),
      body: list.length == 0 || loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.fromLTRB(10.0, 10.0,10.0, 0.0),
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(

                      child: Card(
                        child: ListTile(
                            // leading: FaIcon(FontAwesomeIcons.filePdf),
                            title: Text(list[index].title, style:GoogleFonts.mulish(fontSize: 13) ,),
                            trailing: Text(list[index].date, style: Theme.of(context).textTheme.headline6,),
                            onTap: () async {
                              final url =
                                  'http://www.ipu.ac.in' + list[index].link;
                              loadAndOpen(url);
                              setState(() {
                                loading = true;
                              });
                            }),
                      ),
                    );
                  }),
            ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );

  void loadAndOpen(String url) async {
    final file = await PDFApi.loadNetwork(url);
    print(file.toString());
    if (file == null) {
      setState(() {
        loading = false;
      });
    }
    setState(() {
      loading = false;
    });
    openPDF(context, file);
  }
}
