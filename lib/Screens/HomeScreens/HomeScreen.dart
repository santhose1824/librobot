import 'package:flutter/material.dart';
import 'package:librobot/Screens/BookDetails/BookDetails.dart';
import 'package:librobot/Screens/ChangePin/ChangePin.dart';
import 'package:librobot/Screens/MostIssuedBooks/MostIssuedBooks.dart';
import 'package:librobot/Screens/NewArrivals/NewArrivalsScreen.dart';
import 'package:librobot/Screens/ProfileScreen/ProfileScreen.dart';
import 'package:librobot/Screens/RecommendationScreen/RecommendationScreen.dart';
import 'package:librobot/Widgets/CategoreyWidget/CategoreyWidget.dart';
import 'package:librobot/Widgets/HomeScreenWidget/HomeScreenWidget.dart';
import 'package:librobot/Widgets/HomeScreenWidget/MostIssuedBooksWidget.dart';
import 'package:librobot/Widgets/HomeScreenWidget/NewArrivalWidget.dart';
import 'package:librobot/Widgets/HomeScreenWidget/RecomendationWidget.dart';
import 'package:librobot/Widgets/TextWidget/TextWidget.dart';
import 'package:librobot/models/BookModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: TextWidget(text: 'Home'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: PopupMenuButton<String>(
              onSelected: (String choice) {
                if (choice == 'Profile') {
                   Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                } else if (choice == 'Change Pin') {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ChangePin()));
                }
              },
              itemBuilder: (BuildContext context) {
                return ['Profile', 'Change Pin'].map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
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
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeScreenWidget(
                        text1: 'New Arrival',
                        text2: 'See more',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NewArrivalsScreen()));
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var book in books.take(10))
                              if (book.isNewArrival)
                                GestureDetector(
                                  onTap: () {
                                    // Navigate to book details page passing the book details
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BookDetailsScreen(book: book),
                                      ),
                                    );
                                  },
                                  child: NewArrivalWidget(
                                      imagePath: book.imagePath),
                                ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      HomeScreenWidget(
                        text1: 'Recomended For You',
                        text2: 'See more',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RecommendationScreen()));
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var book in books.take(10))
                              if (book.isRecommendation)
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BookDetailsScreen(book: book),
                                      ),
                                    );
                                  },
                                  child: RecommendationWidget(
                                      imagePath: book.imagePath),
                                ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      HomeScreenWidget(
                        text1: 'Most Issued Books',
                        text2: 'See more',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MostIssuedBooksScreen()));
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var book in books.take(10))
                              if (book.isMostIssued)
                                GestureDetector(
                                  onTap: () {
                                    // Navigate to book details page passing the book details
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BookDetailsScreen(book: book),
                                      ),
                                    );
                                  },
                                  child: MostIssuedBooksWidget(
                                      imagePath: book.imagePath),
                                ),
                          ],
                        ),
                      ),
                    ],
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
