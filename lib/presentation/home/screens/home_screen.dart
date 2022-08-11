import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/const/const_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Главная',
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontFamily: 'CeraPro',
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        color: ColorStyles.neutralsPageBackgroundColor,
        child: SingleChildScrollView(
          child: ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 18,
                            child: ClipOval(
                              child: Image.asset(
                                  "assets/images/mugalim.png"
                              ),
                            ),
                        ),
                        Column(
                          children: [
                            Text('Mugalim Global'),
                            Text('час назад'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
