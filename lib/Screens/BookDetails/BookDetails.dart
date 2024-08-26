import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:flutter/material.dart';
import 'package:librobot/models/BookModel.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  String result = '';

  void sendMail() async {
    final MailOptions mailOptions = MailOptions(
      body: 'I am H.M.Santhose from III AD booked this Book <br> wI will come and Issue in Library',
      subject: 'Book Reservation',
      recipients: ['santhosemaha18@gmail.com'],
      isHTML: true,
    );

    try {
      await FlutterMailer.send(mailOptions);
      print("MAil send");
      setState(() {
        result = 'Email sent successfully';
      });
    } catch (error) {
       print(error);
      setState(() {
        result = 'Error sending email: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int fullStars = widget.book.rating.floor();
    bool halfStar = (widget.book.rating - fullStars) >= 0.5;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Text(
              widget.book.title,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(width: 10),
            // Display the availability status icon
            widget.book.isAvailable
                ? Icon(Icons.check_circle, size: 30, color: Colors.green)
                : Icon(Icons.cancel, size: 30, color: Colors.red),
          ],
        ),
        actions: [
          if (widget.book.isAvailable == false)
            TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'Expected Return Date',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        content: Text(
                            'The expected return date for this book is: 15/03/2024',
                            style: TextStyle(color: Colors.black)),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Status',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ))
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    widget.book.imagePath,
                    height: 300,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.book.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'by ${widget.book.authorName}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                // Full stars
                for (int i = 0; i < fullStars; i++)
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                // Half star if necessary
                if (halfStar)
                  Icon(
                    Icons.star_half,
                    color: Colors.orange,
                  ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Tags:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                // Splitting tags and displaying them individually
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: widget.book.tags.split(',').map((tag) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                tag.trim(),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 350, // Set the desired width here
              child: GestureDetector(
                onTap: () async {
                  if (widget.book.isAvailable) {
                    // Book Now logic goes here
                    sendMail(); // Send email when booking is made
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.book.isAvailable
                        ? Colors.black
                        : Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            if (widget.book.isAvailable == false)
              Text(
                'The book is currently not available.May taken by someone check the book status!!! ',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            SizedBox(height: 20),
            Text(
              'Summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.book.description,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
