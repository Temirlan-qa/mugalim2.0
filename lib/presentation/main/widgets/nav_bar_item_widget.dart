import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/const_color.dart';

class NavBarItemWidget extends StatelessWidget {
  final String imgUrl;
  final String title;
  final int _currentView;

  const NavBarItemWidget(
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
      width: MediaQuery.of(context).size.width / 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imgUrl,
            height: 19,
            color: _currentView == 0 && title == 'Главная'
                ? ColorStyles.primaryBorderColor
                : _currentView == 1 && title == 'Развитие'
                    ? ColorStyles.primaryBorderColor
                    : _currentView == 2 && title == 'Расписание'
                        ? ColorStyles.primaryBorderColor
                        : _currentView == 3 && title == 'Рейтинг'
                            ? ColorStyles.primaryBorderColor
                            : _currentView == 4 && title == 'Профиль'
                                ? ColorStyles.primaryBorderColor
                                : brightness == Brightness.dark
                                    ? Colors.white
                                    : ColorStyles.neutralsTextPrimaryColor,
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
                  : _currentView == 1 && title == 'Развитие'
                      ? ColorStyles.primaryBorderColor
                      : _currentView == 2 && title == 'Расписание'
                          ? ColorStyles.primaryBorderColor
                          : _currentView == 3 && title == 'Рейтинг'
                              ? ColorStyles.primaryBorderColor
                              : _currentView == 4 && title == 'Профиль'
                                  ? ColorStyles.primaryBorderColor
                                  : brightness == Brightness.dark
                                      ? Colors.white
                                      : ColorStyles.neutralsTextPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
