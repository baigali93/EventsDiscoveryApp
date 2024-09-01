import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramclone/components/bottomnavbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:instagramclone/components/drawer.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng mycurrentlocation = const LatLng(30.3753, 69.3451);
  LatLng cheezious = const LatLng(31.5503, 74.2838);
  LatLng cheezious1 = const LatLng(33.7194, 73.0554);
  LatLng cheezious2 = const LatLng(24.860966, 66.990501);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: Drawer(child: customdrawer(context)),
      body: Container(
          margin: const EdgeInsets.all(0.0),
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: mycurrentlocation, zoom: 5),
                markers: {
                  Marker(
                      markerId: const MarkerId('mycurrentlocation'),
                      icon: BitmapDescriptor.defaultMarker,
                      position: mycurrentlocation),
                  Marker(
                      markerId: const MarkerId('cheezious'),
                      icon: BitmapDescriptor.defaultMarker,
                      position: cheezious),
                  Marker(
                      markerId: const MarkerId('cheeziousislamabad'),
                      icon: BitmapDescriptor.defaultMarker,
                      position: cheezious1),
                  Marker(
                      markerId: const MarkerId('cheeziousiskarachi'),
                      icon: BitmapDescriptor.defaultMarker,
                      position: cheezious2)
                },
              ),
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            _scaffoldKey.currentState
                                ?.openDrawer(); // Open the drawer
                          },
                        ),
                        const Text(
                          'Hinted searcg Text',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xff49454F)),
                        ),
                        const Icon(Icons.search)
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 120,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 18, right: 18),
                  child: Row(
                    children: [
                      // SizedBox(width: 10,),
                      Expanded(
                          child: Customcontainermap(containertextmap: 'Price')),
                      Expanded(
                          child:
                              Customcontainermap(containertextmap: 'Rating')),
                      Expanded(
                          child: Customcontainermap(containertextmap: 'Hours')),
                      Expanded(
                          child: Customcontainermap(
                              containertextmap: 'All filters')),
                    ],
                  ),
                ),
              )
            ],
          )),
      bottomNavigationBar: bottomnavbar(),
    );
  }
}

// ignore: camel_case_types
class Customcontainermap extends StatelessWidget {
  final String containertextmap;
  const Customcontainermap({super.key, required this.containertextmap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffFFFFFF),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          child: Center(
              child: FittedBox(
                  child: Row(children: [
            Text(
              containertextmap,
              style: GoogleFonts.inter(fontWeight: FontWeight.w400),
            ),
            const Icon(Icons.arrow_drop_down_outlined)
          ]))),
        ),
      ),
    );
  }
}
