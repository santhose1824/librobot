import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:librobot/Screens/ShowStatus/ShowYourBookStatus.dart';
import 'package:librobot/Widgets/TextWidget/TextWidget.dart';
import 'package:librobot/models/BookModel.dart';

class YourBookStatus extends StatefulWidget {
  const YourBookStatus({super.key});

  @override
  State<YourBookStatus> createState() => _YourBookStatusState();
}

class _YourBookStatusState extends State<YourBookStatus> {

List<Book> books = [
    Book(
        imagePath:
            'lib/assets/books/books1.jpg',
        authorName: 'Paulo Coelho',
        title: 'Alchemist',
        tags: 'Adventure,Philosophy',
        isAvailable: true,
        rating: 3,
        description:
            'A shepherd boy named Santiago embarks on a journey to find treasure, inspired by his recurring dreams. Along the way, he meets a variety of people who teach him valuable lessons about life and the pursuit of his goals.',
        isMostIssued: true,
        isRecommendation: true,
        isNewArrival: true,
        id: 69622),
    Book(
        imagePath:
            'lib/assets/books/books10.jpg',
        authorName: 'Preety shenoy',
        title: 'Life is what you make it ',
        tags: 'Drama,Love',
        isAvailable: false,
        rating: 3.5,
        description:
            'Life Is What You Make It is a novel by Preeti Shenoy. The book was in "Top books of 2011" as per the Nielsen list which is published in Hindustan Times. It was also on Times of India all-time best sellers of 2011.',
        isMostIssued: true,
        isRecommendation: true,
        isNewArrival: true,
        id: 69449),

    // Add more books as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: TextWidget(text: 'Your Book Status'),
      ),
      body:Padding(
      padding: const EdgeInsets.only(right: 20,left: 20),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            height: 50,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.search, color: Colors.black),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded( // Ensures the list container takes all the remaining space
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(), // Enable bouncing effect
              child: Column(
                children: [
                  for (var book in books)
                    if (book.isNewArrival == true)
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                ShowYourBookStatus(book: book),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16.0),
                          decoration: BoxDecoration(
                            color:Color.fromARGB(255, 164, 155, 155),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  book.imagePath,
                                  height: 100,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${book.title}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'by ${book.authorName}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[200],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}
