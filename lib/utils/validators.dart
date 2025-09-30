
String? validateName(String? value) {
  if (value == null || value.isEmpty) return 'Enter your full name';
  if (value[0] != value[0].toUpperCase()) {
    return 'First letter must be uppercase';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) return 'Enter your email';
  if (!value.contains('@') || !value.contains('.')) return 'Email must contain @';
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) return 'Enter your password';
  if (value.length < 6) return 'Password must be at least 6 characters';
  return null;
}
