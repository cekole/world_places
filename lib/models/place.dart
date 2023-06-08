class Place {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  final String location;
  final List<String> images;
  final List<String> visitedBy; //these are imageUrls for the circle avatars

  Place({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.location,
    required this.images,
    required this.visitedBy,
  });
}
