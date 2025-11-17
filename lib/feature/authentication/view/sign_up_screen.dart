import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:yeong_dongari_nest/constants/colors.dart';
import 'package:yeong_dongari_nest/constants/gaps.dart';
import 'package:yeong_dongari_nest/constants/sizes.dart';
import 'package:yeong_dongari_nest/constants/text.dart';
import 'package:yeong_dongari_nest/feature/authentication/view/email_sign_up_screen.dart';
import 'package:yeong_dongari_nest/feature/authentication/view/login_screen.dart';
import 'package:yeong_dongari_nest/feature/authentication/view/widget/auth_button.dart';
import 'package:yeong_dongari_nest/feature/authentication/view/widget/bottom_auth.dart';

class SignUpScreen extends ConsumerWidget {
  static const routeName = "sign-up";
  static const routeUrl = "/sign-up";

  const SignUpScreen({super.key});

  void _onEmailTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmailSignUpScreen()),
    );
  }

  void _onLoginTap(BuildContext context) {
    context.push(LoginScreen.routeUrl);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.d32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 4, child: SizedBox()),
              Expanded(
                flex: 30,
                child: Column(
                  children: [
                    TtitleLarge20("Sign up", fontSize: Sizes.d24),
                    Gaps.v20,
                    TbodyLarge18("안락한 동아리둥지 속에서", color: AppColors.neutral600),
                    Gaps.v40,
                    GestureDetector(
                      onTap: () => _onEmailTap(context),
                      child: AuthButton(
                        icon: FontAwesomeIcons.user,
                        text: "이메일 / 비밀번호",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAuth(
        title: "이미 가입하셨나요?",
        buttonTitle: "로그인",
        onTap: () => _onLoginTap(context),
      ),
    );
  }
}
