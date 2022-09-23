import 'dart:async';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/injection_container.dart';
import 'package:mugalim/core/widgets/glass_effect_with_success.dart';
import 'package:mugalim/logic/profile/data/datasources/profile_datasource.dart';
import 'package:mugalim/presentation/profile/widgets/btn_widget.dart';
import 'package:mugalim/presentation/profile/widgets/display_screens_and_videos._widget.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({Key? key}) : super(key: key);

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  var items = [
    'Предложение',
    'Посты',
    'Книги',
    'Курсы',
    'Статистика',
    'M passport',
  ];
  late String chosen;
  TextEditingController commentController = TextEditingController();
  bool buttonDown = false;
  String dropDownValue = 'Предложение';
  bool onChanged = false;
  bool addImg = false;

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  String videoPath = '';
  List<String> imagesVideoFileList = [];
  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    final XFile? video =
        await imagePicker.pickVideo(source: ImageSource.gallery);

    setState(() {
      imageFileList = selectedImages;
      videoPath = video!.path;
      imagesVideoFileList.add(videoPath);
    });

    for (int i = 0; i < imageFileList!.length; i++) {
      setState(() {
        imagesVideoFileList.add(imageFileList![i].path);
      });
    }
  }

  bool isSendLoading = false;
  bool successChange = false;
  int start = 0;
  bool wait = true;
  late Timer timer;
  void startTimer() {
    start = 3;
    if (wait == true) wait = false;
    const onsec = Duration(seconds: 1);
    timer = Timer.periodic(onsec, (timer) {
      if (start <= 0) {
        setState(() {
          wait = true;
          timer.cancel();
          Navigator.pop(context);
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
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
                    Container(
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
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: dropDownValue,
                          icon: Icon(
                            CupertinoIcons.chevron_down,
                            color: ColorStyles.primarySurfaceHoverColor,
                            size: 24,
                          ),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              buttonDown = !buttonDown;
                              dropDownValue = newValue!;
                            });
                          },
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
                    SizedBox(
                      height: 150,
                      child: TextField(
                        onChanged: (text) {
                          if (commentController.text.isNotEmpty) {
                            setState(() {
                              onChanged = true;
                            });
                          } else {
                            setState(() {
                              onChanged = false;
                            });
                          }
                        },
                        maxLines: 50,
                        controller: commentController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          hintText: 'Не работает кнопка...',
                          hintStyle: TextStyles.mediumStyle.copyWith(
                            color: ColorStyles.primarySurfaceHoverColor,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: ColorStyles.primarySurfaceHoverColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: ColorStyles.primarySurfaceHoverColor,
                            ),
                          ),
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
                    Visibility(
                      visible: imageFileList!.isNotEmpty,
                      child: SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: DisplayScreensAndPhotosWidget(
                          imageFileList: imageFileList!.take(5).toList(),
                          videoPath: videoPath,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: imageFileList!.isEmpty || imageFileList == [],
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            addImg = true;
                          });
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
                                SvgPicture.asset(
                                  'assets/icons/paperclip.svg',
                                ),
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
                    ),
                    Visibility(
                      visible: imageFileList!.isEmpty || imageFileList == [],
                      child: Column(
                        children: [
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
                        ],
                      ),
                    ),
                    sizedBoxHeight16(),
                    CupertinoButton(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      pressedOpacity: 0.8,
                      color: onChanged
                          ? ColorStyles.primaryBorderColor
                          : const Color(0xFFE0E0E0),
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        if (dropDownValue == 'Предложение') {
                          setState(() {
                            chosen = 'OFFER';
                          });
                        } else if (dropDownValue == 'Посты') {
                          setState(() {
                            chosen = 'POSTS';
                          });
                        } else if (dropDownValue == 'Книги') {
                          setState(() {
                            chosen = 'BOOKS';
                          });
                        } else if (dropDownValue == 'Курсы') {
                          setState(() {
                            chosen = 'COURSES';
                          });
                        } else if (dropDownValue == 'Статистика') {
                          setState(() {
                            chosen = 'STATISTICS';
                          });
                        } else if (dropDownValue == 'M passport') {
                          setState(() {
                            chosen = 'MPASSPORT';
                          });
                        }
                        if (onChanged) {
                          setState(() {
                            isSendLoading = true;
                          });
                          if(isSendLoading){
                            ProfileDatasource profileDatasource = sl();
                            List<String> responseVideoAndImages =
                            await profileDatasource
                                .uploadVideoAndImages(imagesVideoFileList);
                            Response response1 =
                            await profileDatasource.uploadReview(
                                chosen,
                                commentController.text,
                                responseVideoAndImages);
                            if (kDebugMode) {
                              print(response1);
                            }
                            isSendLoading = false;
                            setState(() {
                              startTimer();
                              successChange = !successChange;
                            });
                          }
                        }
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 16,
                        child: Center(
                          child: isSendLoading
                              ? const CupertinoActivityIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Отправить',
                                  style: TextStyles.mediumStyle.copyWith(
                                    fontSize: 16,
                                    color: onChanged
                                        ? Colors.white
                                        : ColorStyles.neutralsTextPrimaryColor,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible:
              addImg && imageFileList!.isEmpty || addImg && imageFileList == [],
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.black.withOpacity(0.2),
              child: Column(
                children: [
                  const Spacer(),
                  CupertinoButton(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    pressedOpacity: 0.8,
                    color: Colors.white,
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      selectImages();
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/upload.svg',
                            width: 16,
                          ),
                          sizedBoxWidth4(),
                          Text(
                            'Выбрать из галерии',
                            style: TextStyles.mediumStyle.copyWith(
                              color: ColorStyles.primaryBorderColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  sizedBoxHeight8(),
                  BtnWidget(
                    onPressed: () {
                      setState(() {
                        addImg = false;
                      });
                      // Navigator.of(context).pop();
                    },
                    text: 'Отмена',
                    fontSize: 16,
                    textColor: ColorStyles.primaryBorderColor,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
        GlassEffectWithSuccess(
            successChange: successChange, editedThing: 'отзыв'),
      ],
    );
  }
}
