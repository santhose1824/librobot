import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:librobot/Screens/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookIssuePin extends StatefulWidget {
  final String userName, email, roll_no, dept;
  final int year;
  BookIssuePin({
    required this.userName,
    required this.email,
    required this.roll_no,
    required this.dept,
    required this.year,
  });

  @override
  _BookIssuePinState createState() => _BookIssuePinState();
}

class _BookIssuePinState extends State<BookIssuePin> {
  List<String> otpDigits = List.generate(6, (index) => '');
  Future<void> setPin() async {
    String apiUrl = 'http://65.0.251.150/setpin';

    String pin = otpDigits.join('');

    Map<String, dynamic> requestBody = {
      'roll_no': widget.roll_no,
      'pin': pin,
    };

    String requestBodyJson = json.encode(requestBody);

    var response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestBodyJson,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      String setpinRes = responseData['setpin_res'];

      if (setpinRes == 'pin set successfully') {
        _saveUserDataLocally();
        Fluttertoast.showToast(
          msg: 'Pin Set Successfully!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[700],
          textColor: Colors.white,
          fontSize: 16.0,
        );

        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BottomNavigationbar()));
      } else {
        // Handle failure case
      }
    } else {
      // Handle error case
    }
  }

  Future<void> _saveUserDataLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', widget.userName);
    await prefs.setString('email', widget.email);
    await prefs.setString('roll_no', widget.roll_no);
    await prefs.setString('dept', widget.dept);
    await prefs.setInt('year', widget.year);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Your Pin'),
      ),
      body:  Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => SizedBox(
                  width: 48.0,
                  child: TextFormField(
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        otpDigits[index] = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              height: 50,
              width: 350, // Set the desired width here
              child: ElevatedButton(
                onPressed: () {
                  setPin();
                },
                child: Text(
                  'Set Pin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
