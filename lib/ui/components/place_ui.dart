import 'package:flutter/material.dart';
import 'package:lyme_app/domain/models/place.dart'; 

class PlaceCard extends StatelessWidget {
  final Place place; 

  const PlaceCard({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Tapped on place: ${place.placeName}');
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.33,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0x493C3C43),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
 Positioned.fill(
  child: ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.network(
      'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg', // Replace with the actual URL
      fit: BoxFit.cover, // Optional: adjust the fit to ensure the image fills the space appropriately
    ),
  ),
),
            // Gradient overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [
                      Colors.black.withAlpha(0),
                      Colors.black.withAlpha((0.75 * 255).toInt()),
                      Colors.black.withAlpha((0.75 * 255).toInt()),
                    ],
                    stops: [0.4, 0.8, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            // Text
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.all(12),
                child: Text(
                  place.placeName, // Access the place name from the Place object
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}