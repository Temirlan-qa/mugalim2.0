import 'package:flutter/material.dart';

class PhotoSliderScreen extends StatelessWidget {
  const PhotoSliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  child: Text(
                    'Өткізу',
                    style: TextStyle(
                      color: Color(0xFF3D3DD8),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'CeraPro',
                      fontSize: 13,
                    ),
                  ),
                  onPressed: (){},
                ),
              ),
              SizedBox(height: 90,),
              Image.asset(
                'assets/images/page1.png',
                fit: BoxFit.cover,
              ),
              SizedBox(height: 85,),
              Text(
                  'Онлайн курстар',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'CeraPro',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16,),
              Text(
                'Болашақ мұғалімге арналған арнайы',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'CeraPro',
                    fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'онлайн курстар',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'CeraPro',
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
