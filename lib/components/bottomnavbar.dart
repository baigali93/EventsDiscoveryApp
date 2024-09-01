import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramclone/riverpod/bottomriverpod.dart';
import 'package:instagramclone/screens/explore.dart';
import 'package:instagramclone/screens/instagramhome/Instahome.dart';
import 'package:instagramclone/screens/profile.dart';
import 'package:instagramclone/screens/stroyscreen.dart';

Consumer bottomnavbar() {
  return Consumer(builder: (context, ref, child) {
    final selectedindex = ref.watch(bottomindexprovider);
    // Function to navigate to the selected screen
    void navigateToScreen(int index) {
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Instahome()),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Explore()),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const StoryScreen()),
          );
          break;
        case 3:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Instahome()),
          );
          break;
        case 4:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Profile()),
          );
          break;
      }
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedindex,
      onTap: (index) {
        ref.read(bottomindexprovider.notifier).state = index;
        navigateToScreen(index);
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_rounded,
              size: 30,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              size: 30,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: ''),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
    );
  });
}
