import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'FormPopUP.dart';
import 'content_screen.dart';

class ShortsScreen extends StatefulWidget {
  static const String id = 'shorts_screen';

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final List<String> videos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVideos();
  }

  void getVideos(){
    firestore.collection('shorts').get().then((value) {
      for (var element in value.docs) {
        setState(() {
          videos.add(element['src']);
        });
      }
    });
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set the theme to dark directly
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              // We need swiper for every content
              Swiper(
                itemBuilder: (BuildContext context, int index) {
                  // videos.shuffle();
                  return ContentScreen(
                    src: videos[index],
                  );
                },
                itemCount: videos.length,
                scrollDirection: Axis.vertical,
              ),
            ],
          ),
        ),
        floatingActionButton: Visibility(
          visible: FirebaseAuth.instance.currentUser!.email == 'admin@email.com' ? true : false,
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return FormPopup();
                  }); // showDialog
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
