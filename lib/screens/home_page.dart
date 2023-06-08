import 'package:applogist_case/utils/providers/place_provider.dart';
import 'package:applogist_case/widgets/custom_bottom_navigation_bar.dart';
import 'package:applogist_case/widgets/custom_drawer.dart';
import 'package:applogist_case/widgets/custom_textfield.dart';
import 'package:applogist_case/widgets/place_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final placeData = Provider.of<PlaceProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      drawer: const CustomDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              padding: const EdgeInsets.only(left: 32.0),
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: CircleAvatar(
              child: Image.asset('assets/images/avatar.png', fit: BoxFit.cover),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi Alen!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Let\'s explore The Big\nWorld Around Us!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                onChanged: (text) {
                  setState(() {
                    searchText = text;
                  });
                  placeData.filterPlaces(searchText);
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: searchText.isEmpty
                      ? placeData.places.length
                      : placeData.filteredPlaces.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
                  itemBuilder: (context, index) {
                    return searchText.isEmpty
                        ? PlaceCard(
                            place: placeData.places[index],
                          )
                        : PlaceCard(
                            place: placeData.filteredPlaces[index],
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
