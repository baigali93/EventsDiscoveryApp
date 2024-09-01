import 'package:flutter/material.dart';
import 'package:instagramclone/screens/explore.dart';
import 'package:instagramclone/screens/instagramhome/Instahome.dart';
import 'package:instagramclone/screens/profile.dart';

Drawer customdrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: const EdgeInsets.all(0),
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Color(0xFF000000)), //BoxDecoration
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF000000)),
            accountName: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Bean bliss",
                style: TextStyle(fontSize: 18),
              ),
            ),
            accountEmail: Text("info@beanbliss.com"),
            currentAccountPictureSize: Size.square(40),
            currentAccountPicture: CircleAvatar(
              radius: 120,
              backgroundImage: AssetImage('images/Capture.PNG'),
            ), //circleAvatar
          ), //UserAccountDrawerHeader
        ), //DrawerHeader

        ListTile(
          leading: const Icon(Icons.home),
          title: const Text(' Home '),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const Instahome()));
          },
        ),

        ListTile(
          leading: const Icon(Icons.person),
          title: const Text(' Profile '),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Profile()));
          },
        ),

        ListTile(
          leading: const Icon(Icons.explore),
          title: const Text(' Explore '),
          onTap: () {
            // Route to TaskScreen
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const Explore()));
          },
        ),
      ],
    ),
  );
}
