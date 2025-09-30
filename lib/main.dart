import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/l10n/app_localizations.dart';
import 'package:shopping_app/screens/welcome_page.dart';
import 'package:shopping_app/providers/language_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return MaterialApp(
          title: 'Shopping App',
          locale: languageProvider.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('ar', ''),
          ],
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Suwannaphum',
          ),
          home: const WelcomeScreen(),
        );
      },
    );
  }
}