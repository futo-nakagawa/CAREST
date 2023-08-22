import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isEditing = false;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFDF3),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 88,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 104, // 画面下部に配置
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isEditing = true;
                    });
                  },
                  child: Container(
                    width: 320,
                    height: 96,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/login_button.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      // Stack を使用してテキストを重ねる
                      alignment: Alignment.center, // テキストを中央に配置
                      child: Positioned(
                        //bottom: 0,
                        child: Text(
                          'Text Over Button', // 表示するテキスト
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_isEditing)
            Positioned(
              bottom: 0,
              child: Container(
                height: 96,
                width: 300,
                color: Colors.white.withOpacity(0.7),
                child: Center(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Enter text...',
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
