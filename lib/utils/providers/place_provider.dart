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
      visitedBy: [
        'assets/images/places/visited/friend_1.jpg',
        'assets/images/places/visited/friend_2.jpg',
        'assets/images/places/visited/friend_3.jpg',
        'assets/images/places/visited/friend_4.jpg',
        'assets/images/places/visited/friend_5.jpg',
        'assets/images/places/visited/friend_6.jpg',
        'assets/images/places/visited/friend_7.jpg',
        'assets/images/places/visited/friend_8.jpg',
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
      visitedBy: [
        'assets/images/places/visited/friend_2.jpg',
        'assets/images/places/visited/friend_3.jpg',
        'assets/images/places/visited/friend_4.jpg',
        'assets/images/places/visited/friend_8.jpg',
      ],
    ),
    Place(
      id: '3',
      title: 'Santorini',
      imageUrl: 'assets/images/places/santorini/santorini.jpg',
      price: 125.0,
      description:
          'Santorini is one of the Cyclades islands in the Aegean Sea. It was devastated by a volcanic eruption in the 16th century BC, forever shaping its rugged landscape.',
      location: 'Santorini, Greece',
      images: [
        'assets/images/places/santorini/gallery/santorini_1.jpg',
        'assets/images/places/santorini/gallery/santorini_2.jpg',
        'assets/images/places/santorini/gallery/santorini_3.jpg',
        'assets/images/places/santorini/gallery/santorini_4.jpg',
      ],
      visitedBy: [
        'assets/images/places/visited/friend_1.jpg',
        'assets/images/places/visited/friend_2.jpg',
      ],
    ),
  ];

  List<Place> _filteredPlaces = [];

  Place _selectedPlace = Place(
    id: '',
    title: '',
    imageUrl: '',
    price: 0.0,
    description: '',
    location: '',
    images: [],
    visitedBy: [],
  );

  List<Place> get places {
    return [..._places];
  }

  List<Place> get filteredPlaces {
    return [..._filteredPlaces];
  }

  Place get selectedPlace {
    return _selectedPlace;
  }

  set filteredPlaces(List<Place> places) {
    _filteredPlaces = places;
    notifyListeners();
  }

  Place findById(String id) {
    return _places.firstWhere((place) => place.id == id);
  }

  Future<void> setSelectedPlace(Place place) async {
    _selectedPlace = place;
    notifyListeners();
  }

  void filterPlaces(String searchText) {
    _filteredPlaces = _places.where((place) {
      final title = place.title.toLowerCase();
      final location = place.location.toLowerCase();
      final searchQuery = searchText.toLowerCase();

      return title.contains(searchQuery) || location.contains(searchQuery);
    }).toList();

    notifyListeners();
  }
}
