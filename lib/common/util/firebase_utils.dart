import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void showFirebaseErrorSnack(BuildContext context, Object? error) {
  String errorMessage;
  if (error is FirebaseException) {
    errorMessage = error.message ?? "Something went wrong.";
  } else {
    errorMessage = error?.toString() ?? "Something went wrong.";
  }

  final snackBar = SnackBar(
    showCloseIcon: true,
    closeIconColor: Colors.white,
    content: Text(errorMessage),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
