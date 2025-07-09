# 🌿 DailyWellness – Personal Wellness Tracker App

**DailyWellness** is a Flutter-based mobile app designed to help users stay on top of their daily wellness goals. It allows a single user to log in, track health activities (like hydration, meditation, walking), and stay motivated through daily quotes.

---

## 🚀 Project Overview

The purpose of this app is to consolidate and demonstrate proficiency in:

- UI design using Flutter widgets
- Form validation and navigation
- State management with `setState` and `Provider/Riverpod`
- REST API integration using the `http` package
- Unit and widget testing
- Building and releasing a signed APK

---

## 📱 Features

### 1. **Login Screen**
- Email & password input using `TextFormField`
- Form validation (email format, non-empty fields)
- On successful login, navigates to dashboard (no backend auth used)

### 2. **Dashboard Screen**
- Personalized greeting using the entered email
- Displays current date & time
- Hardcoded wellness tasks:
  - Drink Water 💧
  - Meditate 🧘
  - Walk 🚶
- Fetches and displays a motivational quote via API
- Button to add a custom activity

### 3. **Add Activity Screen**
- Form to add a new activity (Activity Name & Notes)
- Validates input before submission
- Returns to dashboard and updates the task list

### 4. **Responsive UI**
- Works in both portrait and landscape modes
- Uses `MediaQuery` and `LayoutBuilder` for layout flexibility

---

## ⚙️ Setup Instructions

### 📦 Prerequisites
- Flutter SDK 3.x
- Android Studio or VS Code
- Dart SDK

### 🔧 Installation

```bash
git clone https://github.com/your-username/DailyWellness.git
cd DailyWellness
flutter pub get
