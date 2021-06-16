import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reviews_slider/reviews_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key key}) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  CollectionReference feedback =
      FirebaseFirestore.instance.collection('feedback');
  int selectedValue1;
  TextEditingController _feedback = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Feedback",
          style: GoogleFonts.mulish(),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(children: [
              Container(
                child: TextField(
                  controller: _feedback,
                  decoration: InputDecoration(
                    hintText: 'Type Text Here...',
                    hintStyle: Theme.of(context).textTheme.headline6,
                    filled: true,
                    fillColor: Theme.of(context).hintColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      borderSide: BorderSide(
                          color: Theme.of(context).buttonColor, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      borderSide: BorderSide(color: Colors.lightBlue),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  minLines: 16, //Normal textInputField will be displayed
                  maxLines: 35, // when user presses enter it will adapt to it
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'How was the service you received?',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 20),
                  ReviewSlider(
                    optionStyle: TextStyle(
                      color: Theme.of(context).buttonColor,
                    ),
                    onChange: onChange1,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      addFeedback();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Thanks for your feedback : )")));
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      alignment: Alignment.center,
                      width: 180,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        border: Border.all(
                          color: Colors.blue[900],
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text(
                        "Submit Feedback",
                        style: GoogleFonts.mulish(
                            fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void onChange1(int value) {
    setState(() {
      selectedValue1 = value;
    });
  }

  Future<void> addFeedback() {
    return feedback
        .add({'review': _feedback.text, 'rating': selectedValue1})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
