import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatefulWidget {
  const About({Key key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About ADGITM",
          style: GoogleFonts.mulish(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(image: AssetImage('assets/about/main2.jpg')),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Theme.of(context).canvasColor,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                child: Column(children: [
                  Text(
                    'Dr. Akhilesh Das Gupta Institute of Technology and Management, formerly known as Northern India Engineering College (NIEC),'
                    ' New Delhi was established by BBDES, LUCKNOW in the year 2003. ADGITM has an aesthetically designed campus spread over '
                    'approximately 9 acres of lush green environment at Shastri Park. The Campus comprises of five interconnected blocks'
                    ' covering a built up area of approx. 3.0 Lac sq, ft. ADGITM offers following Under Graduate and Post Graduate level '
                    'full time Professional programs approved by AICTE in affiliation with Guru Gobind Singh Indraprastha University (GGSIPU), Delhi.',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    "First Shift",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Table(
                    // defaultColumnWidth: FixedColumnWidth(120.0),
                    border: TableBorder.all(
                        color: Theme.of(context).focusColor,
                        style: BorderStyle.solid,
                        width: 1),
                    children: [
                      TableRow(
                          decoration: BoxDecoration(color: Colors.blue[900]),
                          children: [
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'B Tech. (4 Years)',
                                  style: GoogleFonts.mulish(
                                      fontSize: 16, color: Colors.white),
                                ),
                              )
                            ]),
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Session: 2020-2021',
                                  style: GoogleFonts.mulish(
                                      fontSize: 16, color: Colors.white),
                                ),
                              )
                            ]),
                          ]),
                      TableRow(children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'CSE',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '180 Seats',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'ECE',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '120 Seats',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'MAE',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '60 Seats',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'EEE',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '60 Seats',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'IT',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '180 Seats',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'CIVIL',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '120 Seats',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'ME',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '60 Seats',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                      ]),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Second Shift",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Table(
                    // defaultColumnWidth: FixedColumnWidth(120.0),
                    border: TableBorder.all(
                        color:Theme.of(context).focusColor,
                        style: BorderStyle.solid,
                        width: 1),
                    children: [
                      TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                          ),
                          children: [
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('B Tech. (4 Years)',
                                    style: GoogleFonts.mulish(
                                        fontSize: 16, color: Colors.white)),
                              )
                            ]),
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Session: 2020-2021',
                                    style: GoogleFonts.mulish(
                                        fontSize: 16, color: Colors.white)),
                              )
                            ]),
                          ]),
                      TableRow(children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'CSE',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '60 Seats',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'ECE',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '60 Seats',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'IT',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '60 Seats',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                      ]),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Department of Management",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Table(
                    // defaultColumnWidth: FixedColumnWidth(120.0),
                    border: TableBorder.all(
                        color: Theme.of(context).focusColor,
                        style: BorderStyle.solid,
                        width: 1),
                    children: [
                      TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                          ),
                          children: [
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Course',
                                    style: GoogleFonts.mulish(
                                        fontSize: 16, color: Colors.white)),
                              )
                            ]),
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Session: 2020-2021',
                                    style: GoogleFonts.mulish(
                                        fontSize: 16, color: Colors.white)),
                              )
                            ]),
                          ]),
                      TableRow(children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'MBA (2 Yrs.)',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '120 Seats',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'BBA (3 Yrs.)',
                                style: Theme.of(context).textTheme.subtitle1,
                              ))
                        ]),
                        Column(children: [
                          Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('120 Seats',
                                  style: Theme.of(context).textTheme.subtitle1))
                        ]),
                      ]),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // highlights
                  ExpansionTile(
                    iconColor: Theme.of(context).iconTheme.color,
                    collapsedIconColor: Theme.of(context).iconTheme.color,
                    collapsedTextColor: Colors.black,
                    textColor: Colors.blue[900],
                    title: Text(
                      "College Highlights",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    children: [
                      Text(
                        '•	Regular industrial visits to let the students have a feel of industry specific requirements.\n \n'
                        '•	National/International Conferences are organized each year by the College.\n \n'
                        '•	Value-added programs and visits by Guest Lecturers/Professionals from Corporate Sector/Industrial Houses to give practical inputs to the students.\n \n'
                        '•	Co-operation with multi-national companies like HP, IBM, Microsoft, HCL, CMC to impart in-house training as part of the curricula.\n \n'
                        '•	Six week in-house training programs for B.Tech. Students were organized jointly with Hewlett Packard, CMC ltd., Prolific Systems, CAD Solutions, Purple Leap, Sofcon, CADZone, Ranstad India Ltd.etc.\n \n'
                        '•	Annual Technical fest – INNOVIZ.\n \n'
                        '•	Many books have been written by our distinguished faculty members in the field of Optical Fiber Communication, Opto'
                        ' Electronics, Broadband Systems, News Writing, Organizational Behaviour, Management Concepts and many more.\n \n',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),

                  // computer labs
                  ExpansionTile(
                    iconColor: Theme.of(context).iconTheme.color,
                    collapsedIconColor: Theme.of(context).iconTheme.color,
                    collapsedTextColor: Colors.black,
                    textColor: Colors.blue[900],
                    leading: Icon(
                      Icons.computer,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      "Computer Labs",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    children: [
                      Image(image: AssetImage('assets/about/computer.jpg')),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "State-of-the-art, fully air-conditioned, laboratories at ADGITM have around 962 computers with "
                        "latest hardware configurations supporting high-end applications. Round the clock Internet facility "
                        "is available through dedicated leased line via 100 Mbps (1:1) line for use of students and faculty members. "
                        "Computer laboratories, housed in a magnificent building, provide variety of platforms and computing environment "
                        "for practical and research activities. Laboratories are equipped with latest technology computers; scientific, "
                        "technical and engineering software, training kits etc. for the engineering students.",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),

                  // library
                  ExpansionTile(
                    iconColor: Theme.of(context).iconTheme.color,
                    collapsedIconColor: Theme.of(context).iconTheme.color,
                    leading: Icon(
                      Icons.library_books,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    collapsedTextColor: Colors.black,
                    textColor: Colors.blue[900],
                    title: Text(
                      "Central Library",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    children: [
                      Image(image: AssetImage('assets/about/lib.jfif')),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "The Nerve center of our institute which we can claim as one of the best libraries amongst all the colleges "
                        "of NCR region. It has a very rich collection of more than 93,157 books, and 140 National and International J"
                        "ournals including Online Journals IEEE, ASCE, J-Gate, DELNET, National Digital Library. The label of library "
                        "services is provided to the students, staff & Faculty members for General reference and for updating their knowledge"
                        " and supporting their research and teaching/learning activities..",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),

                  // auditorium
                  ExpansionTile(
                    iconColor: Theme.of(context).iconTheme.color,
                    collapsedIconColor: Theme.of(context).iconTheme.color,
                    leading: Icon(
                      Icons.mic,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    collapsedTextColor: Colors.black,
                    textColor: Colors.blue[900],
                    title: Text(
                      "Auditorium",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    children: [
                      Image(image: AssetImage('assets/about/audi.jpg')),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "An auditorium is a room built to enable an audience to hear and watch performances at venues such as theatres. "
                        "For movie theatres, the number of auditoriums is expressed as the number of screens. The college campus boasts of"
                        " an ultra-modern air-conditioned auditorium with a seating capacity of 200. It has JBL acoustics, cinemascope projector"
                        " and a cinemascope screen. The auditorium is regularly used for organizing cultural, technical and academic events and"
                        " screening of entertainment and educational movies.",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),

                  //workshop
                  ExpansionTile(
                    iconColor: Theme.of(context).iconTheme.color,
                    collapsedIconColor: Theme.of(context).iconTheme.color,
                    leading: Icon(
                      Icons.handyman,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    collapsedTextColor: Colors.black,
                    textColor: Colors.blue[900],
                    title: Text(
                      "Central Workshop",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    children: [
                      Image(image: AssetImage('assets/about/workshop.jpg')),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Focused thrust is provided for developing precision engineering skills in our students; we boast of a "
                        "fully developed and functional workshop to let the students have a hands-on feel of basic engineering operations. "
                        "The Central workshop has been split into Welding, Foundry, Fitting, Carpentry and Sheet Metal sub-shops to let"
                        " students have practical engineering exposure.",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),

                  // canteen
                  ExpansionTile(
                    iconColor: Theme.of(context).iconTheme.color,
                    collapsedIconColor: Theme.of(context).iconTheme.color,
                    leading: Icon(
                      Icons.fastfood,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    collapsedTextColor: Colors.black,
                    textColor: Colors.blue[900],
                    title: Text(
                      "Canteen",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    children: [
                      Image(image: AssetImage('assets/about/canteen.jpg')),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "The canteen is a beautiful sloped roof building, surrounded by lush green lawns. Stationery & Photocopy shop also "
                        "available in campus. The Campus also has Coffee Shops and kiosks in its spread.",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),

                  // labs
                  ExpansionTile(
                    iconColor: Theme.of(context).iconTheme.color,
                    collapsedIconColor: Theme.of(context).iconTheme.color,
                    leading: Icon(
                      Icons.precision_manufacturing_sharp,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    collapsedTextColor: Colors.black,
                    textColor: Colors.blue[900],
                    title: Text(
                      "State of the Art Laboratories",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    children: [
                      Image(image: AssetImage('assets/about/lab.jpg')),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "As B. Tech courses are laboratory intensive, a major thrust is given to develop laboratories with top-of-the-line machines. "
                        "We have well-equipped Applied Science Labs and Departmental Specialized Labs. E.g., Microprocessor, DSR Microwave, VHDL,"
                        " LSI, Telecommunication, CAD/CAM Automation Labs, Power Electronics, Electrical machines and Advance Computer Labs for "
                        "different branches. Moreover, existing laboratories are regularly updated to meet the course contents and research needs."
                        " Today we have the finest Quality equipment to meet the total requirement of the students, faculty, and research scholars "
                        "and of the industry.",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),

                  // medical facility
                  ExpansionTile(
                    iconColor: Theme.of(context).iconTheme.color,
                    collapsedIconColor: Theme.of(context).iconTheme.color,
                    leading: Icon(
                      Icons.medical_services,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    collapsedTextColor: Colors.black,
                    textColor: Colors.blue[900],
                    title: Text(
                      "Medical Facility",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    children: [
                      Image(image: AssetImage('assets/about/medical.jpg')),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Round-the-clock in-campus medical OPD and emergency services along with provision of regular medical check-ups facilities"
                        " are available to the students of the campus. The College has tie-ups with reputed local hospitals & nursing homes"
                        " for medical treatment.",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),

                  // sports
                  ExpansionTile(
                    iconColor: Theme.of(context).iconTheme.color,
                    collapsedIconColor: Theme.of(context).iconTheme.color,
                    leading: Icon(
                      Icons.sports_cricket,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    collapsedTextColor: Colors.black,
                    textColor: Colors.blue[900],
                    title: Text(
                      "Sports Facilities",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    children: [
                      Image(image: AssetImage('assets/about/sports.jpg')),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "For other outdoor games, the campus has a courts for Volleyball, Basketball & Badminton. The in-campus students are provided "
                        "with indoor games facilities like, Table Tennis, Carom and Chess, etc.",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),

                  // security
                  ExpansionTile(
                    iconColor: Theme.of(context).iconTheme.color,
                    collapsedIconColor: Theme.of(context).iconTheme.color,
                    leading: Icon(
                      Icons.security,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    collapsedTextColor: Colors.black,
                    textColor: Colors.blue[900],
                    title: Text(
                      "Security",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    children: [
                      Image(image: AssetImage('assets/about/security.jpg')),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "The University Campus has 24×7 closed circuit TV Network security and surveillance system managed by the security personnel"
                        " equipped with wireless radio communication system.",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
