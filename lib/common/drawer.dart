import 'package:adgitm/screens/about/about.dart';
import 'package:adgitm/screens/feedback/feedback.dart';
import 'package:adgitm/screens/notices/NoticeScreen.dart';
import 'package:adgitm/screens/placement_section/PlacementScreen.dart';
import 'package:adgitm/screens/syllabus/syllabus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        children: [
          Container(
            height: 150,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/drawer.jpg"),
            ),
          ),

          ListTile(
            leading: FaIcon(FontAwesomeIcons.userCircle, color: Theme.of(context).iconTheme.color,),
            title: Text("About  ADGITM", style: Theme.of(context).textTheme.subtitle2,),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (builder) => About()));
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.fileWord , color: Theme.of(context).iconTheme.color,),
            title: Text("Notice",  style: Theme.of(context).textTheme.subtitle2,),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (builder) => NoticeScreen()));
            },
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (builder) => PlacementScreen()));
            },
            leading: FaIcon(FontAwesomeIcons.building, color: Theme.of(context).iconTheme.color, ),
            title: Text("Placements",  style: Theme.of(context).textTheme.subtitle2,),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (builder) => Syllabus()));
            },
            leading: FaIcon(FontAwesomeIcons.book, color: Theme.of(context).iconTheme.color, ),
            title: Text("Syllabus", style: Theme.of(context).textTheme.subtitle2,),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.paperclip , color: Theme.of(context).iconTheme.color,),
            title: Text("Resources",  style: Theme.of(context).textTheme.subtitle2,),
            onTap: () => _launchURL('https://noteshub.co.in/'),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.poll, color: Theme.of(context).iconTheme.color,),
            title: Text("Result",  style: Theme.of(context).textTheme.subtitle2,),
            onTap: () => _launchURL('https://ipuresults.co.in/'),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.commentAlt, color: Theme.of(context).iconTheme.color, ),
            title: Text("Feedback",  style: Theme.of(context).textTheme.subtitle2,),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (builder) => FeedbackScreen()));
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.questionCircle , color: Theme.of(context).iconTheme.color,),
            title: Text("Contact Us", style: Theme.of(context).textTheme.subtitle2,),
            onTap: _contact,
          ),
        ],
      ),
    );
  }

  void _launchURL(String _url) async {
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }

  void _contact() async {
    String email = 'nakulsingh1289@gmail.com';
    String _url = 'mailto:$email';
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }
}
