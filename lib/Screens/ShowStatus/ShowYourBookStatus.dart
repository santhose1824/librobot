import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

class ShowYourBookStatus extends StatefulWidget {
  final book;

  ShowYourBookStatus({required this.book});

  @override
  State<ShowYourBookStatus> createState() => _ShowYourBookStatusState();
}

class _ShowYourBookStatusState extends State<ShowYourBookStatus> {
  void sendMail(DateTime? newDataTime) async {
    final MailOptions mailOptions = MailOptions(
      body:
          'I am H.M.Santhose from III AD wanted to Renw this book upto <br> $newDataTime',
      subject: 'Book Reservation',
      recipients: ['santhosemaha18@gmail.com'],
      isHTML: true,
    );

    try {
      await FlutterMailer.send(mailOptions);
      print("MAil send");
    } catch (error) {
      print(error);
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
            Expanded(
              child: Text(
                widget.book.title,
                style: TextStyle(color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 10),
            // Display the availability status icon
          ],
        ),
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
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.book.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      'Issued Date :',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '12/02/2024',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'by ${widget.book.authorName}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      'Return Date :',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '17/02/2024',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: (widget.book.tags.split(',') as List<String>)
                        .map((tag) {
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
            
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 350, // Set the desired width here
              child: GestureDetector(
                onTap: () async {
                  DateTime? newDateTime = await showRoundedDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 1),
                    lastDate: DateTime(DateTime.now().year + 1),
                    borderRadius: 16,
                  );
                  sendMail(newDateTime);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Extend Timing',
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
          ],
        ),
      ),
    );
  }
}
