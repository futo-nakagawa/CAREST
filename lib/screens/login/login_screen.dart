import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isEditing = false; //タップしたらtextfirldを表示する用
  bool _isAlternateImage = false; // 別の画像を表示するかどうか
  String userPass = '';
  int _additionalImagesCount = 0; // 左右に増やす画像の数
  FocusNode _textFieldFocusNode = FocusNode();
  //TextEditingController _textEditingController = TextEditingController();

  void dispose() {
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFDF3),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 88, right: 88, bottom: 120),
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
              // 左側の増やす画像
              Positioned(
                bottom: 50,
                left: 200,
                child: Container(
                  width: 320 * _additionalImagesCount.toDouble(),
                  height: 96,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login_button.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // 右側の増やす画像
              Positioned(
                bottom: 50,
                right: 200,
                child: Container(
                  width: 320 * _additionalImagesCount.toDouble(),
                  height: 96,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login_button.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 50, // 画面下部に配置
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isEditing = true;
                      _isAlternateImage = !_isAlternateImage; // 画像を切り替える
                      _additionalImagesCount++;
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
                    child: Stack(
                        // Stack を使用してテキストを重ねる
                        alignment: Alignment.center, // テキストを中央に配置
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Text(
                              _isAlternateImage ? '' : 'ログイン', // 表示するテキスト
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontFamily: 'Zen-B'),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: 350,
              height: 230,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/apple_button.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if (_isEditing)
            Positioned(
              bottom: 80,
              child: Container(
                width: 400,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xFF90C659), width: 2),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16), // 左側の余白を指定
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            userPass = value;
                          });
                        }
                      },
                      style: TextStyle(
                        color: Color(0xFF511C0B),
                        fontSize: 15,
                        fontFamily: 'Zen-B',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        height: 1.25,
                        letterSpacing: -0.5,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'パスワードを入力してください',
                      ),
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
