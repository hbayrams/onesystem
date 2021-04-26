import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/login_controller.dart';
import 'package:onesystem/controllers/sharpref_controller.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/views/tablet/widgets/dialog_widget.dart';
import 'package:onesystem/views/tablet/widgets/rbutton_widget.dart';
import 'package:onesystem/views/tablet/widgets/textformfield_widget.dart';

class LoginPage extends StatelessWidget {
  LoginController lc = Get.put(LoginController());
  SharedPrefController sc = Get.put(SharedPrefController());
  ThemeController tc = Get.put(ThemeController());
  List images = [
    'assets/images/intro1_crossplatform.png',
    'assets/images/intro2_qc.png',
    'assets/images/intro3_database.png',
    'assets/images/intro4_welders.png'
  ];
  @override
  Widget build(BuildContext context) {
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: tc.isColorChangeDW(),
        body: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Container(
                  //padding: EdgeInsets.only(left: sizeWidth * .05),
                  color: tc.isColorChangeDW(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          tc.isSavedDarkMode()
                              ? 'assets/images/dark1_lowheight.png'
                              : 'assets/images/light1_lowheight.png',
                          height: keyboardOpen ? 0 : 50,
                        ),
                      ),
                      SizedBox(height: keyboardOpen ? 0 : Get.height * .03),
                      buildFormLogin2(sc, lc, tc, context),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Container(
                  height: Get.height,
                  color: tc.isColorChangeWD(),
                  child: Swiper(
                    scale: 0.9,
                    viewportFraction: 0.9,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        images[index],
                        fit: BoxFit.fitWidth,
                      );
                    },
                    autoplay: true,
                    autoplayDelay: 3000,
                    control: SwiperControl(color: tc.isColorChangeDW()),
                    pagination: SwiperPagination(
                      margin: EdgeInsets.only(bottom: 30),
                      builder: DotSwiperPaginationBuilder(
                          activeColor: Global.dark_red, activeSize: 15.0),
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

Form buildFormLogin2(SharedPrefController sc, LoginController lc,
    ThemeController tc, BuildContext context) {
  return Form(
    key: lc.formKey.value,
    // ignore: deprecated_member_use
    autovalidate: lc.autoValidate,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildTextFormFieldWidgetUsername(lc),
          SizedBox(
            height: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Obx(
                () => buildTextFormFieldWidgetPass(lc),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetX<LoginController>(
                    builder: (_) => Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: tc.isColorChangeWD(),
                          ),
                          child: Checkbox(
                            activeColor: tc.isColorChangeWD(),
                            checkColor: tc.isColorChangeDW(),
                            value: lc.checkVal,
                            onChanged: (bool value) {
                              lc.checkVal = !lc.checkVal;
                              sc.isLogin = lc.checkVal;
                              print('Remember: Login Value: ' +
                                  sc.isLogin.toString());
                            },
                          ),
                        ),
                        Text(
                          'Remember Me?',
                          style: TextStyle(
                              color: tc.isColorChangeWD(),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                          color: tc.isColorChangeWD(),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RButtonWidget(
                color: Global.focusedBlue,
                onClick: () {
                  if (lc.formKey.value.currentState.validate()) {
                    lc.formKey.value.currentState.save();
                    Get.toNamed('t/homePage'); //with arguments
                    print('Sign in successfully' + lc.uname);
                    //sc.isLogin = lc.checkVal;                               //*buraya alınacak
                  } else {
                    lc.autoValidate = true;
                    print('Failed to sign in');
                    // _showMyDialog(
                    //   'Warning',
                    //   'Username or password  is wrong.',
                    //   'Or not registered in the system',
                    //   'HELP',
                    //   'OK',
                    //   () {
                    //     MyNavigator.gotoLoginHelp(context);
                    //   },
                    //);
                  }
                },
                title: 'Login',
              ),
              SizedBox(
                height: 10.0,
              ),
              RButtonWidget(
                color: Global.medium,
                onClick: () => Get.dialog(
                  ShowDialogWidget(
                    title: 'Exit',
                    tbtn1: 'OK',
                    tbtn2: 'CANCEL',
                    text1: 'Close the application.',
                    text2: 'Would you like to approve of this message?',
                    onPressed: () => exit(0),
                  ),
                  barrierDismissible: false,
                ),
                title: 'Exit',
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

TextFormFieldWidget buildTextFormFieldWidgetUsername(LoginController lc) {
  return TextFormFieldWidget(
    action: TextInputAction.next,
    hintText: 'Username',
    obscureText: false,
    prefixIconData: Icons.person,
    //*suffixIconData: model.isValid ? Icons.check : null,
    validator: lc.validateUname,
    onChanged: (value) => lc.onSavedUname(value),
  );
}

TextFormFieldWidget buildTextFormFieldWidgetPass(LoginController lc) {
  return TextFormFieldWidget(
    action: TextInputAction.done,
    hintText: 'Password',
    obscureText: lc.isVisible ? false : true,
    prefixIconData: Icons.lock,
    suffixIconData: lc.isVisible ? Icons.visibility : Icons.visibility_off,
    validator: lc.validatePassword,
    onChanged: (value) => lc.onSavedPassword(value),
  );
}
