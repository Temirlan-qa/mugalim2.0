import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/presentation/profile/widgets/btn_widget.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({Key? key}) : super(key: key);

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  bool dropdownValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Оставить отзыв',
          style: TextStyles.boldStyle.copyWith(
            fontSize: 23,
            color: ColorStyles.neutralsTextPrimaryColor,
          ),
        ),
        centerTitle: true,
        leading: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: ColorStyles.primaryBorderColor,
            size: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  //color: const Color(0xFF767676),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Поделитесь обратной связью и мы отработаем ваш запрос!',
                      textAlign: TextAlign.start,
                      style: TextStyles.regularStyle.copyWith(
                        fontSize: 14,
                        color: ColorStyles.neutralsTextPrimaryColor,
                      ),
                    ),
                    sizedBoxHeight16(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Тема',
                        style: TextStyles.mediumStyle.copyWith(
                          fontSize: 16,
                          color: ColorStyles.neutralsTextPrimaryColor,
                        ),
                      ),
                    ),
                    sizedBoxHeight8(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          dropdownValue = !dropdownValue;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 32,
                        height: 48,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: ColorStyles.primarySurfaceHoverColor,
                          ),
                          //color: const Color(0xFF767676),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Предложение',
                              style: TextStyles.mediumStyle.copyWith(
                                color: ColorStyles.neutralsTextPrimaryColor,
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              dropdownValue
                                  ? CupertinoIcons.chevron_up
                                  : CupertinoIcons.chevron_down,
                              color: ColorStyles.primarySurfaceHoverColor,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    sizedBoxHeight16(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Комментарий',
                        textAlign: TextAlign.start,
                        style: TextStyles.mediumStyle.copyWith(
                          fontSize: 16,
                          color: ColorStyles.neutralsTextPrimaryColor,
                        ),
                      ),
                    ),
                    sizedBoxHeight8(),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width - 32,
                    //   height: 150,
                    //   child: TextField(
                    //     minLines: 1,
                    //     maxLines: 50,
                    //     decoration: InputDecoration(
                    //       hintText: 'Не работает кнопка...',
                    //       hintStyle: TextStyles.mediumStyle.copyWith(
                    //         color: ColorStyles.primarySurfaceHoverColor,
                    //         fontSize: 16,
                    //       ),
                    //     ),
                    //     style: TextStyles.mediumStyle.copyWith(
                    //       fontSize: 16,
                    //       height: 1.5,
                    //       color: ColorStyles.neutralsTextPrimaryColor,
                    //     ),
                    //   ),
                    // ),
                    Container(
                      width: MediaQuery.of(context).size.width - 32,
                      height: 163,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: ColorStyles.primarySurfaceHoverColor,
                        ),
                        //color: const Color(0xFF767676),
                      ),
                      child: Text(
                        'Не работает кнопка...',
                        style: TextStyles.mediumStyle.copyWith(
                          color: ColorStyles.primarySurfaceHoverColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    sizedBoxHeight16(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Медиафайлы',
                        textAlign: TextAlign.start,
                        style: TextStyles.mediumStyle.copyWith(
                          fontSize: 16,
                          color: ColorStyles.neutralsTextPrimaryColor,
                        ),
                      ),
                    ),
                    sizedBoxHeight8(),
                    GestureDetector(
                      onTap: () {
                      },
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        color: ColorStyles.primarySurfaceHoverColor,
                        strokeWidth: 1.5,
                        dashPattern: const [
                          5,
                          5,
                        ],
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: MediaQuery.of(context).size.width - 32,
                          height: 45,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/paperclip.svg'),
                              sizedBoxWidth8(),
                              Text(
                                'Добавь скриншот или видео',
                                style: TextStyles.mediumStyle.copyWith(
                                  color: ColorStyles.primaryBorderColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    sizedBoxHeight8(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Максисмум 5 фото или 1 видео',
                        textAlign: TextAlign.start,
                        style: TextStyles.mediumStyle.copyWith(
                          fontSize: 13,
                          color: ColorStyles.neutralsTextPrimaryColor,
                        ),
                      ),
                    ),
                    sizedBoxHeight16(),
                    BtnWidget(
                      color: const Color(0xFFE0E0E0),
                      textColor: ColorStyles.neutralsTextPrimaryColor,
                      text: 'Отправить',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
              //const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
