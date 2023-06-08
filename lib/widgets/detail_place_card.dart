import 'dart:math';

import 'package:applogist_case/models/place.dart';
import 'package:flutter/material.dart';

class DetailPlaceCard extends StatelessWidget {
  const DetailPlaceCard({
    super.key,
    required this.currentPlace,
  });

  final Place currentPlace;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            bottom: 24.0,
          ),
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(currentPlace.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: MediaQuery.of(context).size.width * 0.1,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white,
            ),
            child: Row(
              children: [
                for (int i = 0; i < min(3, currentPlace.visitedBy.length); i++)
                  Align(
                    widthFactor: 0.75,
                    child: CircleAvatar(
                      radius: 18,
                      foregroundImage: AssetImage(currentPlace.visitedBy[i]),
                    ),
                  ),
                if (currentPlace.visitedBy.length > 3)
                  Align(
                    widthFactor: 0.75,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 18,
                      child: Text(
                        '+${currentPlace.visitedBy.length - 3}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
