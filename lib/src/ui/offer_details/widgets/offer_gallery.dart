import 'package:flutter/material.dart';

class OfferGallery extends StatelessWidget {
  final List<String> images;
  const OfferGallery({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          // Обхід CORS через weserv.nl
          final imageUrl = "https://images.weserv.nl/?url=${Uri.encodeComponent(images[index])}";

          return Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: const EdgeInsets.only(right: 10),
            child: Image.network(imageUrl, fit: BoxFit.cover),
          );
        },
      ),
    );
  }
}