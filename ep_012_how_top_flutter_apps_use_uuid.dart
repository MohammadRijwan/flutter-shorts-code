// =========================================================
// 🎬 Episode #12: How Top Flutter Apps Use uuid
// Niche: FLUTTER | Date: 2026-10-21
// Channel: @ridz.creations
// =========================================================

// --- Tutorial Highlights ---
// [Tom]: Arrey yaar, mere Flutter app mein id clash kyun ho raha hai?
// [Jerry]: Tom bhai, kyunki tum random string ya timestamp se ID generate kar rahe ho!
// [Tom]: Toh kya karu? Database mein data duplicate ho jata hai aur app hang hota hai.
// [Jerry]: Tumhe uuid package use karna chahiye jo mathematically unique IDs generate karta hai.

// --- Source Code ---
// --- BEFORE ---
String id = DateTime.now().toString();
// Problem: duplicate IDs on fast taps

// --- AFTER ---
var uuid = Uuid();
String uniqueId = uuid.v4();
