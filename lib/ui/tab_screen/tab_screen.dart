import 'package:exam_repo_n8/services/firebase/fcm.dart';
import 'package:exam_repo_n8/services/provider/tab_provider.dart';
import 'package:exam_repo_n8/services/provider/ui_utils/error_message_dialog.dart';
import 'package:exam_repo_n8/ui/car_screen/car_screen.dart';
import 'package:exam_repo_n8/ui/country_screen/country_screen.dart';
import 'package:exam_repo_n8/ui/location_screen/maps_screen/maps_screen.dart';
import 'package:exam_repo_n8/ui/users_screen/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  firebaseInit() async {
    await initFirebase(context);
  }

  @override
  void initState() {
    firebaseInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: context.watch<TabProvider>().currentIndex,
        children: const [
          CountryScreen(),
          LocationScreen(),
          UsersScreen(),
          CarScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedIconTheme: const IconThemeData(color: Colors.black),
        selectedIconTheme: const IconThemeData(color: Colors.black),
        currentIndex: context.watch<TabProvider>().currentIndex,
        onTap: (index) {
          context.read<TabProvider>().updateIndex(index);
          if (index == 1) {
        showConfirmMessage(
            message: "You can tap anywhere on the map to save address!!!",
            context: context);
      }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.public,
            ),
            label: 'Country',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
            ),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_car,
            ),
            label: 'Car',
          ),
        ],
      ),
    );
  }
}
