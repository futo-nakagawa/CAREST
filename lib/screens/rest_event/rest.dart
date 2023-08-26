import 'package:flutter/material.dart';
import 'package:linear_timer/linear_timer.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
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
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.001,
                  ),
                  GestureDetector(
                    onTap: (() {
                      //TODO:コード書く
                    }),
                    child: Container(
                      alignment: Alignment.topLeft,
                      height: MediaQuery.of(context).size.height * 1,
                      // width: 900,
                      child: Image.asset(
                        'assets/images/mdrbutton.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Text(
                    '残り時間が0分になりますと強制的にアプリが終了し、作業にを再開できます',
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  LinearTime(), //LinearTimer
                ],
              ))),
    );
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

        //念のためのボタン！！！！！！！！！！１
        // Center(
        //   child: IconButton(
        //       onPressed: () {
        //         timerController.start();
        //       },
        //       icon: const Icon(Icons.play_arrow)),
        // ),

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
