import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import '../../../../core/const/const_color.dart';

class VoteNotStartedScreen extends StatelessWidget {
  const VoteNotStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Книги',
          style: TextStyles.boldStyle.copyWith(
              fontSize: 23, color: ColorStyles.neutralsTextPrimaryColor),
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12, right: 14),
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: ColorStyles.primarySurfaceColor,
                ),
                child: Icon(
                  CupertinoIcons.clear,
                  color: ColorStyles.primaryBorderColor,
                ),
              ),
            ),
          ),
          // IconButton(
          //   icon: SvgPicture.asset('assets/icons/cancel.svg'),
          //   color: ColorStyles.primaryBorderColor,
          //   onPressed: () {
          //     // Navigator.pushReplacementNamed(context, CourseRoute);
          //     Navigator.pop(widget.devScreenContext);
          //   },
          // ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              height: 1.0,
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              maxLines:2,
              'Голосование еще \nне началось',
              textAlign: TextAlign.center,
              style: TextStyles.boldStyle.copyWith(
                fontSize: 23,
                color: const Color(0xFF4A4A4A),
              ),
            ),
            Image.asset(
              'assets/images/Group.png',
            ),
            const SizedBox(height: 50,),
            CupertinoButton(
              pressedOpacity : 0.7,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: ColorStyles.primaryBorderColor,
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text(
                'На главную',
                style: TextStyles.mediumStyle.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
