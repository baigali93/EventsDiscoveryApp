import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramclone/components/appbar.dart';
import 'package:instagramclone/components/bottomnavbar.dart';
import 'package:instagramclone/components/drawer.dart';
import 'package:instagramclone/models/profilemodel.dart';

// ignore: camel_case_types, must_be_immutable
class Profile extends StatelessWidget {
  Profile({super.key});

  List<Profiemodel> pictures = [
    Profiemodel(profilebodyimg: 'images/profilebody1.PNG'),
    Profiemodel(profilebodyimg: 'images/profilebody2.PNG'),
    Profiemodel(profilebodyimg: 'images/profilebody3.PNG'),
    Profiemodel(profilebodyimg: 'images/profilebody4.PNG'),
    Profiemodel(profilebodyimg: 'images/profilebody5.PNG'),
    Profiemodel(profilebodyimg: 'images/profilebody6.PNG'),
    Profiemodel(profilebodyimg: 'images/profilebody7.PNG'),
    Profiemodel(profilebodyimg: 'images/profilebody8.PNG'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'EatOut - Rooftop...',
        icon: Icons.notifications_none_outlined,
      ),
      drawer: Drawer(
        child: Align(
          alignment: Alignment.bottomRight,
          child: customdrawer(context),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 20,
              ),
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
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 45,
                    backgroundColor: Color(0xffFFFFFF),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/profilepicture.PNG'),
                    ),
                  ),
                ),
              ),
              // Stats and Social Media Icons
              const Expanded(
                child: Column(
                  children: [
                    // Stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StatsWidget(count: '134', label: 'Posts'),
                        StatsWidget(count: '5,678', label: 'Followers'),
                        StatsWidget(count: '4.5', label: 'Rating'),
                      ],
                    ),
                    // Social Media Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIcon(iconImg: 'images/instagram.png'),
                        CustomIcon(iconImg: 'images/facebook.png'),
                        CustomIcon(iconImg: 'images/twitter.png'),
                        CustomIcon(iconImg: 'images/youtube.png'),
                        CustomIcon(iconImg: 'images/tik-tok.png'),
                        CustomIcon(iconImg: 'images/linkedin.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(Icons.check, size: 20, color: Color(0xff2EB200)),
                  Text('Dine in',
                      style: GoogleFonts.rubik(fontWeight: FontWeight.w400)),
                  const SizedBox(width: 10),
                  const Icon(Icons.check, size: 20, color: Color(0xff2EB200)),
                  Text('Take out',
                      style: GoogleFonts.rubik(fontWeight: FontWeight.w400)),
                  const SizedBox(width: 10),
                  const Icon(Icons.check, size: 20, color: Color(0xff2EB200)),
                  Text('Delivery',
                      style: GoogleFonts.rubik(fontWeight: FontWeight.w400)),
                  const SizedBox(width: 20)
                ],
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const SizedBox(
                        width: 20,
                        height: 20,
                        child: Image(
                            image: AssetImage('images/world-wide-web.png'))),
                    const SizedBox(width: 10),
                    Text('www.eatoutrooftop.com',
                        style: GoogleFonts.rubik(fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              const SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    const Icon(Icons.pin_drop_outlined),
                    const SizedBox(width: 10),
                    Text('1441 Upper James St, Hamilton, ON L9B 1K2',
                        style: GoogleFonts.rubik(fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              const SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Icon(Icons.phone),
                    const SizedBox(width: 10),
                    Text('905 555 5126 ',
                        style: GoogleFonts.rubik(fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              const SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    const SizedBox(
                        width: 20,
                        height: 20,
                        child: Image(image: AssetImage('images/clock.png'))),
                    const SizedBox(width: 10),
                    Text('Open Now - 11:00 am - 10:00 pm',
                        style: GoogleFonts.rubik(fontWeight: FontWeight.w400)),
                  ],
                ),
              )
            ],
          ),
          const Customtab(),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: pictures.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 1.5),
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Image(
                    image: AssetImage(pictures[index].profilebodyimg),
                    fit: BoxFit.fill,
                  ),
                );
              })
        ],
      ),
      bottomNavigationBar: bottomnavbar(),
    );
  }
}

class Customtab extends StatelessWidget {
  const Customtab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          const SizedBox(height: 20),
          TabBar(
              indicatorWeight: 5,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'images/grid.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'images/open-magazine.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'images/hashtag.png',
                    fit: BoxFit.contain,
                    color: Colors.grey,
                  ),
                ),
                const Icon(
                  Icons.person_pin_outlined,
                  size: 40,
                  color: Colors.grey,
                )
              ]),
        ],
      ),
    );
  }
}

class StatsWidget extends StatelessWidget {
  final String count;
  final String label;

  const StatsWidget({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          Text(
            count,
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w700, color: const Color(0xff000000)),
          ),
          Text(
            label,
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w400, color: const Color(0xff000000)),
          ),
        ],
      ),
    );
  }
}

// CustomIcon Class for Social Media Icons
class CustomIcon extends StatelessWidget {
  final String iconImg;

  const CustomIcon({super.key, required this.iconImg});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.06,
        height: MediaQuery.of(context).size.width * 0.06,
        child: Image.asset(
          iconImg,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
