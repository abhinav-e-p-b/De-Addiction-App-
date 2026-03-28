# Aaroha — Rise, one day at a time

A Flutter recovery support app built on the **"Living Sanctuary"** design system.

---

## 🌿 Features

| Screen | Route | Description |
|--------|-------|-------------|
| **My Aaroha** (Tracker) | `/tracker` | Sobriety streak, daily goal cards, badge milestones, weekly reflections |
| **Swasthi** (AI Chat) | `/swasthi` | AI companion, mood check-in, relapse SOS, craving journal, anonymous by default |
| **Shanti Space** | `/shanti` | 4-7-8 breathwork orb, box breathing, soothing soundscapes, body scan guide |
| **Ujjwal Feed** | `/ujjwal` | Daily affirmations, recovery stories, curated quotes, Hope Wall (peer) |
| **Sangam + Sahara** | `/sangam` | NADA centres map, recovery events, register/withdraw, helpline one-tap |
| **Awareness Hub** | `/hub` | Tips, stories, resources, programs, weekly reflections |

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK ≥ 3.3.0
- Dart ≥ 3.3.0

### 1. Install dependencies
```bash
flutter pub get
```

### 2. Generate Hive adapters
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Add fonts
Download and place in `assets/fonts/`:
- `Manrope-Regular.ttf`
- `Manrope-SemiBold.ttf`
- `Manrope-Bold.ttf`
- `Manrope-ExtraBold.ttf`

(Or remove the custom font block from `pubspec.yaml` — Google Fonts will load at runtime.)

### 4. Create asset directories
```bash
mkdir -p assets/images assets/icons assets/animations
```

### 5. Run
```bash
flutter run
```

---

## 🏗 Project Structure

```
lib/
├── main.dart                          # Entry point
├── core/
│   ├── constants/
│   │   └── app_constants.dart         # Spacing, radii, helplines, Hive keys
│   ├── theme/
│   │   ├── app_colors.dart            # Full Material 3 color token set
│   │   ├── app_text_styles.dart       # Manrope + Inter typescale
│   │   └── app_theme.dart             # ThemeData configuration
│   ├── utils/
│   │   └── app_router.dart            # GoRouter with StatefulShellRoute
│   └── widgets/
│       ├── app_shell.dart             # Persistent shell (drawer + nav + FAB)
│       ├── aaroha_app_bar.dart        # Shared top bar with SOS chip
│       ├── aaroha_drawer.dart         # Side navigation drawer
│       ├── shared_widgets.dart        # GradientButton, TappableCard, chips...
│       └── sos_bottom_sheet.dart      # Crisis helpline modal
│
└── features/
    ├── tracker/                       # My Aaroha — streak + goals
    │   ├── domain/streak_model.dart
    │   ├── data/streak_provider.dart  # Riverpod notifiers
    │   └── presentation/screens/tracker_screen.dart
    │
    ├── swasthi/                       # AI companion chat
    │   ├── domain/mood_model.dart
    │   └── presentation/screens/swasthi_screen.dart
    │
    ├── shanti/                        # Calm + breathwork
    │   ├── domain/journal_model.dart
    │   └── presentation/screens/shanti_screen.dart
    │
    ├── ujjwal/                        # Quotes + stories feed
    │   ├── domain/content_model.dart
    │   └── presentation/screens/ujjwal_screen.dart
    │
    ├── sangam/                        # Events + resources map
    │   ├── domain/resource_model.dart
    │   └── presentation/screens/sangam_screen.dart
    │
    └── hub/                           # Awareness hub
        └── presentation/screens/hub_screen.dart
```

---

## 🎨 Design System — "The Living Sanctuary"

### Color tokens
| Role | Token | Hex |
|------|-------|-----|
| Action | `primary` | `#005440` |
| Sanctuary Base | `surface` | `#fcf9f5` |
| Urgency (SOS) | `tertiary` | `#832c0e` |
| Text High | `onSurface` | `#1b1c1a` |
| Soft Edge | `outlineVariant` | `#bec9c3` |
| Mint Accent | `mintSurface` | `#e1f5ee` |

### Typography
- **Display/Headlines** → Manrope (authority, editorial)
- **Body/Utility** → Inter (legibility, calm)

### Key rules
- ❌ No 1px solid borders — use surface tonal shifts instead
- ❌ No pure black `#000000` — use `onSurface` `#1b1c1a`
- ✅ Glassmorphism for floating elements (80% opacity + blur)
- ✅ Gradient CTA buttons (135° primary → primaryContainer)
- ✅ Ambient Bloom shadows (24px blur, 6% opacity)
- ✅ `rounded-xl` (24pt) on all main containers

---

## 📦 Key Dependencies

| Package | Purpose |
|---------|---------|
| `flutter_riverpod` | State management |
| `go_router` | Navigation with StatefulShellRoute |
| `google_fonts` | Runtime Manrope + Inter loading |
| `flutter_animate` | Page entrance & micro-interactions |
| `hive_flutter` | Local streak/journal persistence |
| `url_launcher` | One-tap helpline calls |

---

## 🔒 Privacy

- Anonymous by default
- No user data sent to servers
- Craving journal entries are in-memory only (not persisted)
- Crisis helplines connect directly — no data interception

---

## 🛣 Roadmap

- [ ] Firestore backend for Ujjwal Feed content
- [ ] Google Maps integration for Sangam centres
- [ ] Real AI integration for Swasthi (Anthropic API)
- [ ] Push notifications for daily check-in reminders
- [ ] Badge/achievement system
- [ ] Family/supporter mode
- [ ] Multilingual support (Hindi, Malayalam, Tamil)
