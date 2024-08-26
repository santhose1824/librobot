import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:librobot/Screens/BottomNavigationBar/BottomNavigationBar.dart';

class ChangePin extends StatefulWidget {
  @override
  _ChangePinState createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  List<String> otpDigits = List.generate(6, (index) => '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Pin'),
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
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Success',style: TextStyle(color: Colors.black,fontSize: 20),),
                      content: Text('Pin Change Successfully!',style: TextStyle(color: Colors.black,fontSize: 15)),
                      actions: [
                        TextButton(
                          child: Text('OK',style: TextStyle(color: Colors.black,fontSize: 20)),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BottomNavigationbar()));
                            Fluttertoast.showToast(
                              msg: 'Pin Changed',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.grey[700],
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              //login();
            },
            child: Text(
              'Change Pin',
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
                    borderRadius: BorderRadius.circular(10))),
             ),
           )
          ],
        ),
      ),
    );
  }
}
