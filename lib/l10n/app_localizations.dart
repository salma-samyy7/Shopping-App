import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ar')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'ShopJoy'**
  String get appTitle;

  /// No description provided for @ourProducts.
  ///
  /// In en, this message translates to:
  /// **'Our Products'**
  String get ourProducts;

  /// No description provided for @hotOffers.
  ///
  /// In en, this message translates to:
  /// **'Hot Offers'**
  String get hotOffers;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @accountCreated.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get accountCreated;

  /// No description provided for @accountSignedIn.
  ///
  /// In en, this message translates to:
  /// **'Account sign-in successfully'**
  String get accountSignedIn;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Item added to the cart'**
  String get addToCart;

  /// No description provided for @featuredProducts.
  ///
  /// In en, this message translates to:
  /// **'Featured Products'**
  String get featuredProducts;

  /// No description provided for @shopOurCollection.
  ///
  /// In en, this message translates to:
  /// **'Shop Our Collection'**
  String get shopOurCollection;

  /// No description provided for @dressCollection.
  ///
  /// In en, this message translates to:
  /// **'Dress Collection'**
  String get dressCollection;

  /// No description provided for @newArrivals.
  ///
  /// In en, this message translates to:
  /// **'New Arrivals'**
  String get newArrivals;

  /// No description provided for @bestSellers.
  ///
  /// In en, this message translates to:
  /// **'Best Sellers'**
  String get bestSellers;

  /// No description provided for @productGreenSundress.
  ///
  /// In en, this message translates to:
  /// **'Green Sundress'**
  String get productGreenSundress;

  /// No description provided for @productCroppedShirt.
  ///
  /// In en, this message translates to:
  /// **'Cropped Shirt'**
  String get productCroppedShirt;

  /// No description provided for @productBlackJumper.
  ///
  /// In en, this message translates to:
  /// **'Black Jumper'**
  String get productBlackJumper;

  /// No description provided for @productSuitJacket.
  ///
  /// In en, this message translates to:
  /// **'Suit Jacket'**
  String get productSuitJacket;

  /// No description provided for @productHighWaistedJeans.
  ///
  /// In en, this message translates to:
  /// **'High Waisted Jeans'**
  String get productHighWaistedJeans;

  /// No description provided for @productCreamyTshirt.
  ///
  /// In en, this message translates to:
  /// **'Creamy T-shirt'**
  String get productCreamyTshirt;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @yourStyleYourWay.
  ///
  /// In en, this message translates to:
  /// **'Your Style, Your Way'**
  String get yourStyleYourWay;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an Account'**
  String get createAccount;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @enterFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get enterFullName;

  /// No description provided for @firstLetterUppercase.
  ///
  /// In en, this message translates to:
  /// **'First letter must be uppercase'**
  String get firstLetterUppercase;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmail;

  /// No description provided for @emailMustContainAt.
  ///
  /// In en, this message translates to:
  /// **'Email must contain @'**
  String get emailMustContainAt;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPassword;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLength;

  /// No description provided for @offer1Title.
  ///
  /// In en, this message translates to:
  /// **'50% Off Electronics'**
  String get offer1Title;

  /// No description provided for @offer1Desc.
  ///
  /// In en, this message translates to:
  /// **'Limited time offer on all tech gadgets'**
  String get offer1Desc;

  /// No description provided for @offer1Badge.
  ///
  /// In en, this message translates to:
  /// **'50% OFF'**
  String get offer1Badge;

  /// No description provided for @offer2Title.
  ///
  /// In en, this message translates to:
  /// **'Free Shipping Weekend'**
  String get offer2Title;

  /// No description provided for @offer2Desc.
  ///
  /// In en, this message translates to:
  /// **'No delivery charges on orders above \$50'**
  String get offer2Desc;

  /// No description provided for @offer2Badge.
  ///
  /// In en, this message translates to:
  /// **'FREE SHIP'**
  String get offer2Badge;

  /// No description provided for @offer3Title.
  ///
  /// In en, this message translates to:
  /// **'Buy 2 Get 1 Free'**
  String get offer3Title;

  /// No description provided for @offer3Desc.
  ///
  /// In en, this message translates to:
  /// **'On selected fashion items'**
  String get offer3Desc;

  /// No description provided for @offer3Badge.
  ///
  /// In en, this message translates to:
  /// **'BOGO'**
  String get offer3Badge;

  /// No description provided for @offer4Title.
  ///
  /// In en, this message translates to:
  /// **'Flash Sale'**
  String get offer4Title;

  /// No description provided for @offer4Desc.
  ///
  /// In en, this message translates to:
  /// **'Up to 70% off on accessories'**
  String get offer4Desc;

  /// No description provided for @offer4Badge.
  ///
  /// In en, this message translates to:
  /// **'FLASH'**
  String get offer4Badge;

  /// No description provided for @offer5Title.
  ///
  /// In en, this message translates to:
  /// **'Weekend Special'**
  String get offer5Title;

  /// No description provided for @offer5Desc.
  ///
  /// In en, this message translates to:
  /// **'Extra 20% off on everything'**
  String get offer5Desc;

  /// No description provided for @offer5Badge.
  ///
  /// In en, this message translates to:
  /// **'20% OFF'**
  String get offer5Badge;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ar'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ar': return AppLocalizationsAr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
