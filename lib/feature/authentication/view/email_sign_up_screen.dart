import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/constants/colors.dart';
import 'package:yeong_dongari_nest/constants/gaps.dart';
import 'package:yeong_dongari_nest/constants/sizes.dart';
import 'package:yeong_dongari_nest/constants/text.dart';
import 'package:yeong_dongari_nest/feature/authentication/view/syntax_validator.dart';
import 'package:yeong_dongari_nest/feature/authentication/view/widget/auth_text_form_field.dart';
import 'package:yeong_dongari_nest/feature/authentication/view/widget/form_button.dart';
import 'package:yeong_dongari_nest/feature/authentication/view_model/sign_up_vm.dart';

class EmailSignUpScreen extends ConsumerStatefulWidget {
  const EmailSignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EmailSignUpScreenState();
}

class _EmailSignUpScreenState extends ConsumerState<EmailSignUpScreen> {
  late final TextEditingController _nameController = TextEditingController();
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late final TextEditingController _checkController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() {
    formData["name"] = _nameController.text;
    formData["email"] = _emailController.text;
    formData["password"] = _passwordController.text;

    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        ref.read(signUpProvider.notifier).emailSignUp(context, formData);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _checkController.dispose();
    super.dispose();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(title: TtitleMedium18("회원가입")),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.d20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Gaps.v28,
                  TtitleSmall16("닉네임", color: AppColors.neutral500),
                  Gaps.v8,
                  AuthTextFormField(
                    hintText: "name",
                    controller: _nameController,
                    validator: isNameValid,
                    fieldKey: 'name',
                    formType: AuthFormType.signUp,
                  ),
                  Gaps.v28,
                  TtitleSmall16("이메일", color: AppColors.neutral500),
                  Gaps.v8,
                  AuthTextFormField(
                    hintText: "email@example.com",
                    controller: _emailController,
                    validator: isEmailValid,
                    fieldKey: 'email',
                    formType: AuthFormType.signUp,
                  ),
                  Gaps.v28,
                  TtitleSmall16("비밀번호", color: AppColors.neutral500),
                  Gaps.v8,
                  AuthTextFormField(
                    hintText: "password",
                    controller: _passwordController,
                    validator: isPasswordValid,
                    fieldKey: 'password',
                    formType: AuthFormType.signUp,
                  ),
                  Gaps.v28,
                  TtitleSmall16("비밀번호 확인", color: AppColors.neutral500),
                  Gaps.v8,
                  AuthTextFormField(
                    hintText: "password",
                    controller: _checkController,
                    validator: (input) =>
                        checkPassword(input, _passwordController.text),
                    fieldKey: "check",
                    formType: AuthFormType.signUp,
                  ),
                  Gaps.v48,
                  FormButton(
                    title: "회원가입",
                    onTap: _onSubmitTap,
                    disabled: ref.watch(signUpProvider).isLoading,
                  ),
                  Gaps.v48,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
