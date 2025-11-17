import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yeong_dongari_nest/constants/colors.dart';
import 'package:yeong_dongari_nest/constants/gaps.dart';
import 'package:yeong_dongari_nest/constants/sizes.dart';
import 'package:yeong_dongari_nest/constants/text.dart';
import 'package:yeong_dongari_nest/feature/authentication/view/syntax_validator.dart';
import 'package:yeong_dongari_nest/feature/authentication/view/widget/auth_text_form_field.dart';
import 'package:yeong_dongari_nest/feature/authentication/view/widget/bottom_auth.dart';
import 'package:yeong_dongari_nest/feature/authentication/view/widget/form_button.dart';
import 'package:yeong_dongari_nest/feature/authentication/view_model/login_vm.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = "login";
  static const routeUrl = "/login";
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() {
    formData["email"] = _emailController.text;
    formData["password"] = _passwordController.text;

    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        ref.read(loginProvider.notifier).login(context, formData);
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignUpTap() {
    context.pop();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                      TtitleLarge20("Log in", fontSize: Sizes.d24),
                      Gaps.v20,
                      TbodyLarge18(
                        "당신의 동아리둥지는 어디인가요?",
                        color: AppColors.neutral600LD(context, ref),
                      ),
                      Gaps.v40,
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            AuthTextFormField(
                              hintText: "email@example.com",
                              controller: _emailController,
                              validator: isEmailValid,
                              fieldKey: 'email',
                              formType: AuthFormType.login,
                            ),
                            Gaps.v10,
                            AuthTextFormField(
                              hintText: "password",
                              controller: _passwordController,
                              validator: isPasswordValid,
                              fieldKey: "password",
                              formType: AuthFormType.login,
                            ),
                            Gaps.v32,
                            FormButton(
                              title: "로그인",
                              onTap: _onSubmitTap,
                              disabled: ref.watch(loginProvider).isLoading,
                            ),
                          ],
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
          title: "계정이 없으신가요?",
          buttonTitle: "회원가입",
          onTap: _onSignUpTap,
        ),
      ),
    );
  }
}
