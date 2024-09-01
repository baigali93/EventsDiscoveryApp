import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramclone/models/status.dart';
import 'package:instagramclone/screens/stroyscreen.dart';

Material statusSection(BuildContext context) {
  final List<Status> statusimages = [
    Status(imagpath: 'images/Capture.PNG', uploadername: 'Bean Bliss'),
    Status(imagpath: 'images/status1.PNG', uploadername: 'Aldenaire'),
    Status(imagpath: 'images/status2.PNG', uploadername: 'Barry' 's'),
    Status(imagpath: 'images/status3.PNG', uploadername: 'steve.io'),
    Status(imagpath: 'images/status1.PNG', uploadername: 'samentha'),
    Status(imagpath: 'images/status2.PNG', uploadername: 'jessica'),
  ];

  return Material(
    elevation: 1,
    child: Container(
      margin: const EdgeInsets.only(left: 10),
      height: 120,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StoryScreen()));
                    },
                    child: const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('images/profilepicture.PNG'),
                    ),
                  ),
                  const Positioned(
                    top: 50,
                    left: 50,
                    child: CircleAvatar(
                      backgroundColor: Color(0XFF1FA1FF),
                      radius: 10,
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: Color(0XFFFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Ruffles',
                style: GoogleFonts.rubik(
                    fontSize: 15, color: const Color(0xff6E6E6E)),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StoryScreen())),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: statusimages.map((value) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xffC913B9),
                                Color(0xffF9373F),
                                Color(0xffFECD00),
                              ],
                              // stops: [0.1, 0.3, 0.5, 0.7, 0.9, 1.0],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(value.imagpath),
                          ),
                        ),
                      ),
                      Text(
                        value.uploadername,
                        style: GoogleFonts.rubik(
                            fontSize: 15, color: const Color(0xff000000)),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
