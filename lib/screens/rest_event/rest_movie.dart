import 'package:flutter/material.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:video_player/video_player.dart';

class RestMovie extends StatefulWidget {
  const RestMovie({super.key});

  @override
  State<RestMovie> createState() => _RestMovieState();
}

class _RestMovieState extends State<RestMovie> {
  late VideoPlayerController _controller;
  bool _showStopButton = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/movie/HackU.mp4');
    _controller.initialize().then((_) {
      // 最初のフレームを描画するため初期化後に更新
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
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
          Positioned(
              top: 100,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/vdt.png',
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Container(
                        height: 400,
                        width: 700,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(34, 34, 34, 34),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                }
                              },
                              child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              ),
                            ),
                            if (!_showStopButton)
                              IconButton(
                                icon: Icon(Icons.play_arrow),
                                iconSize: 48,
                                onPressed: () {
                                  setState(() {
                                    _controller.play();
                                    _showStopButton = true;
                                  });
                                },
                              ),
                            if (_showStopButton)
                              IconButton(
                                icon: Icon(Icons.stop),
                                iconSize: 48,
                                onPressed: () {
                                  setState(() {
                                    _controller.pause();
                                    _showStopButton = false;
                                  });
                                },
                              ),
                          ],
                        ),
                      ),
                    ],
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
              ))
        ],
      ),
    )));
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
