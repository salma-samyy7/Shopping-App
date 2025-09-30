import 'package:flutter/material.dart';
import 'package:shopping_app/l10n/app_localizations.dart';
import 'package:shopping_app/screens/home_page.dart';
import 'package:shopping_app/utils/fade_out.dart';
import 'package:shopping_app/widgets/custom_textfield.dart';
import '../utils/validators.dart';
import '../widgets/custom_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtl = TextEditingController();
  final _passCtl = TextEditingController();
  bool _hiddenPass = true;

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final t = AppLocalizations.of(context)!;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Center(
            child: Text(
              t.accountSignedIn,
              style: TextStyle(
                fontFamily: 'Suwannaphum',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
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
    _emailCtl.dispose();
    _passCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            t.signIn,
            style: TextStyle(
              fontFamily: 'Suwannaphum',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Subtitle
                  Text(
                    t.welcomeBack,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[700],
                    ),
                  ),
                  /*  const SizedBox(height: 8),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),*/
                  const SizedBox(height: 32),

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
                  const SizedBox(height: 18),
                  CustomButton(text: t.signIn, onPressed: _submit),
                  const SizedBox(height: 40), // Extra padding at bottom
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
