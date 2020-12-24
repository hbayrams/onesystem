import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/login_controller.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/views/tablet/widgets/rbutton_widget.dart';
import 'package:onesystem/views/tablet/widgets/textformfield_widget.dart';

class LoginPage extends StatelessWidget {
  LoginController lc = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Global.white,
        body: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Container(
                  //padding: EdgeInsets.only(left: sizeWidth * .05),
                  color: Global.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/logo_full_low_height.png',
                          height: keyboardOpen ? 0 : 50,
                        ),
                      ),
                      SizedBox(height: keyboardOpen ? 0 : Get.height * .03),
                      buildFormLogin2(lc, context),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Container(
                  color: Global.dark,
                  child: Column(children: [
                    Image.asset(
                      'assets/images/home_right.png',
                      height: Get.height * .96,
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Form buildFormLogin2(LoginController lc, BuildContext context) {
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
                          data: ThemeData(unselectedWidgetColor: Global.dark),
                          child: Checkbox(
                            activeColor: Global.dark,
                            value: lc.checkVal,
                            onChanged: (bool value) {
                              lc.checkVal = !lc.checkVal;
                              //model.isRemember = checkVal;
                            },
                          ),
                        ),
                        Text(
                          'Remember Me?',
                          style: TextStyle(
                              color: Global.dark,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    textColor: Global.dark,
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                          color: Global.dark,
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
                    Get.toNamed('t/settingsPage'); //with arguments
                    print('Sign in successfully' + lc.uname);
                    //setLogin(model.uname);
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
                // onClick: () => _showMyDialog(
                //   'Exit',
                //   'Close the application.',
                //   'Would you like to approve of this message?',
                //   'OK',
                //   'CANCEL',
                //   () {
                //     exit(0);
                //   },
                // ),
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
