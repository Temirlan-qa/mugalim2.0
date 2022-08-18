import 'package:flutter/material.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/presentation/home/widgets/SizedBox.dart';

class VoteWidget extends StatefulWidget {
  final String votetitle;
  final String voteAnswer1;
  final String voteAnswer2;
  final int voteProcent1;
  final int voteProcent2;
  final int votePPL1;
  final int votePPL2;

  const VoteWidget({
    Key? key,
    required this.votetitle,
    required this.voteProcent1,
    required this.voteProcent2,
    required this.voteAnswer1,
    required this.voteAnswer2,
    required this.votePPL1,
    required this.votePPL2,
  }) : super(key: key);

  @override
  State<VoteWidget> createState() => _VoteWidgetState();
}

class _VoteWidgetState extends State<VoteWidget> {
  bool clickToShow = false;
  String gonna = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 210,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(
          color: const Color(0xFFE0E0E0),
        ),
      ),
      child: Column(
        children: [
          Text(
            maxLines: 2,
            widget.votetitle,
            textAlign: TextAlign.center,
            style: TextStyles.mediumStyle.copyWith(
              color: Color(0xFF1A1A1A),
              fontSize: 20,
              height: 1.2,
            ),
          ),
          sizedBoxHeight16(),
          inkWell(widget.voteAnswer1, widget.voteProcent1, widget.votePPL1),
          sizedBoxHeight8(),
          inkWell(widget.voteAnswer2, widget.voteProcent2, widget.votePPL2),
          sizedBoxHeight16(),
          Center(
            child: Text(
              'Проголосуйте первым!',
              style: TextStyles.voteStyle.copyWith(
                color: const Color(0xFF767676),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell inkWell(String text, int procent, int votePPL1) {
    return InkWell(
      onTap: () {
        setState(() {
          clickToShow = !clickToShow;
          gonna = text;
        });
        print('You tap $text');
      },
      child: Container(
        width: (MediaQuery.of(context).size.width - 32),
        //height: 32,
        decoration: const BoxDecoration(
          color: Color(0xFFF9F9F9),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              decoration: BoxDecoration(
                color: clickToShow ? const Color(0xFFD5D7F6) : null,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
              ),
              width: (MediaQuery.of(context).size.width - 32) * procent / 100,
              //height: 32,
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 8,
                left: 12,
                right: 12,
              ),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 170,
                      child: Text(
                        text,
                        maxLines: 2,
                        style: TextStyles.voteStyle.copyWith(
                          color: const Color(0xFF3D3DD8),
                        ),
                      ),
                    ),
                  ),
                  clickToShow
                      ? Row(
                          children: [
                            sizedBoxWidth4(),
                            Text(
                              '·',
                              style: TextStyles.voteStyle.copyWith(
                                color: const Color(0xFF767676),
                              ),
                            ),
                            sizedBoxWidth4(),
                            Text(
                              '$votePPL1',
                              style: TextStyles.voteStyle.copyWith(
                                color: const Color(0xFF767676),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  const Spacer(),
                  clickToShow
                      ? Row(
                          children: [
                            gonna == text
                                ? const Icon(
                                    Icons.done,
                                    size: 12,
                                    color: Color(0xFF3D3DD8),
                                  )
                                : const Offstage(),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              '$procent%',
                              style: TextStyles.voteStyle.copyWith(
                                color: const Color(0xFF3D3DD8),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
