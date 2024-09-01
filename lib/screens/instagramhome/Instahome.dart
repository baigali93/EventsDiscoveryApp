import 'package:flutter/material.dart';
import 'package:instagramclone/components/appbar.dart';
import 'package:instagramclone/components/bottomnavbar.dart';
import 'package:instagramclone/components/drawer.dart';
import 'package:instagramclone/screens/instagramhome/homestatus.dart';
import 'package:instagramclone/screens/instagramhome/instabody.dart';

class Instahome extends StatefulWidget {
  const Instahome({super.key});

  @override
  State<Instahome> createState() => _InstahomeState();
}

class _InstahomeState extends State<Instahome> {
  @override
  Widget build(BuildContext context) {
    print("Rebuilding...");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'EVE',
        icon: Icons.notifications_none_rounded,
      ),
      drawer: Drawer(
        child: Align(
          alignment: Alignment.bottomRight,
          child: customdrawer(context),
        ),
      ),
      body: Column(
        children: [
          statusSection(context),
          bodysection(),
        ],
      ),
      bottomNavigationBar: bottomnavbar(),
    );
  }
}
