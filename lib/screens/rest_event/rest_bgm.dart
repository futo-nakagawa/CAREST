import 'package:flutter/material.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:audioplayers/audioplayers.dart';

class Rest_BGM extends StatefulWidget {
  const Rest_BGM({Key? key}) : super(key: key);

  @override
  State<Rest_BGM> createState() => _Rest_BGMState();
}

class _Rest_BGMState extends State<Rest_BGM> {
  final audioPlayer = AudioPlayer();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/rest_background.png'),
                  fit: BoxFit.fill,
                )),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.001,
                    ),
                    GestureDetector(
                      onTap: (() {
                        //TODO:コード書く
                      }),
                      child: Container(
                        alignment: const Alignment(
                          -1.7,
                          5,
                        ),
                        child: Image.asset(
                          'assets/images/mdrbutton.png',
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width *
                          0.5, // ボタンの親コンテナの幅を調整
                      child: ElevatedButton(
                        onPressed: () {
                          audioPlayer.play(AssetSource("assets/bgm/rest.wav"));
                          print('押しました');
                          //TODO : 確認
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey, // ボタンの背景色
                          fixedSize: Size(50, 50), // ボタンの最小幅を設定
                        ),
                        child: const Text("指先の魔法"),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1, //間隔
                    ),
                    const Text(
                      '残り時間が0分になりますと強制的にアプリが終了し、作業を再開できます',
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03, //間隔
                    ),
                    LinearTime(),
                  ],
                ))));
  }
}

class LinearTime extends StatefulWidget {
  const LinearTime({super.key});

  @override
  State<LinearTime> createState() => _LinearTimeState();
}

class _LinearTimeState extends State<LinearTime> with TickerProviderStateMixin {
  late LinearTimerController timerController = LinearTimerController(this);

  @override
  void dispose() {
    timerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          width: MediaQuery.of(context).size.width * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: LinearTimer(
              duration: Duration(seconds: 10), //カウントダウンのタイムをセット
              backgroundColor: Colors.grey,
              color: Color.fromRGBO(115, 186, 117, 1),
              controller: timerController,
              forward: false, //false = カウントダウン
            ),
          ),
        ),

        //念のためのボタン！！！！！！！！！！
        Center(
          child: IconButton(
              onPressed: () {
                timerController.start();
              },
              icon: const Icon(Icons.play_arrow)),
        ),

        // Center(child: Text('残り${se}}),)
        Center(
          child: Text(
            '残り　分',
            style: TextStyle(fontSize: 30),
          ),
        )
      ],
    );
  }
}
