import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/const_color.dart';

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
      padding: EdgeInsets.only(top: 0, bottom: 0),
      color: brightness == Brightness.dark
          ? ColorStyles.darkthemePageBackgroundColor
          : Colors.white,
      width: MediaQuery.of(context).size.width / 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(imgUrl,
              height: 24,
              color: _currentView == 0 && title == 'Главная'
                  ? ColorStyles.primaryShapeColor
                  : _currentView == 1 && title == 'Развитие'
                      ? ColorStyles.primaryShapeColor
                      : _currentView == 2 && title == 'Расписание'
                          ? ColorStyles.primaryShapeColor
                          : _currentView == 3 && title == 'Рейтинг'
                              ? ColorStyles.primaryShapeColor
                              : _currentView == 4 && title == 'Профиль'
                                  ? ColorStyles.primaryShapeColor
                                  : brightness == Brightness.dark
                                      ? Colors.white
                                      : Color(0xff1A1A1A)
              // : ColorStyles.neutralsShapeSecondaryColor ,
              ),
          SizedBox(height: 4,),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 11,
                fontFamily: 'CeraPro',
                color: _currentView == 0 && title == 'Главная'
                    ? ColorStyles.primaryShapeColor
                    : _currentView == 1 && title == 'Развитие'
                        ? ColorStyles.primaryShapeColor
                        : _currentView == 2 && title == 'Расписание'
                            ? ColorStyles.primaryShapeColor
                            : _currentView == 3 && title == 'Рейтинг'
                                ? ColorStyles.primaryShapeColor
                                : _currentView == 4 && title == 'Профиль'
                                    ? ColorStyles.primaryShapeColor
                                    : brightness == Brightness.dark
                                        ? Colors.white
                                        : Color(0xff1A1A1A),
            ),
          ),
        ],
      ),
    );
  }
}
