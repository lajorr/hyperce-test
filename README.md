# hyperce_test

A Flutter project showcasing clean architecture and state management

## Flutter Environment

**Flutter version** 3.35.5 on channel stable

**Upstream repository** https://github.com/flutter/flutter.git

**Dart version** 3.9.2

**DevTools version** 2.48.0

## Getting Started

### Clone the project

```bash
  git clone https://github.com/lajorr/hyperce_test.git
```

```bash
  cd hyperce_test
```

### Install Dependencies

```bash
  flutter pub get
```

### Generate Code

```bash
  dart run build_runner build -d
```

## Firebase setup

#### Place the file in the following locations:

- google-services.json -> android/app/

#### Install FlutterFire ClI:

```bash
  dart pub global activate flutterfire_cli
```

#### Generate firebase_options.dart file:

```bash
  flutterfire configure
```

### Run the App

```bash
  flutter run
```

## Tech Stack

**State Management** – Bloc / Cubit

**Dependency Injection** – get_it + injectable

**Code Generation** – Freezed, JsonSerializable

**Navigation** – GoRouter

**Architecture** – Clean Architecture
