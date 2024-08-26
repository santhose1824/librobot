class Book {
  final int id;
  final String imagePath;
  final String authorName;
  final String title;
  final String tags;
  final bool isAvailable;
  final double rating;
  final String description;
  final bool isNewArrival;
  final bool isRecommendation;
  final bool isMostIssued;

  Book(
      {
      required  this .id
,      required this.imagePath,
      required this.authorName,
      required this.title,
      required this.rating,
      required this.description,
      required this.tags,
      required this.isAvailable,
      required this.isMostIssued,
      required this.isNewArrival,
      required this.isRecommendation});
}
