import 'package:applogist_case/models/place.dart';
import 'package:flutter/material.dart';

class PlaceProvider with ChangeNotifier {
  List<Place> _places = [
    Place(
      id: '1',
      title: 'Giza Necropolis',
      imageUrl: 'assets/images/places/pyramids/pyramids.jpg',
      price: 45.0,
      description:
          'The Similian Islands is an archipelago in the Andaman Sea off the coast of, and part of, Phang Nga Province of southern Thailand. It is the maritime border between India Thailand. It was established as Mu Ko Similian National Park.',
      location: 'Al Haram, Giza Governorate, Egypt',
      images: [
        'assets/images/places/pyramids/gallery/pyramids_1.jpg',
        'assets/images/places/pyramids/gallery/pyramids_2.jpg',
        'assets/images/places/pyramids/gallery/pyramids_3.jpg',
        'assets/images/places/pyramids/gallery/pyramids_4.jpg',
        'assets/images/places/pyramids/gallery/pyramids_5.jpg',
      ],
    ),
    Place(
      id: '2',
      title: 'Niagara Falls',
      imageUrl: 'assets/images/places/niagara/niagara_falls.jpg',
      price: 225.0,
      description:
          'Niagara Falls is a group of three waterfalls at the southern end of Niagara Gorge, spanning the border between the province of Ontario in Canada and the state of New York in the United States.',
      location: 'Niagara Falls, NY 14303, United States',
      images: [
        'assets/images/places/niagara/gallery/niagara_1.jpg',
        'assets/images/places/niagara/gallery/niagara_2.jpg',
        'assets/images/places/niagara/gallery/niagara_3.jpg',
        'assets/images/places/niagara/gallery/niagara_4.jpg',
        'assets/images/places/niagara/gallery/niagara_5.jpg',
      ],
    ),
  ];

  Place _selectedPlace = Place(
    id: '1',
    title: 'Giza Necropolis',
    imageUrl: 'assets/images/places/pyramids/pyramids.jpg',
    price: 45.0,
    description:
        'The Similian Islands is an archipelago in the Andaman Sea off the coast of, and part of, Phang Nga Province of southern Thailand. It is the maritime border between India Thailand. It was established as Mu Ko Similian National Park.',
    location: 'Al Haram, Giza Governorate, Egypt',
    images: [
      'assets/images/places/pyramids/gallery/pyramids.jpg',
      'assets/images/places/pyramids/gallery/pyramids_1.jpg',
      'assets/images/places/pyramids/gallery/pyramids_2.jpg',
      'assets/images/places/pyramids/gallery/pyramids_3.jpg',
      'assets/images/places/pyramids/gallery/pyramids_4.jpg',
    ],
  );

  List<Place> _filteredPlaces = [];

  List<Place> get places {
    return [..._places];
  }

  Place get selectedPlace {
    return _selectedPlace;
  }

  List<Place> get filteredPlaces {
    return [..._filteredPlaces];
  }

  Place findById(String id) {
    return _places.firstWhere((place) => place.id == id);
  }

  Future<void> setSelectedPlace(Place place) async {
    _selectedPlace = place;
    notifyListeners();
  }
}
