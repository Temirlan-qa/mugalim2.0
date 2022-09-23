import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/const/const_color.dart';
import '../../../../core/const/text_style_const.dart';
import '../../widgets/grid_widget.dart';

class MyChoiceScreen extends StatefulWidget {
  const MyChoiceScreen({Key? key}) : super(key: key);

  @override
  State<MyChoiceScreen> createState() => _MyChoiceScreenState();
}

class _MyChoiceScreenState extends State<MyChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
            'Мой выбор',
          style: TextStyles.boldStyle.copyWith(
            fontSize: 23,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 12,bottom: 12,right: 14),
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  //color: Colors.black
                  color: const Color(0xFFF9F9F9),
                ),
                child: Icon(
                  CupertinoIcons.clear,
                  color: ColorStyles.primaryBorderColor,
                ),
              ),
            ),
          ),

        ],
      ),
      body: const GridWidget(),
    );
  }
}
