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
      padding: const EdgeInsets.only(top: 4),
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
                  ? Color(0xFF3D3DD8)
                  : _currentView == 1 && title == 'Развитие'
                      ? Color(0xFF3D3DD8)
                      : _currentView == 2 && title == 'Расписание'
                          ? Color(0xFF3D3DD8)
                          : _currentView == 3 && title == 'Рейтинг'
                              ? Color(0xFF3D3DD8)
                              : _currentView == 4 && title == 'Профиль'
                                  ? Color(0xFF3D3DD8)
                                  : Color(0xFF1A1A1A)
              // : ColorStyles.neutralsShapeSecondaryColor ,
              ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: 'Cera Pro',
                fontWeight: FontWeight.w700,
                fontSize: 11,
                color: _currentView == 0 && title == 'Главная'
                    ? Color(0xFF3D3DD8)
                    : _currentView == 1 && title == 'Развитие'
                        ? Color(0xFF3D3DD8)
                        : _currentView == 2 && title == 'Расписание'
                            ? Color(0xFF3D3DD8)
                            : _currentView == 3 && title == 'Рейтинг'
                                ? Color(0xFF3D3DD8)
                                : _currentView == 4 && title == 'Профиль'
                                    ? Color(0xFF3D3DD8)
                                    : Color(0xFF1A1A1A)),
          ),
        ],
      ),
    );
  }
}
