# 🚀 Ultimate Developer Cheat Sheet & Quick Reference Guide
*Curated by Ridz Creations (@ridz.creations) & Mohammad Rijwan Khan | Daily Code & App Architecture Tips*

---

## 📱 Part 1: Flutter & Dart Superpower Tricks

### 1. ⚡ High-Performance Rendering (`RepaintBoundary`)
Avoid rebuilding heavy widget trees when animating a single child.
```dart
RepaintBoundary(
  child: AnimatedBuilder(
    animation: _controller,
    builder: (context, child) => Transform.rotate(
      angle: _controller.value * 2.0 * math.pi,
      child: child,
    ),
    child: const HeavyComplexWidget(),
  ),
)
```
*💡 Benefit: Isolates the animation redraw to GPU layer, keeping FPS locked at 60/120.*

---

### 2. 🎯 Micro-Animations Without Controllers (`TweenAnimationBuilder`)
Animate scale, opacity, or colors in 5 lines without managing `AnimationController` or `dispose()`.
```dart
TweenAnimationBuilder<double>(
  tween: Tween(begin: 0.8, end: 1.0),
  duration: const Duration(milliseconds: 400),
  curve: Curves.easeOutBack,
  builder: (context, scale, child) {
    return Transform.scale(scale: scale, child: child);
  },
  child: const ActionButton(),
)
```

---

### 3. 🛡️ Safe Async Handling & Context Mounting
Never call `Navigator` or `ScaffoldMessenger` across async gaps without mounting check:
```dart
Future<void> submitOrder() async {
  final result = await apiService.checkout();
  if (!mounted) return; // Prevents context deallocation crash
  Navigator.pushNamed(context, '/success');
}
```

---

### 4. 🗂️ Clean Dart Extensions
Enhance existing Flutter types with clean readable shortcuts:
```dart
extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  
  void showSnack(String msg) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(msg)));
  }
}

// Usage: context.showSnack("Saved!");
```

---

### 5. 💎 ValueNotifier Lightweight State Management
No complex packages needed for simple reactive UI:
```dart
final ValueNotifier<int> counter = ValueNotifier<int>(0);

ValueListenableBuilder<int>(
  valueListenable: counter,
  builder: (context, value, child) {
    return Text('Count: $value');
  },
)
```

---

## 🐍 Part 2: Top Python Automation Hacks

### 1. 📁 Instant File Organizer by Extension
Automatically sort messy Download folders in 5 lines:
```python
import os, shutil, pathlib

p = pathlib.Path("./Downloads")
for f in p.iterdir():
    if f.is_file():
        ext_folder = p / f.suffix[1:].upper()
        ext_folder.mkdir(exist_ok=True)
        shutil.move(f, ext_folder / f.name)
```

### 2. 🌐 Quick JSON API Fetch with Auto-Retry
```python
import requests
from requests.adapters import HTTPAdapter
from urllib3.util import Retry

session = requests.Session()
retries = Retry(total=3, backoff_factor=1, status_forcelist=[502, 503, 504])
session.mount('https://', HTTPAdapter(max_retries=retries))

data = session.get("https://api.github.com/users/MohammadRijwan").json()
print("Public Repos:", data.get("public_repos"))
```

---

## 🔗 Official Links & Community
- **GitHub Repository (All Daily Reel Codes):** [https://github.com/MohammadRijwan/flutter-shorts-code](https://github.com/MohammadRijwan/flutter-shorts-code)
- **Instagram:** [@ridz.creations](https://instagram.com/ridz.creations)
- **YouTube:** [@ridzcreations (Ridz Creations)](https://youtube.com/@ridzcreations)
- **Facebook:** [Flutter Short](https://facebook.com)
- **LinkedIn:** [Mohammad Rijwan Khan](https://linkedin.com)
- **Telegram Channel:** [@fluttershort](https://t.me/fluttershort)

*Keep coding, keep building!*
