# Shopping App - Flutter E-Commerce Application

A beautiful, fully localized Flutter shopping application with English and Arabic support, featuring an elegant UI with smooth animations and transitions.

## Features

### 1. Aesthetic Welcome Screen
- Custom branded AppBar with app title
- Dual image display (local asset + online image from Unsplash)
- Custom Suwannaphum font with styled typography
- Gradient background for visual appeal
- Hover effects on images for interactivity
- Two action buttons: Sign Up and Sign In
- Language switcher to toggle between English and Arabic

### 2. User Authentication Forms

#### Sign Up Form
- **Full Name** validation (first letter must be uppercase)
- **Email** validation (must contain @ and .)
- **Password** validation (minimum 6 characters)
- **Confirm Password** matching validation
- Success dialog on valid submission
- Smooth navigation to shopping home screen

#### Sign In Form
- **Email** validation
- **Password** validation
- Password visibility toggle
- Success dialog on valid submission
- Direct navigation to main app

### 3. Smooth Page Transitions
- Custom `FadeRoute` for seamless page transitions
- 500ms fade animation between screens
- Professional user experience

### 4. Shopping Home Screen
- **AppBar** with "Our Products" title and cart icon with badge counter
- **Featured Products Section**:
  - Horizontal PageView carousel with 3 featured banners
  - Navigation arrows with enabled/disabled states
  - Page indicator dots
  - Gradient overlays on images
- **Product Grid**:
  - Responsive 2-column GridView
  - 6 products with images, titles, and prices
  - "Add to Cart" button on each card
  - SnackBar notification when item added
  - Cart counter updates in real-time
- **Hot Offers Section**:
  - ListView with 5 scrollable offer cards
  - Each card displays title, description, and badge
  - Hover effects for interactivity
- **Visual Enhancements**:
  - Gradient background throughout
  - Hover scale effects on cards
  - Shadow effects for depth
  - Smooth scrolling experience

### 5. Arabic Language Support (Bonus)
- Complete RTL (Right-to-Left) support
- All UI text translated to Arabic
- No hardcoded strings in UI code
- Uses `.arb` files for localization
- `intl` package integration
- Language toggle button in AppBar
- Language selection dialog with flag emojis

## Technical Implementation

### Project Structure
```
lib/
├── l10n/
│   ├── app_localizations.dart
│   ├── app_localizations_en.dart
│   ├── app_localizations_ar.dart
│   ├── app_en.arb
│   └── intl_ar.arb
├── models/
│   └── product.dart
├── providers/
│   └── language_provider.dart
├── screens/
│   ├── welcome_page.dart
│   ├── signup_page.dart
│   ├── signin_page.dart
│   └── home_page.dart
├── utils/
│   ├── validators.dart
│   ├── fade_out.dart
│   └── hover.dart
├── widgets/
│   ├── custom_button.dart
│   ├── custom_textfield.dart
│   ├── product_card.dart
│   └── offer_item.dart
└── main.dart
```

### Key Technologies
- **Flutter SDK**: Latest stable version
- **State Management**: Provider package
- **Localization**: flutter_localizations, intl
- **Custom Fonts**: Suwannaphum font family
- **Custom Widgets**: Reusable components
- **Custom Animations**: Fade transitions, hover effects

### Code Quality
-  Each widget/class in separate files
-  No code duplication
-  Clear, descriptive naming conventions
-  Proper validation logic separation
-  Formatted and clean codebase
-  No unused imports or code

## Setup Instructions

### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/salma-samyy7/Shopping-App.git
   cd shopping_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Add assets**
   - Ensure all images are in `assets/images/` directory:
     - clothes.jpg
     - sundress.jpg
     - shirt.jpg
     - jumper.jpg
     - jacket.jpg
     - pants.jpg
     - creamyT-shirt.jpg
     - banner.jpg
     - banner2.jpg
     - banner3.jpg

4. **Generate localization files** (if needed)
   ```bash
   flutter gen-l10n
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

### Dependencies
Add these to your `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: any
  provider: ^6.0.0

flutter:
  generate: true
  uses-material-design: true
  
  assets:
    - assets/images/
  
  fonts:
    - family: Suwannaphum
      fonts:
        - asset: assets/fonts/Suwannaphum-Regular.ttf
```

## Design Highlights

- **Color Scheme**: Deep purple primary with blue-purple gradients
- **Typography**: Suwannaphum font for branding, system fonts for body text
- **Animations**: Subtle hover effects, smooth page transitions, fade animations
- **Layout**: Responsive design with proper spacing and alignment
- **Accessibility**: Clear labels, proper contrast, semantic structure


## Localization

The app supports two languages:
- **English (en)**: Default language
- **Arabic (ar)**: Full RTL support

Toggle between languages using the language button in the AppBar on the welcome screen.

## Features Demonstrated

- Custom widget creation
- State management with Provider
- Form validation
- Navigation and routing
- Localization and internationalization
- Custom animations
- Responsive layouts
- Asset management
- Custom fonts
- Gradient backgrounds
- Interactive UI elements

## Author

Salma Samy

## License

This project is created for educational purposes as part of a Flutter development course.
