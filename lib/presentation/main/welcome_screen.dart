import 'package:flutter/material.dart';
import 'package:mugalim/presentation/main/photo_slider_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 55,
          bottom: 69,

        ),
        color: Colors.white,
        child: SafeArea(
          child: Center(
            child: Column(
              children: [

                Image.asset(
                    'assets/images/MugalimLogo.png',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                  ),
                  child: Column(
                    children: [
                      Text(
                          'Mugalim мобильді',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                          fontFamily: 'CeraPro',
                        ),
                      ),
                      Text(
                        'қосымшасына қош келдіңіз!',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                          fontFamily: 'CeraPro',
                        ),
                      ),
                    ],
                  ),
                ),

                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PhotoSliderScreen()),
                    );
                  },
                  child: Text(
                    'Әрі қарай >',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'CeraPro',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(343, 48),
                    primary: Color(0xFF3D3DD8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
