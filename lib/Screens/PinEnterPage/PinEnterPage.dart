import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:librobot/Screens/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinEnterPage extends StatefulWidget {
  final String pin;
  PinEnterPage({required this.pin});
  @override
  _PinEnterPageState createState() => _PinEnterPageState();
}

class _PinEnterPageState extends State<PinEnterPage> {
  List<String> otpDigits = List.generate(6, (index) => '');
  String res = '';
  Future<String> fetchPinFromAPI(String rollNo) async {
    final response = await http.post(
      Uri.parse('http://65.0.251.150/getpin'), // Replace with your API endpoint
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'roll_no': rollNo}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData['getpin_res'];
    } else {
      throw Exception('Failed to fetch PIN');
    }
  }

  Future<void> issueBookAPI(String rollNo, String bookId) async {
    final response = await http.post(
      Uri.parse(
          'http://65.0.251.150/issue_book'), // Replace with your API endpoint
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'roll_no': rollNo, 'bid': bookId}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String issueResult = responseData['issue_res'];
      print(issueResult);
      if (issueResult == 'Book not found') {
        res = "The book is not in the library";
      } else if (issueResult == 'User not found') {
        res = "The user doesn't exist";
      }
    } else {
      throw Exception('Failed to issue book');
    }
  }

  Future<String> getStoredRollNo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('roll_no') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your Pin'),
      ),
      body: Container(
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
                onPressed: () async {
                  final String enteredPin = otpDigits.join('');
                  final String storedRollNo = await getStoredRollNo();
                  final String storedPin = await fetchPinFromAPI(storedRollNo);
                  if (enteredPin == storedPin) {
                    Fluttertoast.showToast(
                      msg: 'Pin Verified ',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.grey[700],
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BottomNavigationbar()));
                    // Call the API to issue the book
                    await issueBookAPI(storedRollNo, widget.pin);
                  } else {
                    Fluttertoast.showToast(
                      msg: 'Incorrect Pin',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.grey[700],
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                },
                child: Text(
                  'Issue',
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
            ),
          ],
        ),
      ),
    );
  }
}
