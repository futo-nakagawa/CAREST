import 'package:carest_app/screens/time_setting_screen/time_setting_screen.dart';
import 'package:flutter/material.dart';

class TutorialScreen3 extends StatefulWidget {
  const TutorialScreen3({Key? key}) : super(key: key);

  @override
  _TutorialScreen3State createState() => _TutorialScreen3State();
}

class _TutorialScreen3State extends State<TutorialScreen3> {
  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/tutorial9.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 190, // 画面の下から190px
              left: (deviceW - 553) / 2, // 画面の中央に配置
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TimeSettingScreen()), // 次のページに遷移
                  );
                },
                child: Container(
                  width: 553,
                  height: 105,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/end.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0, // 下端に配置
              left: 0, // 左側に配置
              child: GestureDetector(
                onTap: () {
                  // 戻るボタンがタップされたときの処理
                  Navigator.pop(context); // 前のページに戻る
                },
                child: Container(
                  height: 151,
                  width: 166,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Back.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
