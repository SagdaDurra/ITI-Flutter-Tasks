# 🍽️ ITI Flutter Project

A Flutter application built as part of my learning journey at **ITI**.

This project is more than just basic UI practice. It includes multiple screens, API integration, state management, authentication, favorites, a payment flow, and a simple AI chatbot integration.

> ⚠️ This is a learning project, so the codebase is still evolving and not everything is production-ready.

---

## 📱 Features

### 🏠 Main App Features

* Splash Screen
* Login & Register screens 🔐
* Home Screen
* Popular Chefs 👨‍🍳
* Chef Details
* Favourite Chefs ❤️
* Menu browsing 🍽️
* Bottom Navigation
* User Profile 👤
* Order Progress tracking 📦
* Payment Screen 💳
* Payment Success Screen ✅

### 🤖 AI Chatbot

The project also includes a chatbot powered by Google's Generative AI.

* Send messages to the chatbot
* Conversation history during the session
* Loading indicator while waiting for a response
* API key stored using `.env` 🔑

---

## 🧠 Technologies Used

* **Flutter & Dart** 💙
* **flutter_bloc** for state management
* **Cubit**
* **HTTP** for API requests 🌐
* **Google Generative AI**
* **flutter_dotenv** for environment variables
* **Carousel Slider**
* **Image Picker** 📷
* **Share Plus**
* **Persistent Bottom Navigation Bar**

---

## 📂 Project Structure

```text
lib/
│
├── Core/
│   ├── AppAPIs/
│   ├── AppColors/
│   └── Images/
│
├── Data/
│   └── Requests/
│
├── Domain/
│   └── Models/
│
└── Presentation/
    ├── Chatbot/
    ├── Cubits/
    ├── Screens/
    └── Widgets/
```

The project is organized into different layers to separate:

* 🎨 UI and presentation
* 🧠 State management
* 🌐 API requests
* 📦 Data models

---

## 🚀 Getting Started

### 1️⃣ Clone the repository

```bash
git clone <(https://github.com/SagdaDurra/ITI-Flutter-Tasks)>
```

### 2️⃣ Install dependencies

```bash
flutter pub get
```

### 3️⃣ Add your environment variables

Create a `.env` file in the root directory:

```env
GEMINI_API_KEY=your_api_key_here
```

### 4️⃣ Run the app

```bash
flutter run
```

---

## ⚠️ Notes

This project was built mainly for learning and practicing Flutter concepts.

There are definitely things that can be improved, including:

* 🧹 Code cleanup and refactoring
* 🏗️ Better architecture consistency
* 🧪 More testing
* ❌ Better error handling
* 🔒 Stronger API key and security handling
* 📱 Better responsiveness across different screen sizes

So yeah, **it's not a perfect production app**, but it represents the concepts and features I've been learning and applying in Flutter.

---

## 🎯 What I Practiced

Through this project, I practiced:

* Building Flutter UI 📱
* Navigation between screens
* Working with APIs 🌐
* State management using Cubit
* Creating reusable widgets
* Handling user interactions
* Using environment variables
* Integrating an AI model 🤖

---

## 📦 Try the App

I've also published a **GitHub Release** so you can download and try the app without building the project yourself. 🚀

👉 Check the **Releases** section of this repository to download the latest version.

---

## 👨‍💻 Author

Built by **Sagda Durra** as part of my Flutter learning journey.

