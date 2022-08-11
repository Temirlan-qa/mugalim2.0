import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/const_color.dart';




class NavBarItemWidget extends StatelessWidget {
  final String imgUrl;
  final String title;
  final int _currentView;

  NavBarItemWidget(this.imgUrl,  this._currentView, this.title, {Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    return Container(
      padding: EdgeInsets.only(top: 4),
      color: brightness == Brightness.dark ? ColorStyles.darkthemePageBackgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
              imgUrl,
              height: 24,
              color: _currentView == 0 && title == 'feed'
                  ? ColorStyles.primaryShapeColor
                  : _currentView == 1 && title == 'zap'
                  ? ColorStyles.primaryShapeColor
                  : _currentView == 2 && title == 'mcalendar'
                  ? ColorStyles.primaryShapeColor
                  : _currentView == 3 && title == 'arrow-up-circle'
                  ? ColorStyles.primaryShapeColor
                  : _currentView == 4 && title == 'user'
                  ? ColorStyles.primaryShapeColor
                  : brightness == Brightness.dark
                  ? Colors.white
                  : ColorStyles.neutralsShapeSecondaryColor
            // : ColorStyles.neutralsShapeSecondaryColor ,
          ),
        ],
      ),
    );
  }
}