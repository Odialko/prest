class HeroSlide {
  final String imagePath;
  final String title;
  final String route;
  final bool isNetwork;

  HeroSlide({
    required this.imagePath,
    required this.title,
    required this.route,
    this.isNetwork = false,
  });
}
