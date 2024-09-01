import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagramclone/screens/instagramhome/Instahome.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/storyimg.png'),
                      fit: BoxFit.cover)),
            ),
            const Positioned(top: 20, left: 16, right: 16, child: Divider()),
            Positioned(
              top: 30,
              left: 16,
              right: 16,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/Capture.PNG'),
                  ),
                  const SizedBox(width: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Bean Bliss',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(width: 4),
                          Icon(Icons.star_border_purple500_rounded,
                              color: Colors.white),
                        ],
                      ),
                      Text('Sponsored',
                          style: TextStyle(fontSize: 12, color: Colors.white)),
                    ],
                  ),
                  const Spacer(),
                  const Text('...',
                      style: TextStyle(fontSize: 28, color: Colors.white)),
                  const SizedBox(width: 8),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Instahome()));
                      },
                      child: const Icon(
                        Icons.cancel_outlined,
                        color: Colors.white,
                        size: 30,
                      )),
                ],
              ),
            )
          ]),
        ),
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 8, left: 15),
                      child: Text(
                        'send message',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child:
                    Icon(Icons.favorite_outline_outlined, color: Colors.white),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.send, color: Colors.white),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
