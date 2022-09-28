// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/const/text_style_const.dart';
import '../../../../core/routes/routes_const.dart';

class TimerDetail extends StatefulWidget {
  final String startingDate;
  final String status;
  const TimerDetail({Key? key, required this.startingDate, required this.status}) : super(key: key);

  @override
  State<TimerDetail> createState() => _TimerDetailState();
}

class _TimerDetailState extends State<TimerDetail> {

  late Duration duration;
  Timer? timer;


  Duration getDuration() {
    final dateTimeResumed = DateTime.now().millisecondsSinceEpoch;
    final startingDateTime = DateTime.parse(widget.startingDate).millisecondsSinceEpoch;
    var difference = startingDateTime - dateTimeResumed;
    if(difference < 0) {
      if(widget.status == 'CONFLICT') {
        difference = 0;
      } else if(widget.status == 'COMPLETED'){
        Navigator.of(context,
            rootNavigator: true)
            .popAndPushNamed(MainBookRoute);

            }
    }

    final hours = difference ~/ (60 * 60 * 1000);
    difference = difference - hours.toInt() * (60 * 60 * 1000);
    final minutes = difference ~/ (60 * 1000);
    difference = difference - minutes.toInt() * (60*1000);
    final seconds = difference ~/ 1000;

    // buildTime(Duration(hours: hours, minutes: minutes, seconds: seconds));
    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }


  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }
  @override
  void initState() {
    super.initState();
    duration = getDuration();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  void addTime() {
    const addSeconds = -1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if(seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  bool isEndTime = false;
  Text textDeadline = const Text('');
  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    if(duration.inSeconds <= 0) isEndTime = true;
    textDeadline = isEndTime? Text('Ваш ментор ещё не выбрал книгу',
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyles.boldStyle.copyWith(
          fontSize: 23,
          color: const Color(0xFF4A4A4A),
        )
      // textAlign: TextAlign.center,
    ) : Text('Голосование не закончено\nДо завершения:',
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyles.boldStyle.copyWith(
          fontSize: 23,
          color: const Color(0xFF4A4A4A),
        )
      // textAlign: TextAlign.center,
    );
    return isEndTime? const Offstage()
        : Text(
        '$hours : $minutes : $seconds',
        style: TextStyles.boldStyle.copyWith(
          fontSize: 32,
          color: const Color(0xFF4A4A4A),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(vertical: 16, horizontal: 1.5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:16, right: 1.5, left: 1.5),
            child: textDeadline,
          ),
          buildTime(),
        ],
      ),
    );
  }
}
