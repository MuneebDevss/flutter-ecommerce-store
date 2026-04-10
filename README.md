# 🛒 Flutter E-Commerce Store

A full-featured, cross-platform **E-Commerce application** built with **Flutter** and **Firebase**. The app enables customers to browse products by category, manage a cart and wishlist, complete purchases, and track orders — all from a clean, responsive UI. An integrated admin panel allows product and category management without a separate backend dashboard.

> **Target users:** Online shoppers looking for a seamless mobile shopping experience, and store administrators who need a lightweight management interface.

---

## ✨ Features

- 🔑 **Authentication** – Email/password sign-up, login, Google Sign-In, and email verification via Firebase Auth
- 🏠 **Onboarding** – First-launch walkthrough screens for new users
- 🛍️ **Product Catalog** – Browse products by category, view detailed product pages with images, descriptions, and ratings
- ⭐ **Reviews & Ratings** – Customers can read and submit product reviews with star ratings
- 🛒 **Cart & Checkout** – Add/remove items, view order summary, and process orders
- 💖 **Wishlist** – Save favourite products for later
- 👤 **User Settings** – Manage profile, delivery addresses, and order history
- 👨‍💻 **Admin Panel** – Create, update, and delete products and categories with image uploads
- 🎨 **Dynamic Theming** – System-aware light/dark theme with a centralised design system
- 🌍 **Cross-Platform** – Runs on Android, iOS, Web, Linux, macOS, and Windows

---

## 🏗️ Architecture & Technical Design

### Architecture

The project follows **Clean Architecture** with a **feature-first** folder structure. Each feature is self-contained and divided into three layers:

```
Presentation  ──►  Domain  ──►  Data
(BLoC / UI)      (Repos)     (Firebase / Remote)
```

| Layer | Responsibility |
|---|---|
| **Presentation** | Flutter widgets, screens, and BLoC event/state management |
| **Domain** | Repository interfaces and core business entities |
| **Data** | Concrete repository implementations and remote data sources (Firestore, Firebase Auth, Firebase Storage) |

### State Management

**Flutter BLoC** (`flutter_bloc ^9.1.1`) is used throughout the app:

| BLoC | Scope |
|---|---|
| `AuthBloc` | Authentication state (login, signup, session checks) |
| `SettingsBloc` | Profile, address, and order management |
| `ProductsBloc` | Product listing and detail state |
| `WishBloc` | Wishlist / navigation tab state |

### Dependency Injection

**GetIt** (`get_it ^8.2.0`) is used as the service locator. All repositories, data sources, and BLoCs are registered in `lib/depencyInjection.dart` and resolved via `injector<T>()`.

### Data Flow

```
UI Widget
  │  dispatches Event
  ▼
BLoC (Presentation)
  │  calls Repository method
  ▼
Repository (Domain)
  │  delegates to RemoteDataSource
  ▼
RemoteDataSource (Data)
  │  reads/writes Firestore / Firebase Auth / Storage
  ▼
Firebase Backend
```

### Backend & API Integration

- **Firebase Authentication** – handles email/password, Google Sign-In, and email verification
- **Cloud Firestore** – NoSQL document store for products, categories, orders, addresses, and user profiles
- **Firebase Storage** – stores product and category images uploaded via the admin panel
- **Hive** – lightweight local storage for caching and offline-first data
- **connectivity_plus** – detects network state to gracefully handle offline scenarios

### Key Packages

| Package | Purpose |
|---|---|
| `flutter_bloc` | BLoC pattern state management |
| `get_it` | Dependency injection / service locator |
| `firebase_auth` | User authentication |
| `cloud_firestore` | Cloud database |
| `firebase_storage` | Image/file storage |
| `google_sign_in` | OAuth Google login |
| `get` | Navigation and `GetMaterialApp` wrapper |
| `hive` | Local key-value storage |
| `image_picker` | Camera/gallery image selection |
| `carousel_slider` | Banner/image carousels |
| `flutter_rating_bar` | Star rating widget |
| `fpdart` | Functional programming helpers (Either, Option) |
| `http` | HTTP client for any REST calls |
| `intl` | Date/number formatting and localisation |
| `url_launcher` | Open external URLs |
| `connectivity_plus` | Network connectivity detection |
| `smooth_page_indicator` | Onboarding page dots |
| `iconsax` | Extended icon set |
| `readmore` | Expandable text for product descriptions |

---

## 📂 Project Structure

```
lib/
├── main.dart                   # App entry point – Firebase init, BLoC providers, theme
├── depencyInjection.dart        # GetIt service-locator registrations
├── firebase_options.dart        # Auto-generated Firebase platform config
│
├── Core/                        # App-wide shared code
│   ├── constants/               # Colors, sizes, enums, string constants
│   ├── Controllers/             # Shared GetX/logic controllers
│   ├── DeviceUtils/             # Screen size, connectivity helpers
│   ├── Entities/                # Shared domain models (Product, Brand, User…)
│   ├── formatter/               # Value formatters (currency, color parsing)
│   ├── HelpingFunctions/        # Image picker utils and general helpers
│   ├── PriceCalulator/          # Discount and price calculation helpers
│   ├── Theme/                   # Light/dark ThemeData, typography, component themes
│   ├── UrlHandler/              # URL/deep-link routing helpers
│   └── Widgets/                 # Reusable UI components (buttons, cards, loaders…)
│
└── Features/                    # Feature modules (Data / Domain / Presentation)
    ├── AdminsPanel/             # Admin screens – product & category CRUD
    ├── Auth/                    # Login, signup, verification; AuthBloc
    ├── Categories/              # Category listing and navigation
    ├── Navigation/              # Bottom-nav tabs, wishlist; WishBloc
    ├── OnBoardingScreen/        # First-launch onboarding flow
    ├── ProductDetails/          # Product list, detail view, reviews; ProductsBloc
    ├── Settings/                # Profile, addresses, cart, checkout, orders; SettingsBloc
    └── Widgets/                 # Feature-specific shared widgets
```

---

## ⚙️ Setup Instructions

### Prerequisites

| Tool | Minimum version |
|---|---|
| Flutter SDK | `3.x` (Dart SDK `^3.7.2`) |
| Dart | `^3.7.2` |
| Android Studio / Xcode | Latest stable (for device emulation) |
| Firebase project | With Auth, Firestore, and Storage enabled |

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/MuneebDevss/flutter-ecommerce-store.git
cd flutter-ecommerce-store
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Configure Firebase**

   - Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com).
   - Enable **Authentication** (Email/Password + Google), **Cloud Firestore**, and **Firebase Storage**.
   - Use the [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/) to generate `lib/firebase_options.dart`:

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

---

## 🚀 Build & Run

### Run on a connected device or emulator

```bash
flutter run
```

### Run on a specific platform

```bash
flutter run -d android
flutter run -d ios
flutter run -d chrome          # Web
flutter run -d linux           # Linux desktop
```

### Build release APK (Android)

```bash
flutter build apk --release
```

### Build App Bundle (Android – recommended for Play Store)

```bash
flutter build appbundle --release
```

### Build for iOS

```bash
flutter build ios --release
```

### Build for Web

```bash
flutter build web --release
```

---

## 📸 Screenshots

> _Screenshots will be added as the project matures. Clone the repo and run locally to explore the UI._

| Onboarding | Home | Product Detail |
|---|---|---|
| _coming soon_ | _coming soon_ | _coming soon_ |

| Cart | Wishlist | Admin Panel |
|---|---|---|
| _coming soon_ | _coming soon_ | _coming soon_ |

---

## 🔮 Future Improvements

- [ ] **Payment Gateway** – Integrate Stripe or PayPal for real payment processing
- [ ] **Push Notifications** – Firebase Cloud Messaging for order updates and promotions
- [ ] **Search & Filters** – Full-text product search with price range, brand, and rating filters
- [ ] **Localisation (i18n)** – Multi-language support using Flutter's `intl` package
- [ ] **Offline Mode** – Expand Hive caching so users can browse products without a connection
- [ ] **Product Variants** – Support for size, colour, and other product attribute selections
- [ ] **Order Tracking** – Real-time order status updates with a timeline view
- [ ] **Unit & Widget Tests** – Increase test coverage for BLoCs, repositories, and key widgets
- [ ] **CI/CD Pipeline** – Automated builds and releases via GitHub Actions

---

## 📄 License

This project is licensed under the terms of the [LICENSE](LICENSE) file included in this repository.

---

<p align="center">Made with ❤️ using Flutter & Firebase</p>
