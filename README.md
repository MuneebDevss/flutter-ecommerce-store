# 🛒 Flutter E-Commerce App

A modern **E-Commerce application** built with **Flutter** and **Firebase**, following a **clean layered architecture**.  
This app demonstrates best practices in dependency injection, reusable core modules, feature-first structure, and modular state management.

---

## ✨ Features

- 🔑 **Authentication** – Login, signup, and account verification (with Firebase)  
- 🛍️ **Product Catalog** – Categories, product details, reviews  
- 🛒 **Cart & Checkout** – Add/remove items, order processing  
- ⭐ **Wishlist & Settings** – Save products, manage profile, addresses, and orders  
- 👨‍💻 **Admin Panel** – Manage products and categories  
- 🎨 **Theming** – Centralized theme and reusable UI components  
- 🌍 **Cross-platform** – Android, iOS, Web, and Desktop  

---

## 📂 Project Structure

### Root
- **`main.dart`** → Application entry point (initializes Firebase, themes, navigation)  
- **`firebase_options.dart`** → Firebase platform configuration (generated)  
- **`dependencyInjection.dart`** → Sets up service locators, repositories, and controllers  

### `lib/Core/`
App-wide, reusable building blocks:
- `constants/` → API endpoints, colors, sizes, enums, strings  
- `Controllers/` → Shared controllers (products, brands, etc.)  
- `DeviceUtils/` → Device info, connectivity utilities  
- `Entities/` → Domain models (`Product`, `Brand`, `User`, etc.)  
- `formatter/` → General formatters (e.g., color parsing)  
- `HelpingFunctions/` → Helpers (image pickers, utilities)  
- `PriceCalculator/` → Price calculation helpers  
- `Theme/` → App theme setup (colors, typography, components)  
- `UrlHandler/` → URL/routing helpers  
- `Widgets/` → Reusable UI components  

### `lib/Features/`
Feature-oriented modules, each with Data, Domain, and Presentation layers:
- **AdminsPanel/** → Admin screens and controllers  
- **Auth/** → Authentication flows with BLoC + repositories  
- **Categories/** → Category-based views  
- **Navigation/** → Store, wishlist, settings, home (with state management)  
- **OnBoardingScreen/** → Onboarding flow  
- **ProductDetails/** → Product listing, details, reviews  
- **Settings/** → Profile, addresses, cart, checkout, orders  
- **Widgets/** → Feature-specific reusable widgets  

---

## 🏗️ Architecture

This project follows **Clean Architecture** principles:

- **Data Layer** → APIs, Firebase, local storage  
- **Domain Layer** → Repositories, Entities, Use Cases  
- **Presentation Layer** → UI screens, BLoC/controllers, Widgets  

> ✅ Promotes reusability, testability, and scalability for future features.

---

## 🚀 Getting Started

### 1. Clone the repository
```bash
git clone https://github.com/MuneebDevss/flutter-ecommerce-store.git
cd Flutter-EcommerceApp
