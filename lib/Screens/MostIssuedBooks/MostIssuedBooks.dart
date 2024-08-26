import 'package:flutter/material.dart';
import 'package:librobot/Screens/BookDetails/BookDetails.dart';
import 'package:librobot/Widgets/CategoreyWidget/CategoreyWidget.dart';
import 'package:librobot/Widgets/TextWidget/TextWidget.dart';
import 'package:librobot/models/BookModel.dart';

class MostIssuedBooksScreen extends StatefulWidget {
  const MostIssuedBooksScreen({Key? key}) : super(key: key);

  @override
  State<MostIssuedBooksScreen> createState() => _MostIssuedBooksScreenState();
}

class _MostIssuedBooksScreenState extends State<MostIssuedBooksScreen> {
List<Book> books = [
    Book(
        imagePath:
            'lib/assets/books/books1.jpg',
        authorName: 'Paulo Coelho',
        title: 'Alchemist',
        tags: 'Adventure,Personal GrowthPhilosophy',
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
            'lib/assets/books/books2.jpg',
        authorName: 'Jane Austen',
        title: 'Pride and Prejudice',
        tags: 'Romance,Classic,Comedy',
        isAvailable: true,
        rating: 3,
        description:
            'In Regency-era England, Elizabeth Bennet, a spirited young woman, resists proposals from two suitors, one arrogant and the other awkward, but charming. Meanwhile, her sister Jane becomes attached to the wealthy Mr. Bingley. As Elizabeth interacts with M...',
        isMostIssued: true,
        isRecommendation: true,
        isNewArrival: true,
        id: 9788172344504),
    Book(
        imagePath:
            'lib/assets/books/books3.jpg',
        authorName: 'Agatha cristie',
        title: 'The Murder of Roger Ackroyd',
        tags: 'Mystery,Detective,Fiction',
        isAvailable: true,
        rating: 3,
        description:
            'Hercule Poirot is called upon to investigate the murder of a wealthy man in a quiet English village. The suspects are all seemingly above suspicion, but Poirot must use his cunning intellect to unravel the truth.',
        isMostIssued: true,
        isRecommendation: true,
        isNewArrival: true,
        id: 69707),
    Book(
        imagePath:
            'lib/assets/books/books4.jpg',
        authorName: 'Cambridge',
        title: 'Essential Bio Informatics',
        tags: 'biology,educative',
        isAvailable: true,
        rating: 5,
        description: 'Bio informatics book',
        isMostIssued: true,
        isRecommendation: true,
        isNewArrival: true,
        id: 9780521706100),
    Book(
        imagePath:
            'lib/assets/books/books5.jpg',
        authorName: 'Ricardo Baeza',
        title: 'Modern Information Retrieval',
        tags: 'Computer Science,educative',
        isAvailable: true,
        rating: 4,
        description: 'its for irt',
        isMostIssued: true,
        isRecommendation: true,
        isNewArrival: true,
        id: 9788131709771),
    Book(
        imagePath:
            'lib/assets/books/books6.jpg',
        authorName: 'William Bolton',
        title: 'Mechatronics',
        tags: 'Mechatronics,educative',
        isAvailable: false,
        rating: 4,
        description:
            'Electronic Control systems in mechanical and electrical engineering',
        isMostIssued: true,
        isRecommendation: true,
        isNewArrival: true,
        id: 9789353065881),
    Book(
        imagePath:
            'lib/assets/books/books7.jpg',
        authorName: 'Benyamin',
        title: 'Goat Life',
        tags: 'Adventure,Tragedy',
        isAvailable: false,
        rating: 5,
        description: 'Story of goat man',
        isMostIssued: true,
        isRecommendation: true,
        isNewArrival: true,
        id: 9788184231175),
    Book(
        imagePath:
            'lib/assets/books/books8.jpg',
        authorName: 'Agatha cristie',
        title: 'And then there were none',
        tags: 'Mystery,Crime',
        isAvailable: false,
        rating: 4,
        description:
            'if youre a fan of detective movies you would love this book definitely!',
        isMostIssued: true,
        isRecommendation: true,
        isNewArrival: true,
        id: 69550),
    Book(
        imagePath:
            'lib/assets/books/books9.jpg',
        authorName: 'Paulo Coelho',
        title: 'Robin sharma',
        tags: 'Adventure',
        isAvailable: false,
        rating: 4,
        description:
            'Who will cry when you Die? Life Lessons from the monk who sold his Ferrari',
        isMostIssued: true,
        isRecommendation: true,
        isNewArrival: true,
        id: 69383),
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
  List<String> categories = [
    'Novels',
    'Adventures',
    'Fanatsy',
    'Horror',
    'Science Fiction',
    'Mystery',
    'Romance',
    'Young Adult',
    'Accadameic',
    'Techinical English',
    'General Knowledge',
    'Gov Jobs'
  ];
  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[300],
    appBar: AppBar(
      title: TextWidget(text: 'Most Issued Books'),
    ),
    body: Padding(
      padding: const EdgeInsets.only(right: 20,left: 20),
      child: Column(
        children: [
          Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var category in categories)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CategoreyWidget(text: category),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                                BookDetailsScreen(book: book),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 164, 155, 155),
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
                                        color: Colors.grey,
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
