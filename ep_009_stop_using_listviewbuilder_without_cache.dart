// =========================================================
// 🎬 Episode #9: Stop Using ListView.builder Without cacheExtent
// Niche: FLUTTER | Date: 2026-10-19
// Channel: @ridz.creations
// =========================================================

// --- Tutorial Highlights ---
// Why your Flutter app stutters during fast scrolling!
// Using standard ListView builder without cacheExtent creates invisible frame drops.
// Every time you flick the list, items build from scratch.
// It crushes UI performance and wastes valuable device memory instantly.

// --- Source Code ---
// --- BEFORE ---
ListView.builder(
  itemCount: 100,
  itemBuilder: (context, index) {
    return ListItem(index);
  },
)

// --- AFTER ---
ListView.builder(
  cacheExtent: 500.0,
  itemCount: 100,
  itemBuilder: (context, index) {
    return ListItem(index);
  },
)
