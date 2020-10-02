import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  int _pageState = 0 ;

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB40284A);

  double _headingTop = 100;


  double _loginWidth = 0;
  double _loginOpacity = 1;

  double _loginHeight = 0;
  double _registerHeight = 0;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeight = windowHeight - 260 ;
    _registerHeight = windowHeight - 260;
    switch(_pageState){
      case 0 :
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB40284A);

        _headingTop = 100;
        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = windowHeight;
        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 1 :
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;

        _headingTop = 100;
        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = _keyboardVisible ? 20 : 270;
        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 2 :
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;

        _headingTop = 80;
        _loginWidth = windowWidth - 40 ;
        _loginOpacity = 0.7;

        _registerYOffset = _keyboardVisible ? 20 : 275;
        _loginXOffset = 20;
        break;
    }

    return Stack(
      children: <Widget>[
        AnimatedContainer(

          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 1000
          ),

          color: _backgroundColor ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _pageState = 0 ;
                    });
                  },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      AnimatedContainer(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: Duration(
                          milliseconds: 1000
                        ),
                        margin: EdgeInsets.only(
                          top: _headingTop,
                        ),
                        child: Text(
                            "Lern free",
                          style: TextStyle(
                              color: _headingColor,
                              fontSize: 28
                          ),
                        )
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20
                        ),
                        child: Text(
                            "We make lern to we free style. easy Jitakorn make to lern flutter for free on Youtube.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _headingColor,
                              fontSize: 16
                        )
                        ),
                      )
                    ],

                  )
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 44
                ),
                child: Center(
                  child: Image.asset("assets/images/splash_bg.png"),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      if(_pageState != 0){
                        _pageState = 0 ;
                      }else{
                        _pageState = 1 ;
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(34.5),
                    padding: EdgeInsets.all(20),
                   width: double.infinity,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(50),
                     color: Color(0xFFB40284A)
                   ),
                  child:Center(
                    child: Text(
                        "Get Started",
                        style:TextStyle(
                            color: Colors.white,
                            fontSize: 19
                        )
                    )
                  ),
              ),
                )
              )
            ],
          ),
        ),
        AnimatedContainer(
          padding: EdgeInsets.all(32),
          width: _loginWidth,
          height: _loginHeight,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 900
          ),
          transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(_loginOpacity),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text("Login To Continue",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  InputWithIcon(
                    icon: Icons.email,
                    hint: "Enter Email...",
                  ),
                  SizedBox(height: 10,),
                  InputWithIcon(
                    icon: Icons.vpn_key,
                    hint: "Enter Password...",
                  ),
                  SizedBox(height: 20,),
                ],
              ),
              Column(
                children: <Widget>[
                  PrimaryButton(
                    btnText: "Login",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                    setState(() {
                      _pageState = 2 ;
                        });
                      },
                     child : OutlineBtn(
                    btnText: "Create New Account",
                  )
                  )
                ],
              )
            ],
          ),
        ),
        AnimatedContainer(
          height: _registerHeight ,
          padding: EdgeInsets.all(32),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
              milliseconds: 900
          ),
          transform: Matrix4.translationValues(0, _registerYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text("Create a New Account",
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                  ),
                  InputWithIcon(
                    icon: Icons.email,
                    hint: "Enter Email...",
                  ),
                  SizedBox(height: 10,),
                  InputWithIcon(
                    icon: Icons.vpn_key,
                    hint: "Enter Password...",
                  ),
                  SizedBox(height: 20,),
                ],
              ),
              Column(
                children: <Widget>[
                  PrimaryButton(
                    btnText: "Create Account",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageState = 1 ;
                        });
                      },
                    child: OutlineBtn(
                    btnText: "Back To Login",
                  )
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}