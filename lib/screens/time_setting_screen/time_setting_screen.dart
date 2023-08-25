import 'package:flutter/material.dart';

class TimeSettingScreen extends StatefulWidget {
  const TimeSettingScreen({Key? key}) : super(key: key);

  @override
  _TimeSettingScreenState createState() => _TimeSettingScreenState();
}

class _TimeSettingScreenState extends State<TimeSettingScreen> {
  int _selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFDF3),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              top: 320,
              left: 24,
              child: Container(
                height: 96,
                width: 176,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/recommend.png'),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/time_setting.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '通知の送られてくるタイミングを設定してください',
                    style: TextStyle(
                      color: Color(0xFF4C4C4C),
                      fontSize: 24,
                      fontFamily: 'Zen-R',
                    ),
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            '1時間おきに通知',
                            style: TextStyle(
                              color: Color(0xFF4C4C4C),
                              fontSize: 40,
                              fontFamily: 'Zen-R',
                            ),
                          ),
                          SizedBox(height: 24),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedRadio = 1;
                              });
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                    'assets/images/radio_button1.png'), // Radio_button1.png
                                if (_selectedRadio == 1)
                                  Image.asset(
                                      'assets/images/apple.png'), // 重ねる画像
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 260),
                      Column(
                        children: [
                          Text(
                            '45分おきに通知',
                            style: TextStyle(
                              color: Color(0xFF4C4C4C),
                              fontSize: 40,
                              fontFamily: 'Zen-R',
                            ),
                          ),
                          SizedBox(height: 24),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedRadio = 2;
                              });
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                    'assets/images/radio_button2.png'), // Radio_button2.png
                                if (_selectedRadio == 2)
                                  Image.asset(
                                      'assets/images/apple.png'), // 重ねる画像
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 260),
                      Column(
                        children: [
                          Text(
                            '30分おきに通知',
                            style: TextStyle(
                              color: Color(0xFF4C4C4C),
                              fontSize: 40,
                              fontFamily: 'Zen-R',
                            ),
                          ),
                          SizedBox(height: 24),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedRadio = 3;
                              });
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                    'assets/images/radio_button3.png'), // Radio_button3.png
                                if (_selectedRadio == 3)
                                  Image.asset(
                                      'assets/images/apple.png'), // 重ねる画像
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 120, // 任意の縦位置
              left: 0,
              right: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/get_button.png',
                  ),
                  Text(
                    'この時間に通知する',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0, // 任意の縦位置
              right: 10, // 任意の横位置
              child: Image.asset(
                'assets/images/setting_button.png',
                // width: 600, // 画像の幅
                // height: 350, // 画像の高さ
              ),
            ),
            Positioned(
              bottom: 0, // 任意の縦位置
              right: 160, // 任意の横位置
              child: Image.asset(
                'assets/images/tutorial_button.png',
                // width: 800, // 画像の幅
                // height: 350, // 画像の高さ
              ),
            ),
          ],
        ),
      ),
    );
  }
}
