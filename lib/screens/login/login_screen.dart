import 'package:flutter/material.dart';
import 'package:carest_app/screens/tutorial_screen/tutorial_screen.dart';

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
              Positioned(
                bottom: 50, // 画面下部に配置
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isEditing = true;
                      _isAlternateImage = !_isAlternateImage; // 画像を切り替える
                    });
                  },
                  child: Container(
                    width: _isAlternateImage ? 500 : 320,
                    height: _isAlternateImage ? 100 : 96,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_isAlternateImage
                            ? 'assets/images/pushed_button.png'
                            : 'assets/images/login_button.png'),
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: 380,
              height: 230,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/apple_button.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter, // テキストを左下に配置
                child: Padding(
                  padding: const EdgeInsets.all(24.0), // 適切な余白を設定
                  child: Text(
                    '新規アカウント登録',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Zen-B',
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_isEditing)
            Positioned(
              bottom: 80,
              child: Container(
                width: 250,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xFF90C659), width: 2),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 12), // 左側の余白を指定
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
                      onSubmitted: (value) {
                        // エンターキーが押されたときに実行される処理
                        // ここで次のページに遷移するなどの操作を行うことができます
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TutorialScreen()), // 次のページに遷移
                        );
                      },
                      style: TextStyle(
                        color: Color(0xFF511C0B),
                        fontSize: 16,
                        fontFamily: 'Zen-B',
                        //fontStyle: FontStyle.normal,
                        //fontWeight: FontWeight.w500,
                        //height: 1.25,
                        //letterSpacing: -0.5,
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
