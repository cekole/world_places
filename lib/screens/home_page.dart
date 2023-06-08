import 'package:applogist_case/utils/providers/place_provider.dart';
import 'package:applogist_case/widgets/custom_bottom_navigation_bar.dart';
import 'package:applogist_case/widgets/custom_drawer.dart';
import 'package:applogist_case/widgets/custom_textfield.dart';
import 'package:applogist_case/widgets/place_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      drawer: CustomDrawer(),
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
              const CustomTextField(),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: Provider.of<PlaceProvider>(
                    context,
                    listen: false,
                  ).places.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
                  itemBuilder: (context, index) {
                    return PlaceCard(
                      place: Provider.of<PlaceProvider>(
                        context,
                        listen: false,
                      ).places[index],
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
