import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';

class InfoListTileWidget extends StatelessWidget {
  final void Function()? onPressed ;
  final String text;
  final String leadingImg;
  const InfoListTileWidget(
      {Key? key, required this.text, required this.leadingImg, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          SvgPicture.asset(leadingImg),
          sizedBoxWidth16(),
          Text(
            text,
            style: TextStyles.regularStyle.copyWith(
              color: ColorStyles.neutralsTextPrimaryColor,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          Icon(
            CupertinoIcons.chevron_forward,
            color: ColorStyles.primarySurfaceHoverColor,
            size: 24,
          ),
        ],
      ),
    );
  }
}
