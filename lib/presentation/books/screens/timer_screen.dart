import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/const/const_color.dart';
import '../../../core/const/text_style_const.dart';
import '../../../core/routes/routes_const.dart';
import '../../development/screens/development_screen.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> with WidgetsBindingObserver{
  final String startingTime = '2022-09-30 21:00:00';
  late Duration duration;
  Timer? timer;


  Duration getDuration() {
    final dateTimeResumed = DateTime.now().millisecondsSinceEpoch;
    final startingDateTime = DateTime.parse(startingTime).millisecondsSinceEpoch;
    print('$dateTimeResumed date Time Resumed');
    print('$startingDateTime starting Date time');
    var difference = startingDateTime - dateTimeResumed;
    print(difference);

    final hours = difference ~/ (60 * 60 * 1000);
    difference = difference - hours.toInt() * (60 * 60 * 1000);
    final minutes = difference ~/ (60 * 1000);
    difference = difference - minutes.toInt() * (60*1000);
    final seconds = difference ~/ 1000;
    print('$hours : $minutes : $seconds');

    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }


  void startTimer(Duration duration) {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch(state) {
      case AppLifecycleState.resumed:
        setState(() {
          duration = getDuration();
          startTimer(duration);
        });
        break;
      case AppLifecycleState.inactive:
        timer?.cancel();
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
  @override
  void initState() {
    super.initState();
    duration = getDuration();
    WidgetsBinding.instance.addObserver(this);
    startTimer(duration);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
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

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Text(
      '$hours : $minutes : $seconds',
        style: TextStyles.boldStyle.copyWith(
          fontSize: 32,
          color: const Color(0xFF4A4A4A),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      restorationId: "root",
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Книги',
          style: TextStyle(
            fontSize: 23,
            fontFamily: 'CeraPro',
            fontWeight: FontWeight.w700,
            color: ColorStyles.neutralsTextPrimaryColor
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: (){
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) =>
              //       const DevelopmentScreen()),
              // );
              Navigator.of(context).pushNamed(DevelopmentRoute);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 12,bottom: 12,right: 14),
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  //color: Colors.black
                  color: const Color(0xFFF9F9F9),
                ),
                child: Icon(
                  CupertinoIcons.clear,
                  color: ColorStyles.primaryBorderColor,
                ),
              ),
            ),
          ),
          // IconButton(
          //   icon: SvgPicture.asset('assets/icons/cancel.svg'),
          //   color: ColorStyles.primaryBorderColor,
          //   onPressed: () {
          //     // Navigator.pushReplacementNamed(context, CourseRoute);
          //     Navigator.pop(widget.devScreenContext);
          //   },
          // ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 1.5),
              child: Text(
                'Голосование не закончено        До завершения:',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyles.boldStyle.copyWith(
                  fontSize: 23,
                  color: const Color(0xFF4A4A4A),
                )
                // textAlign: TextAlign.center,
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 1.5),
              child: buildTime(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 47, horizontal: 55),
              child: Image.asset(
                'assets/images/message.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 70,
                        child: Stack(
                          children: [
                            ClipOval(
                              child: CircleAvatar(
                                  radius: 12,
                                  child: Image
                                      .asset(
                                    'assets/images/avataricon1.png',
                                    // color: Colors.red,
                                  )),
                            ),
                            Positioned(
                              left: 18,
                              child: ClipOval(
                                child: CircleAvatar(
                                    radius: 12,
                                    child: Image
                                        .asset(
                                        'assets/images/avataricon2.png')),
                              ),
                            ),
                            Positioned(
                              left: 36,
                              child: ClipOval(
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xff3D3DD8),
                                  radius: 12,
                                  child: Text(
                                    '+21',
                                    style: TextStyles.regularStyle
                                        .copyWith(
                                      fontSize: 13,
                                      color:
                                      Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Голосуют 23 студента',
                        style: TextStyles.regularStyle
                            .copyWith(
                          fontSize: 13,
                          color:
                          const Color(0xFF767676),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  ('Посмотреть мой выбор'),
                  style: TextStyles.mediumStyle.copyWith(
                    color: ColorStyles.primaryBorderColor,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    fontFamily: 'CeraPro',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                primary: Color(0xFFE0E0E0),
                backgroundColor: Color(0xff3D3DD8),
                elevation: 3,
                minimumSize: Size(343, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>
                  //       const DevelopmentScreen()),
                  // );
                  Navigator.of(context).pushNamed(DevelopmentRoute);
                },
                  child: Text(
                    "На главную",
                    style: TextStyles.mediumStyle.copyWith(
                      fontSize: 16,
                      color: Colors.white
                    )
                  )),
            ),

          ],
        )
      ),
    );
  }
}
