# Acoursa - Flutter Application

<p align="center">
  <img src="assets/images/app_logo.png" alt="Acoursa" width="180"/>
</p>

<p align="center">
AI-powered online exam proctoring application built with Flutter.
</p>

---

## 📖 Overview

Proctor AI is a mobile application that enables students to securely take online examinations while being monitored by an AI-powered proctoring system.

The Flutter application provides an intuitive user interface for authentication, exam management, real-time camera monitoring, and communication with the backend services.

The AI analysis is performed by external services while the Flutter application captures and streams the required data.

---

## ✨ Features

- 📷 Camera Integration
- 🎥 Real-time Video Streaming
- 🤖 AI Monitoring Integration
- ⚠️ Live Violation Detection
- 📊 Exam Result Screen
- 🌐 REST API Integration
- 📱 Responsive UI

---

## 🏗️ Architecture

The application follows **MVVM Architecture** principles to ensure scalability, maintainability, and separation of concerns.

```
lib/
│
├── core/
│   ├── constants/
│   ├── services/
│   ├── API/
│   ├── Routing/
│   ├── Data/
|   ├── Shred_Widgets/
|   ├── Validations
|   └── Data/
│ 
├── features/
│   ├── authentication/
│   ├── home/
│   ├── exams/
│   ├── camera/
│   ├── monitoring/
│   ├── profile/
│   └── results/
│
├── acoursa_app.dart
└── main.dart
```

---

## 🧠 AI Monitoring

The Flutter application communicates with the AI backend to monitor the student during the exam.

Detected violations may include:

- Face Not Detected
- Multiple Faces
- Looking Away
- Eyes Closed
- Yawning
- Leaving the Exam
- Suspicious Activity

---

## 🛠️ Tech Stack

### Framework

- Flutter
- Dart

### State Management

- BLoC / Cubit

### Backend Communication

- REST API
- HTTP

### Local Storage

- SharedPreferences

### Camera

- camera package

### Networking

- HTTP

---

## 📦 Packages

Some of the main packages used in the project:

- flutter_bloc
- http
- shared_preferences
- camera
- image_picker
- permission_handler
- equatable
- flutter_screenutil
- cached_network_image
- google_ml_kit

---

## 🚀 Getting Started

### Clone the repository

```bash
git clone https://github.com/pgd8/acoursa.git
```

### Navigate to the project

```bash
cd acoursa
```

### Install dependencies

```bash
flutter pub get
```

### Run the application

```bash
flutter run
```

---

## 🔧 Configuration

Create the required configuration files before running the application.

Examples include:

- API Base URL
- Authentication Tokens
---

## 📱 Screens

The application contains the following screens:

- Splash
- Login
- Register
- Home
- Available Courses
- Enrolled Courses
- Course Details
- Camera Permission
- Live Monitoring
- Exam Questions
- Submission
- Grades
---

## 🔄 Application Flow

```
Login
   │
   ▼
Home
   │
   ▼
Select Exam
   │
   ▼
Exam Instructions
   │
   ▼
Camera Check
   │
   ▼
Start Monitoring
   │
   ▼
Take Exam
   │
   ▼
Submit
   │
   ▼
Results
```

---

## 🔒 Permissions

The application requires:

- Camera
- network

---

## 👨‍💻 Development Principles

- MVVM Architecture
- SOLID Principles
- BLoC State Management
- Feature-based Folder Structure
- Reusable Components

---

## 🤝 Contributors

- **Abdelrahman Hamdi** — Flutter Developer
---