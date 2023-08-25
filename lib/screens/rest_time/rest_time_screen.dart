import 'package:flutter/material.dart';

class ResttimeScreen extends StatefulWidget {
  const ResttimeScreen({Key? key}) : super(key: key);

  @override
  _ResttimeScreenState createState() => _ResttimeScreenState();
}

class _ResttimeScreenState extends State<ResttimeScreen> {
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //------30分休む選択エリア-------//
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // 中央に配置
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
                                Image.asset(
                                  'assets/images/radio_button1.png',
                                ), // Radio_button1.png
                                if (_selectedRadio == 1)
                                  Image.asset(
                                    'assets/images/apple.png',
                                  ), // 重ねる画像
                              ],
                            ),
                          ),
                          SizedBox(width: 120), // 間隔を設定
                          Text(
                            '３０分休む',
                            style: TextStyle(
                              color: Color(0xFF4C4C4C),
                              fontSize: 48,
                              fontFamily: 'Zen-M',
                            ),
                          ),
                        ],
                      ),
                      //------30分休む選択エリア-------//
                      SizedBox(height: 40),
                      //------15分休む選択エリア-------//
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                  'assets/images/radio_button2.png',
                                ), // Radio_button2.png
                                if (_selectedRadio == 2)
                                  Image.asset(
                                    'assets/images/apple.png',
                                  ), // 重ねる画像
                              ],
                            ),
                          ),
                          SizedBox(width: 120), // 間隔を設定
                          Text(
                            '１５分休む',
                            style: TextStyle(
                              color: Color(0xFF4C4C4C),
                              fontSize: 48,
                              fontFamily: 'Zen-M',
                            ),
                          ),
                        ],
                      ),
                      //------15分休む選択エリア-------//
                      SizedBox(height: 40),
                      //------休まない選択エリア-------//
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                  'assets/images/radio_button3.png',
                                ), // Radio_button3.png
                                if (_selectedRadio == 3)
                                  Image.asset(
                                    'assets/images/apple.png',
                                  ), // 重ねる画像
                              ],
                            ),
                          ),
                          SizedBox(width: 166), // 間隔を設定
                          Text(
                            '休まない',
                            style: TextStyle(
                              color: Color(0xFF4C4C4C),
                              fontSize: 48,
                              fontFamily: 'Zen-M',
                            ),
                          ),
                        ],
                      ),
                      //------休まない選択エリア-------//
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
