# 📱 Flutter Portfolio App

A beautiful mobile portfolio app inspired by a modern designer card UI.
Built with Flutter — **light blue** color scheme replacing the original orange.

---

## 📁 File Structure

```
flutter_portfolio/
├── pubspec.yaml                   ← dependencies & asset declarations
├── README.md
├── assets/
│   ├── images/
│   │   ├── profile.png            ← your profile photo (add this!)
│   │   ├── project_app.png        ← project thumbnail
│   │   ├── project_web.png
│   │   └── project_brand.png
│   └── fonts/
│       ├── Poppins-Regular.ttf    ← download from Google Fonts
│       ├── Poppins-SemiBold.ttf
│       ├── Poppins-Bold.ttf
│       └── Poppins-ExtraBold.ttf
└── lib/
    ├── main.dart                  ← app entry point
    ├── theme/
    │   └── app_theme.dart         ← colors, text styles, ThemeData
    ├── models/
    │   └── portfolio_model.dart   ← data classes + demo data
    ├── screens/
    │   ├── home_screen.dart       ← bottom nav shell
    │   ├── profile_screen.dart    ← left card (hero + stats + buttons)
    │   └── portfolio_screen.dart  ← right card (projects + social)
    └── widgets/
        ├── app_bar_widget.dart    ← logo + menu top bar
        ├── stat_chip.dart         ← experience / clients chips
        ├── social_pill.dart       ← Dribbble / Behance / Skype icons
        └── project_card.dart      ← individual project row card
```

---

## 🚀 How to Run

### Prerequisites
- Flutter SDK ≥ 3.0 installed → https://flutter.dev/docs/get-started/install
- Android Studio **or** VS Code with Flutter extension
- A connected device or emulator

### Step-by-step

```bash
# 1. Clone or copy this folder to your workspace
cd your-workspace
# (paste the flutter_portfolio folder here)

# 2. Get dependencies
cd flutter_portfolio
flutter pub get

# 3. Run on your device/emulator
flutter run
```

---

## 🎨 Customization Guide

### 1 — Change Your Info
Open `lib/models/portfolio_model.dart` and edit `demoPortfolio`:

```dart
final demoPortfolio = PortfolioModel(
  name: 'Your Name',
  title: 'Your Title',
  email: 'you@email.com',
  bio: 'Write your bio here...',
  experience: 5,
  clients: 40,
  projectsCompleted: 80,
  // ...
);
```

### 2 — Add Your Profile Photo
1. Place `profile.png` in `assets/images/`
2. In `lib/screens/profile_screen.dart`, find the placeholder `Container` and replace:

```dart
// Before (placeholder):
child: const Icon(Icons.person, size: 100, color: AppTheme.primary),

// After (real photo):
child: Image.asset('assets/images/profile.png', fit: BoxFit.cover),
```

### 3 — Add Project Thumbnails
Place your images in `assets/images/` and update `portfolio_model.dart`:

```dart
ProjectItem(
  title: 'App Design',
  imageAsset: 'assets/images/project_app.png',
  // ...
)
```

Then in `project_card.dart` replace the Icon placeholder:
```dart
Image.asset(project.imageAsset, fit: BoxFit.cover)
```

### 4 — Change Colors
All colors are in `lib/theme/app_theme.dart`:

```dart
static const Color primary      = Color(0xFF5BB8F5); // main blue
static const Color primaryLight = Color(0xFFADD8F7); // pale blue
static const Color accent       = Color(0xFF1E88E5); // CTA blue
```

Swap these for any color you like.

### 5 — Add Poppins Font (optional but recommended)
1. Download Poppins from https://fonts.google.com/specimen/Poppins
2. Put `.ttf` files in `assets/fonts/`
3. Uncomment the `fonts:` section in `pubspec.yaml`

Alternatively, use the `google_fonts` package:
```yaml
dependencies:
  google_fonts: ^6.2.1
```
Then in `app_theme.dart`:
```dart
import 'package:google_fonts/google_fonts.dart';
// Replace fontFamily: 'Poppins' with:
textTheme: GoogleFonts.poppinsTextTheme(),
```

---

## 📦 Optional Packages

Add these in `pubspec.yaml` under `dependencies:` for extra features:

| Package | Purpose |
|---|---|
| `url_launcher` | Open social links in browser |
| `google_fonts` | Poppins from the internet (no download) |
| `share_plus` | Share resume PDF |
| `animate_do` | Easy entrance animations |

---

## 🏗️ Architecture Overview

```
main.dart
  └── MyApp (MaterialApp)
        └── HomeScreen (BottomNavigationBar)
              ├── ProfileScreen  ← Tab 0
              │     ├── AppBarWidget
              │     ├── Hero circle + StatChips
              │     └── Info card (name, bio, buttons)
              └── PortfolioScreen  ← Tab 1
                    ├── AppBarWidget
                    ├── Hero banner
                    ├── SocialPills row
                    ├── Specialist section + CTA
                    └── ProjectCards list
```

---

## 🙋 Tips

- Run `flutter doctor` to check your environment is set up correctly.
- Use `flutter run --release` for production builds.
- To build an APK: `flutter build apk --release`
- To build for iOS: `flutter build ios` (requires a Mac + Xcode)
