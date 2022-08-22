import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/const/const_color.dart';

class NavBarItemWidget extends StatelessWidget {
  final String imgUrl;
  final String title;
  final int _currentView;

  NavBarItemWidget(
    this.imgUrl,
    this._currentView,
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    return Container(
      padding: const EdgeInsets.only(top: 9),
      color: brightness == Brightness.dark
          ? ColorStyles.darkthemePageBackgroundColor
          : Colors.white,
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imgUrl,
            height: 19,
            color: _currentView == 0 && title == 'Главная' || _currentView == 1 && title == 'Мои курсы'
                ? ColorStyles.primaryBorderColor
                    : brightness == Brightness.dark
                        ? Colors.white
                        : ColorStyles.neutralsShapeSecondaryColor,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 11,
              fontStyle: FontStyle.normal,
              fontFamily: 'assets/fonts/CeraPro-Regular.ttf',
              color: _currentView == 0 && title == 'Главная'
                  ? ColorStyles.primaryBorderColor
                  : _currentView == 1 && title == 'Мои курсы'
                      ? ColorStyles.primaryBorderColor
                      : brightness == Brightness.dark
                          ? Colors.white
                          : ColorStyles.neutralsShapeSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
