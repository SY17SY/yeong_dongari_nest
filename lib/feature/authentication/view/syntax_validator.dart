String? isNameValid(String? input) {
  if (input == null || input.isEmpty) {
    return "이름을 작성해 주세요.";
  }
  return null;
}

String? isEmailValid(String? input) {
  if (input == null || input.isEmpty) {
    return "이메일을 작성해 주세요.";
  }
  final regExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  if (!regExp.hasMatch(input)) {
    return "이메일의 형식이 올바르지 않습니다.";
  }
  return null;
}

String? isPasswordValid(String? input) {
  if (input == null || input.isEmpty) {
    return "비밀번호를 작성해 주세요.";
  }
  final baseRegExp = r"[A-Za-z0-9@$!%*#?&\^]";
  final regExpLen = r"{8,20}";
  final regExpChr = r"(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&\^])";

  final regExp1 = RegExp(r"^" + regExpChr + baseRegExp);
  if (!regExp1.hasMatch(input)) {
    return "비밀번호의 형식이 올바르지 않습니다.";
  }
  final regExp2 = RegExp(r"^" + baseRegExp + regExpLen);
  if (!regExp2.hasMatch(input)) {
    return "비밀번호는 8~20자로 작성해주세요.";
  }
  return null;
}

String? checkPassword(String? input, String? password) {
  if (password == null || password.isEmpty) {
    return null;
  }
  if (input == null || input.isEmpty) {
    return "비밀번호를 한 번 더 작성해 주세요.";
  }
  if (input != password) {
    return "비밀번호가 일치하지 않습니다.";
  }
  return null;
}
