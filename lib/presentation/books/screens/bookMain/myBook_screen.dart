import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/const/const_color.dart';
import '../../../../core/const/text_style_const.dart';
import '../../widgets/grid_widget.dart';

class MyBookScreen extends StatefulWidget {
  final BuildContext devScreenContext;
  const MyBookScreen({Key? key, required this.devScreenContext}) : super(key: key);

  @override
  State<MyBookScreen> createState() => _MyBookScreenState();
}

class _MyBookScreenState extends State<MyBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Мои книги',
          style: TextStyles.boldStyle.copyWith(
            fontSize: 23,
            color: ColorStyles.neutralsTextPrimaryColor,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pop(widget.devScreenContext);
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
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              height: 1,
            )
        ),
      ),
      body: const GridWidget(),
    );
  }
}
