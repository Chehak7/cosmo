# cosmo

Cosmo is a sleek, minimalist e-commerce mobile app built with **Flutter** for browsing and buying premium cosmetics. Designed with a clean, high-end aesthetic, the app focuses on smooth animations, modern UI elements (like glassmorphism and subtle high-contrast moods), and a seamless shopping flow. 

I built this project to practice scalable mobile app architecture, fluid UI transitions, and robust state management.

---

## ✨ Features

* **Premium Visual Experience:** A clean, modern look featuring custom animations and a dynamic splash screen upon launch.
* **Easy Discovery:** Horizontal category selectors and a smooth search system to help find products quickly.
* **Detailed Product Pages:** Rich layouts that cleanly display product descriptions, ingredients, and usage details.
* **Live Shopping Cart:** Real-time item management and price calculations that stay synced across screens.

---

## 🛠️ Tech Stack & Architecture

* **Flutter Framework:** Uses a single Dart codebase to deliver a smooth, high-performance app experience on both iOS and Android.
* **Provider for State Management:** Uses the `Provider` package to broadcast data changes instantly across screens (like live-updating the cart count) without messy prop-drilling.
* **The View Layer (UI):** Keeps screens and custom widgets completely decoupled from data logic; their only job is to display the visual layout and capture user taps.
* **The Provider Layer (Logic):** Acts as the central brain of the app, containing all the rules for calculations, adding items to the cart, or filtering product categories.
* **The Model Layer (Data):** Establishes explicit, clean blueprints for the app's structural objects, strictly defining what properties a `Product` or a `CartItem` must contain.
### Project Layout

```text
lib/
├── models/         # Product, Category, and Cart data structures
├── providers/      # App state and logic (Cart & Product management)
├── views/          # UI Screens (Splash, Home, Product Details, Cart)
└── widgets/        # Reusable UI pieces (Custom buttons, cards, etc.)
