import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horseproject/src/pages/auth/signup.dart';
import 'package:horseproject/src/utlis/constants.dart';

import '../../widgets/background_widget.dart';
import '../../widgets/button_round.dart';
import '../../widgets/or_login_with.dart';
import 'login.dart';
class IntroMobileApp extends StatefulWidget {
  const IntroMobileApp({Key? key}) : super(key: key);

  @override
  _IntroMobileAppState createState() => _IntroMobileAppState();
}

class _IntroMobileAppState extends State<IntroMobileApp> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      elements: Elements(),
    );
  }

  Widget IntroButtons(){
    return Row(
      children: [
        Expanded(child:  ButtonRound(buttonText: 'Sign In', function:  (){ Get.to(SignIn());},),),
        SizedBox(width: 15,),
        Expanded(child:  ButtonRound(buttonText: 'Register',buttonColor: INTROBUTTONCOLOR,textColor: LIGHT_BUTTON_COLOR, function:  (){
          Get.to(SignUp());
        },),)
      ],
    );
  }


  Widget Elements(){
    return Container(
      child: Container(
        margin: EdgeInsets.only(left: 35,right: 35,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/introLogo.png'),
            SizedBox(height: 80,),
            IntroButtons(),
            SizedBox(height: 40,),
            OrLoginWith(),
            SizedBox(height: 130,),
            Container(
                width: 280,
                height: 50,
                child: ButtonRoundGoogle(buttonText: 'Continue with Google',buttonColor: Colors.white,textColor: LIGHT_BUTTON_COLOR,)),
          ],
        ),
      ),
    );
  }

}
