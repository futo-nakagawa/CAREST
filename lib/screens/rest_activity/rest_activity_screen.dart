import 'package:flutter/material.dart';

class RestactivityScreen extends StatefulWidget {
  const RestactivityScreen({Key? key}) : super(key: key);

  @override
  _RestactivityScreenState createState() => _RestactivityScreenState();
}

class _RestactivityScreenState extends State<RestactivityScreen> {
  int _selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFDF3),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/rest_time_screen.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'お疲れ様でした。\n下の選択肢から休憩時間をお選びください',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF4C4C4C),
                      fontSize: 32,
                      fontFamily: 'Zen-R',
                    ),
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //------ストレッチ動画選択エリア-------//
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedRadio = 1;
                              });
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/images/radio_button1.png',
                                  ), // Radio_button1.png
                                ),
                                if (_selectedRadio == 1)
                                  Image.asset(
                                    'assets/images/apple.png',
                                  ), // 重ねる画像
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedRadio = 2;
                              });
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/images/radio_button2.png',
                                  ), // Radio_button2.png
                                ),
                                if (_selectedRadio == 2)
                                  Image.asset(
                                    'assets/images/apple.png',
                                  ), // 重ねる画像
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedRadio = 3;
                              });
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/images/radio_button3.png',
                                  ), // Radio_button3.png
                                ),
                                if (_selectedRadio == 3)
                                  Image.asset(
                                    'assets/images/apple.png',
                                  ), // 重ねる画像
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 120), // 間隔を設定
                      Column(
                        children: [
                          Text(
                            'ストレッチ動画',
                            style: TextStyle(
                              color: Color(0xFF4C4C4C),
                              fontSize: 48,
                              fontFamily: 'Zen-M',
                            ),
                          ),

                          SizedBox(height: 90),

                          SizedBox(width: 120), // 間隔を設定
                          Text(
                            'リラックスBGM',
                            style: TextStyle(
                              color: Color(0xFF4C4C4C),
                              fontSize: 48,
                              fontFamily: 'Zen-M',
                            ),
                          ),
                          SizedBox(height: 90),

                          SizedBox(width: 120), // 間隔を設定
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '選択しない',
                                style: TextStyle(
                                  color: Color(0xFF4C4C4C),
                                  fontSize: 48,
                                  fontFamily: 'Zen-M',
                                ),
                              ),
                              SizedBox(width: 8), // 小さい文字との間隔を調整
                              Text(
                                '(ご自身のリラックス方法)',
                                style: TextStyle(
                                  color: Color(0xFF4C4C4C),
                                  fontSize: 20,
                                  fontFamily: 'Zen-M',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 44, // 任意の縦位置
              left: 0,
              right: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/time_confirm.png',
                  ),
                  Text(
                    '確定',
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
              top: 0, // 任意の縦位置
              left: 0, // 任意の横位置
              child: Image.asset(
                'assets/images/back_work.png', //作業に戻るボタン
              ),
            ),
          ],
        ),
      ),
    );
  }
}
