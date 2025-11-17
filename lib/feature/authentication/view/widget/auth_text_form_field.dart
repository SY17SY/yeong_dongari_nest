import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeong_dongari_nest/constants/colors.dart';
import 'package:yeong_dongari_nest/constants/gaps.dart';
import 'package:yeong_dongari_nest/constants/sizes.dart';
import 'package:yeong_dongari_nest/feature/authentication/view/widget/input_clear_button.dart';

enum AuthFormType { login, signUp }

class AuthTextFormField extends ConsumerStatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String fieldKey;
  final AuthFormType formType;

  const AuthTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.fieldKey,
    required this.formType,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends ConsumerState<AuthTextFormField> {
  String text = "";
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() => text = widget.controller.text);
    if (widget.fieldKey == "password" || widget.fieldKey == "check") {
      _obscureText = true;
    }
  }

  void _toggleObscure() {
    setState(() {
      if (widget.fieldKey == "password" || widget.fieldKey == "check") {
        _obscureText = !_obscureText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(color: AppColors.neutral500),
        errorStyle: Theme.of(
          context,
        ).textTheme.labelLarge!.copyWith(color: AppColors.error),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.neutral300LD(context, ref)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryDarkLD(context, ref)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error),
        ),
        suffix: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (text.isNotEmpty)
              InputClearButton(controller: widget.controller),
            if (widget.fieldKey == "password" ||
                widget.fieldKey == "check") ...[
              Gaps.h16,
              GestureDetector(
                onTap: _toggleObscure,
                child: FaIcon(
                  _obscureText
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  color: AppColors.neutral400LD(context, ref),
                  size: Sizes.d20,
                ),
              ),
            ],
            Gaps.h8,
          ],
        ),
      ),
      style: Theme.of(context).textTheme.titleMedium,
      controller: widget.controller,
      autocorrect: false,
      obscureText: _obscureText,
      textInputAction: TextInputAction.next,
      validator: widget.validator,
    );
  }
}
