import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/button_widget.dart';
import 'package:foodninja/app/core/widgets/text_button_widget.dart';
import 'package:foodninja/app/core/widgets/text_field_widget.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';
import 'package:foodninja/app/modules/authentication/login/widgets/login_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFF),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: padding.copyWith(
            right: padding.right + 25,
            left: padding.left + 25,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage(
                'assets/images/splash_background.png',
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 47.0),
                child: Image.asset('assets/images/logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: TextWidget.inter(
                  'Login To Your Account',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: TextFieldWidget(
                  controller: textEditingController,
                  hint: 'Email',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                ),
                child: TextFieldWidget(
                  controller: textEditingController,
                  hint: 'Password',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                ),
                child: TextWidget.inter(
                  'Or Continue With',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  LoginButtonWidget(
                    child: SvgPicture.asset(
                      'assets/images/facebook_icon.svg',
                      width: 25,
                      height: 25,
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    width: 21,
                  ),
                  LoginButtonWidget(
                    child: SvgPicture.asset(
                      'assets/images/google_icon.svg',
                      width: 24,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 36),
                child: TextButtonWidget(
                  text: 'Forgot Your Password?',
                  isUnderline: false,
                  onPressed: () {},
                  style: TextStyle(
                    color: context.appTheme.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              //  TextWidget.inter(
              //     'Forgot Your Password?',
              //     style: TextStyle(
              //       color: context.appTheme.green,
              //       fontSize: 12,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   )
              ButtonWidget(
                text: 'Login',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
