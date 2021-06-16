import 'dart:io';

import 'package:adgitm/common/drawer.dart';
import 'package:adgitm/models/notice_model.dart';
import 'package:adgitm/screens/userInfo/userInfo.dart';
import 'package:adgitm/services/auth.dart';
import 'package:adgitm/services/pdfAPI.dart';
import 'package:adgitm/tools/pdfViewer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  List<NoticeModel> title = List();
  List<NoticeModel> list = List();
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  double topContainer = 0;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.20;
    return Scaffold(
        appBar: AppBar(
          title: Text("ADGITM"),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (builder) => UserInfo()));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                child: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Welcome back,",
                  style: GoogleFonts.mulish(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                Container(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: 1,
                    child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: size.width,
                        alignment: Alignment.topCenter,
                        height: categoryHeight,
                        child: categoriesScroller),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Notices",
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.start,
                ),
                loading
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        child: Column(
                        children: [
                          Card(
                            child: ListTile(
                                // leading: FaIcon(FontAwesomeIcons.filePdf),
                                title: Text(
                                  list[0].title,
                                  style: GoogleFonts.mulish(fontSize: 13),
                                ),
                                trailing: Text(
                                  list[0].date,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                onTap: () async {
                                  final url =
                                      'http://www.ipu.ac.in' + list[0].link;
                                  loadAndOpen(url);
                                  setState(() {
                                    loading = true;
                                  });
                                }),
                          ),
                          Card(
                            child: ListTile(
                                // leading: FaIcon(FontAwesomeIcons.filePdf),
                                title: Text(
                                  list[1].title,
                                  style: GoogleFonts.mulish(fontSize: 13),
                                ),
                                trailing: Text(
                                  list[1].date,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                onTap: () async {
                                  final url =
                                      'http://www.ipu.ac.in' + list[1].link;
                                  loadAndOpen(url);
                                  setState(() {
                                    loading = true;
                                  });
                                }),
                          ),
                          Card(
                            child: ListTile(
                                // leading: FaIcon(FontAwesomeIcons.filePdf),
                                title: Text(
                                  list[2].title,
                                  style: GoogleFonts.mulish(fontSize: 13),
                                ),
                                trailing: Text(
                                  list[2].date,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                onTap: () async {
                                  final url =
                                      'http://www.ipu.ac.in' + list[2].link;
                                  loadAndOpen(url);
                                  setState(() {
                                    loading = true;
                                  });
                                }),
                          ),
                          Card(
                            child: ListTile(
                                // leading: FaIcon(FontAwesomeIcons.filePdf),
                                title: Text(
                                  list[3].title,
                                  style: GoogleFonts.mulish(fontSize: 13),
                                ),
                                trailing: Text(
                                  list[3].date,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                onTap: () async {
                                  final url =
                                      'http://www.ipu.ac.in' + list[3].link;
                                  loadAndOpen(url);
                                  setState(() {
                                    loading = true;
                                  });
                                }),
                          ),
                        ],
                      )),
                Text("Read More...",
                    style:
                        GoogleFonts.mulish(fontSize: 14, color: Colors.blue)),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ));
  }

  bool loading = false;
  void _getData() async {
    setState(() {
      loading = true;
    });
    final response =
        await http.get(Uri.parse('http://www.ipu.ac.in/notices.php'));
    dom.Document document = parser.parse(response.body);

    final elements = document.getElementsByTagName('tr').sublist(0, 6);
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
    setState(() {
      loading = false;
    });
    print(list.length);
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

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.13;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Card(

                child: Container(
                  // decoration: BoxDecoration(
                  //
                  // ),
                  height: 100,
                  width: 130,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.calendar),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Academic "),
                      Text("Calender")
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Card(
                child: Container(
                  height: 100,
                  width: 130,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.filePdf),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Syllabus "),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Card(
                child: Container(
                  height: 100,
                  width: 130,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.building),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Placements "),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Card(
                child: Container(
                  height: 100,
                  width: 130,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.userCircle),
                      SizedBox(
                        height: 10,
                      ),
                      Text("About "),
                      Text("ADGITM")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
