// =========================================================
// 🎬 Episode #7: How Top Flutter Apps Use http
// Niche: FLUTTER | Date: 2026-10-19
// Channel: @ridz.creations
// =========================================================

// --- Tutorial Highlights ---
// Junior versus senior Flutter developers handling network requests right now.
// Junior devs write raw http gets directly inside every single widget build.
// Your UI rebuilds constantly and your app crashes when the API fails.
// Here is the messy junior code tightly coupling UI with network calls.

// --- Source Code ---
// --- BEFORE ---
Widget build(BuildContext context) {
  var data = http.get(Uri.parse('url'));
  return Text(data.toString());
}

// --- AFTER ---
class ApiClient {
  Future<User> fetchUser() async {
    final res = await http.get(url);
    return User.fromJson(res.body);
  }
}
