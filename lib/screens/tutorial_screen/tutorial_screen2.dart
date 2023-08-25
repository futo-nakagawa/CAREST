import 'package:flutter/material.dart';
import 'tutorial_screen.dart'; // 前のページのウィジェットが定義されているファイルをインポート
import 'tutorial_screen3.dart';

class TutorialScreen2 extends StatefulWidget {
  const TutorialScreen2({Key? key}) : super(key: key);

  @override
  _TutorialScreen2State createState() => _TutorialScreen2State();
}

class _TutorialScreen2State extends State<TutorialScreen2> {
  int currentIndex = 0;
  List<String> imagePaths = [
    'assets/images/tutorial2.png',
    'assets/images/tutorial3.png',
    'assets/images/tutorial4.png',
    'assets/images/tutorial5.png',
    'assets/images/tutorial6.png',
    'assets/images/tutorial7.png',
    'assets/images/tutorial8.png',
  ];

  void nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % imagePaths.length;
      if (currentIndex == 6) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TutorialScreen3()), // 別のページに遷移
        );
      }
    });
  }

  void previousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + imagePaths.length) % imagePaths.length;
    });
  }

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
                  image: AssetImage(imagePaths[currentIndex]),
                  fit: BoxFit.cover,
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
            Positioned(
              bottom: 0, // 下端に配置
              right: 0, // 右側に配置
              child: GestureDetector(
                onTap: () {
                  // 次へボタンがタップされたときの処理
                  nextImage();
                  if (currentIndex == 7) ;
                },
                child: Container(
                  height: 151,
                  width: 166,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Next.png'),
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
