import 'package:flutter/material.dart';
import 'package:librobot/Screens/AllCategories/AllCategories.dart';
import 'package:librobot/Screens/AvailableBooks/AvailableBooks.dart';
import 'package:librobot/Screens/ChatbotScreens/ChatbotScreen.dart';
import 'package:librobot/Screens/HomeScreens/HomeScreen.dart';
import 'package:librobot/Screens/PinEnterPage/PinEnterPage.dart';
import 'package:librobot/Screens/YourBooksStatus/YourBookStatu.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({Key? key}) : super(key: key);

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  final PageController _pageController = PageController();
  String result = '';

  List<Widget> pages = [
    HomeScreen(),
    AvailableBooks(),
    YourBookStatus(),
    AllCategories()
  ];

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.library_books,
    Icons.library_add_check_rounded,
    Icons.category,
  ];
  var currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        height: size.width * .155,
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            listOfIcons.length,
            (index) => InkWell(
              onTap: () {
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == currentIndex ? 0 : size.width * .029,
                      right: size.width * .0422,
                      left: size.width * .0422,
                    ),
                    width: size.width * .128,
                    height: index == currentIndex ? size.width * .014 : 0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Icon(
                    listOfIcons[index],
                    size: size.width * .076,
                    color: index == currentIndex ? Colors.white : Colors.grey,
                  ),
                  SizedBox(height: size.width * .03),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatbotScreen() // Assuming PinPage is your pin input page
                ),
              );
            },
            child: Icon(Icons.chat, color: Colors.white),
            backgroundColor: Colors.black,
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () async {
              // Navigate to Pin Page
              var pin = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SimpleBarcodeScannerPage() // Assuming PinPage is your pin input page
                ),
              );

              // If pin is not null, proceed with barcode scanning
              if (pin != null) {
                var res = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PinEnterPage(pin:pin),
                  ),
                );

                setState(() {
                  if (res is String) {
                    result = res;
                  }
                });
              }
            },
            child: Icon(Icons.camera_alt, color: Colors.white),
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}

// Assuming you have a PinPage widget defined somewhere in your code
