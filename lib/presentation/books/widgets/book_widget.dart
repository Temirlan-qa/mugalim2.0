import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../core/const/const_color.dart';
import '../../../core/const/text_style_const.dart';
import '../../../core/routes/environment_config.dart';

class BookWidget extends StatefulWidget {
  final String? textMonth;
  final String? img;
  const BookWidget({Key? key, required this.textMonth, required this.img}) : super(key: key);

  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {


  @override
  Widget build(BuildContext context) {
    Box tokensBox = Hive.box('tokens');
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: widget.img != null && widget.img != 'null' ? ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                  imageUrl:'${EnvironmentConfig.url}/file/image/${widget.img}',
                  height: 220,
                  width: 140,
                  fit: BoxFit.cover,
                  httpHeaders: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    "Authorization": "Bearer ${tokensBox
                        .get('access')}"
                  },
                  placeholder: (context,
                      url) =>
                  const Offstage(),
                  errorWidget: (context, str, url) =>
                  const Offstage()
              ),
            ) : ClipRRect(
                borderRadius:
                BorderRadius.circular(6.0),
                child:
                Image.asset(
                  'assets/images/skeletonBookImage.png',
                  height: 220,
                  width: 140,
                    fit: BoxFit.cover
                )
            ),
          ),
        ),
        widget.textMonth == 'null' ? const Offstage() : Positioned(
          right: 4,
          top: 4,
          child: Container(
            height: 24,
            width: 76,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: ColorStyles.infoSurfaceHoverColor,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.textMonth!,
                style: TextStyles.regularStyle.copyWith(
                  fontSize: 13,
                  color: ColorStyles.neutralsTextPrimaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

