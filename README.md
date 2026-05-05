# 📱 Flutter Portfolio App
A simple flutter portfolio that sho

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
