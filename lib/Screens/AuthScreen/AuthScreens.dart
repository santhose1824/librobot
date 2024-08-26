import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:librobot/Screens/BookIssuePin/BookIssuePin.dart';
import 'package:librobot/Widgets/AuthTextFeilds/AuthTextFeilds.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false; // Add this variable

  Future<void> login() async {
    setState(() {
      isLoading = true; // Set isLoading to true when login process starts
    });

    String apiUrl = 'http://65.0.251.150/login';

    Map<String, String> requestBody = {
      'roll_no': email.text,
      'password': password.text,
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
      Map<String, dynamic> data = json.decode(response.body);
      String loginSuccess = data['log_res'];
      String email = data['email'];
      String roll_no = data['roll_no'];
      String name = data['name'];
      int year = data['Year'];
      String dept = data['dept'];
      print(loginSuccess);
      print(email);
      print(roll_no);
      print(dept);
      print(year);
      print(name);
      if (loginSuccess == 'login success') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => BookIssuePin(
              userName: name,
              roll_no: roll_no,
              email: email,
              dept: dept,
              year: year,
            ),
          ),
        );
        print('Login Successful');
      } else {
        print('Login Failed');
      }
    } else {
      print('Error: ${response.reasonPhrase}');
    }

    setState(() {
      isLoading = false; // Set isLoading back to false when login process completes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'KCET Library',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    AuthTextFeilds(
                      controller: email,
                      obsecureText: false,
                      hint: 'Roll Number',
                      prefixIcon: Icon(Icons.email),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AuthTextFeilds(
                      controller: password,
                      obsecureText: true,
                      hint: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          isLoading
              ? CircularProgressIndicator() // Show CircularProgressIndicator if isLoading is true
              : SizedBox(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    child: Text(
                      'Login',
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
    );
  }
}
