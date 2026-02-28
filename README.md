# ⏱ Flutter Timer App

A simple and elegant Timer application built using Flutter.  
This project demonstrates state management using `setState`, Dart `Timer`, UI theming with `ColorScheme`, and proper lifecycle handling.

---

## 🚀 Features

- ▶ Start Timer
- ⏸ Pause Timer
- 🔄 Reset Timer
- ⏱ Displays formatted time (HH : MM : SS)
- 🎨 Clean UI using Material 3 ColorScheme
- 🧠 Prevents multiple timers running simultaneously
- 🛑 Proper Timer disposal to avoid memory leaks

---

## 📸 Screenshots
<p align="center">
  <img src="assets/screenshots/timer_running.png" width="250"/>
  <img src="assets/screenshots/timer_paused.png" width="250"/>

</p>

> Place your screenshots inside:
> `assets/screenshots/`

And add them in `pubspec.yaml` if needed.

---

## 🧠 Technical Concepts Used

### 1️⃣ Dart Timer

```dart
Timer.periodic(Duration(seconds: 1), (Timer time) {
  setState(() {
    seconds++;
  });
});
```

- Runs every second
- Updates UI using setState

---

### 2️⃣ Prevent Multiple Timers

```dart
if (!isLoading) {
  startTimer();
}
```

Ensures only one timer runs at a time.

---

### 3️⃣ Proper Disposal

```dart
@override
void dispose() {
  timer?.cancel();
  super.dispose();
}
```

Prevents memory leaks when widget is removed.

---

### 4️⃣ Time Formatting Logic

```dart
String fortmatTimer(int seconds) {
  final hours = seconds ~/ 3600;
  final min = (seconds % 3600) ~/ 60;
  final sec = seconds % 60;

  return '${hours.toString()} : ${min.toString()} : ${sec.toString()}';
}
```

Converts total seconds into HH : MM : SS format.

---

## 🛠 How to Run

```bash
git clone https://github.com/your-username/flutter-timer-app.git
cd flutter-timer-app
flutter pub get
flutter run
```

---

## 📦 Folder Structure

```
lib/
 └── timer_page.dart
```

---

## 🔮 Future Improvements

- Add Countdown Mode
- Add Milliseconds Support
- Convert to BLoC / Cubit Architecture
- Persist timer state in background
- Add unit tests

---

## 👨‍💻 Author

**Arunkumar M**  
Flutter Developer | Mobile App Engineer  

---

⭐ If you found this helpful, consider giving this repo a star!
