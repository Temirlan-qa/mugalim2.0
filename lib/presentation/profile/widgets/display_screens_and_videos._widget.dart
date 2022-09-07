import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/const_color.dart';

class DisplayScreensAndPhotosWidget extends StatelessWidget {
  final String imageFileListPath;
  const DisplayScreensAndPhotosWidget(
      {Key? key, required this.imageFileListPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image.file(
                File(imageFileListPath),
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: ColorStyles.primaryBorderColor.withOpacity(0.5),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              padding: const EdgeInsets.only(top: 4, right: 4),
              margin: const EdgeInsets.only(right: 8),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/x.svg',
                    color: Colors.white,
                    height: 16,
                    width: 16,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
