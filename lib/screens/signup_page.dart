import 'package:flutter/material.dart';
import 'package:shopping_app/l10n/app_localizations.dart';
import 'package:shopping_app/screens/home_page.dart';
import 'package:shopping_app/utils/fade_out.dart';
import 'package:shopping_app/widgets/custom_textfield.dart';
import '../utils/validators.dart';
import '../widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtl = TextEditingController();
  final _emailCtl = TextEditingController();
  final _passCtl = TextEditingController();
  final _confirmCtl = TextEditingController();
  bool _hiddenPass = true;

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final t = AppLocalizations.of(context)!;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Center(
            child: Text(
              t.accountCreated,
              style: TextStyle(
                fontFamily: 'Suwannaphum',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center, // Center the button
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text(t.close, style: TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(
                  FadeRoute(const ShoppingHomeScreen()),
                  (r) => false,
                );
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameCtl.dispose();
    _emailCtl.dispose();
    _passCtl.dispose();
    _confirmCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: 
           Text(
            t.signUp,
            style: TextStyle(
              fontFamily: 'Suwannaphum',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),    
          ),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.withValues(alpha: 0.1),
              Colors.purple.withValues(alpha: 0.2),
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  t.createAccount,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[700],
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: _nameCtl,
                  label: t.fullName,
                  topLabel: t.fullName,
                  validator: validateName,
                ),
                CustomTextField(
                  controller: _emailCtl,
                  label: t.email,
                  topLabel: t.email,
                  validator: validateEmail,
                ),
                CustomTextField(
                  controller: _passCtl,
                  label: t.password,
                  topLabel: t.password,
                  validator: validatePassword,
                  obscureText: _hiddenPass,
                  toggleObscure: () =>
                      setState(() => _hiddenPass = !_hiddenPass),
                ),
                CustomTextField(
                  controller: _confirmCtl,
                  label: t.confirmPassword,
                  topLabel: t.confirmPassword,
                  validator: (v) =>
                      v != _passCtl.text ? t.passwordsDoNotMatch : null,
                  obscureText: true,
                ),
                const SizedBox(height: 18),
                CustomButton(text: t.signUp, onPressed: _submit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
