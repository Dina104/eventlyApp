import 'package:evently_app_app/core/resourese/colors_manager.dart';
import 'package:evently_app_app/core/routes_manager/routes_manager.dart';
import 'package:evently_app_app/feature/main_layout/tabs/favorite/favorite_tab.dart';
import 'package:evently_app_app/feature/main_layout/tabs/home/home_tab.dart';
import 'package:evently_app_app/feature/main_layout/tabs/map/map_tab.dart';
import 'package:evently_app_app/feature/main_layout/tabs/profile/profile_tab.dart';
import 'package:evently_app_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> tabs = [HomeTab(), GoogleMapsScreen(), FavoriteTab(), ProfileTab()];
  int selectedindex = 0;
  late AppLocalizations applocalizations;

  @override
  Widget build(BuildContext context) {
    applocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      extendBody: true,
      body: tabs[selectedindex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildFab() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, RoutesManager.createEvent);
      },
      child: Icon(Icons.add),
    );
  }

  BottomAppBar _buildBottomNavigationBar() {
    return BottomAppBar(
      notchMargin: 8,
      child: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: _onTap,

        items: [
          BottomNavigationBarItem(
            icon: Icon(selectedindex == 0 ? Icons.home : Icons.home_outlined),
            label: applocalizations.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedindex == 1
                  ? Icons.location_on
                  : Icons.not_listed_location_outlined,
            ),
            label: applocalizations.map,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedindex == 2 ? Icons.favorite : Icons.favorite_border,
            ),
            label: applocalizations.favorite,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedindex == 3 ? Icons.person : Icons.person_outline,
            ),
            label: applocalizations.profile,
          ),
        ],
      ),
    );
  }

  void _onTap(int newindex) {
    setState(() {
      selectedindex = newindex;
    });
  }
}


