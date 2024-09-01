import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramclone/components/appbar.dart';
import 'package:instagramclone/components/bottomnavbar.dart';
import 'package:instagramclone/components/drawer.dart';
import 'package:instagramclone/riverpod/imageslider.dart';
import 'package:instagramclone/screens/instagramhome/instabody.dart';
import 'package:ionicons/ionicons.dart';

// ignore: must_be_immutable
class Descriptionscreen extends ConsumerStatefulWidget {
  String heading;
  String profielimg;
  String bodyimage;
  String postname;
  String description;
  List<String> images;
  int currentindex;
  Descriptionscreen(
      {super.key,
      required this.heading,
      required this.profielimg,
      required this.bodyimage,
      required this.postname,
      required this.description,
      required this.images,
      required this.currentindex});

  @override
  ConsumerState<Descriptionscreen> createState() => _DescriptionscreenState();
}

class _DescriptionscreenState extends ConsumerState<Descriptionscreen> {
  @override
  void initState() {
    ref.read(sliderindex.notifier).state = widget.currentindex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(sliderindex);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'EVE',
        icon: Icons.notifications_none_outlined,
      ),
      drawer: Drawer(
        child: Align(
          alignment: Alignment.bottomRight,
          child: customdrawer(context),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer(builder: (context, ref, child) {
                // final currentIndex = ref.watch(sliderindex);
                return Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(widget.profielimg),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.heading,
                            style: GoogleFonts.rubik(
                                color: const Color(0xff1F132A)),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.bookmark_border_outlined,
                            size: 30,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          decoration: BoxDecoration(
                            // image:  DecorationImage(image: AssetImage(instabody[index].bodyimage), fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: PageView.builder(
                              controller:
                                  PageController(initialPage: currentIndex),
                              onPageChanged: (index) {
                                ref.read(sliderindex.notifier).state = index;
                              },
                              itemCount: widget.images.length - 5,
                              itemBuilder: (context, index) {
                                return Image.asset(widget.images[index],
                                    fit: BoxFit.fill);
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.favorite_outline, size: 24),
                                SizedBox(width: 5),
                                Icon(Icons.comment_outlined, size: 24),
                                SizedBox(width: 5),
                                Icon(Icons.send, size: 24),
                              ],
                            ),
                            Row(
                              children: List.generate(widget.images.length - 5,
                                  (index) {
                                return CustomAvatar(
                                  radius: index == currentIndex ? 5 : 4,
                                  backgroundColor: index == currentIndex
                                      ? Colors.blue
                                      : Colors.grey,
                                );
                              }),
                            ),
                            Row(
                              children: [
                                Text(
                                  '8.4 KM',
                                  style: GoogleFonts.rubik(
                                      fontSize: 11,
                                      color: const Color(0xff000000)),
                                ),
                                const Icon(Icons.location_on_outlined)
                              ],
                            )
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.postname,
                            style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff1F132A)),
                          )),
                      const SizedBox(height: 3),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.description,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1F132A)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Detailed section of the post goes here:",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1F132A)),
                        ),
                      ),
                    ],
                  ),
                );
              }),

              // static screen
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Divider(),
              ),

              const CustomRow(
                  icon: Icons.pin_drop_outlined,
                  text1: '123 Main Street',
                  text2: 'Postal Code, City, Country'),
              const CustomRow(
                  icon: Icons.calendar_today,
                  text1: 'friday July 10th - Sunday july 12',
                  text2: '5:00 pm - 12:00 pm'),
              const CustomRow(
                  icon: Ionicons.ticket_outline,
                  text1: 'General Entry - \$10.00',
                  text2: 'kids - free'),

              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Divider(),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  'Events Tags',
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: const Color(0xff49454F)),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: Row(
                  children: [
                    Expanded(
                        child: Customcontainer(containertext: 'Fine Dining')),
                    Expanded(
                        child: Customcontainer(containertext: 'Vegetarian')),
                    Expanded(
                        child: Customcontainer(containertext: 'Cocktails')),
                    Expanded(
                        child: Customcontainer(containertext: 'Vegetarian')),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: Row(
                  children: [
                    Expanded(
                        child: Customcontainer(containertext: 'Rooftop Patio')),
                    Expanded(
                        child: Customcontainer(containertext: 'City Skyline')),
                    Expanded(child: Customcontainer(containertext: 'Seafood')),
                    Expanded(child: Customcontainer(containertext: 'Vegan')),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Divider(),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomnavbar(),
    );
  }
}

// ignore: camel_case_types
class Customcontainer extends StatelessWidget {
  final String containertext;
  const Customcontainer({super.key, required this.containertext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xffD9D9D9))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          child: Center(
              child: FittedBox(
                  child: Text(
            containertext,
            style:
                GoogleFonts.inter(fontSize: 12, color: const Color(0xff1E1E1E)),
          ))),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class CustomRow extends StatelessWidget {
  final IconData icon;
  final String text1;
  final String text2;
  const CustomRow(
      {super.key,
      required this.icon,
      required this.text1,
      required this.text2});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        children: [
          Icon(icon, size: 26),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: GoogleFonts.rubik(
                    fontSize: 14, color: const Color(0xff000000)),
              ),
              const SizedBox(height: 5),
              Text(
                text2,
                style: GoogleFonts.rubik(
                    fontSize: 12, color: const Color(0xff000000)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
