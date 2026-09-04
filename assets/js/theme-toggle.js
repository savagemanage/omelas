/*
  Theme toggle: progressive enhancement for the dark/light switch.

  The head script has already applied any stored theme before paint, and the
  server renders data-theme="dark" as the no-JS fallback. This handler wires the
  header button: it reflects the current theme in the button's aria state, and
  on click flips <html data-theme>, persists the choice to localStorage under
  'omelas-theme' (a key distinct from the language gate's 'omelas-lang'), and
  updates the aria label/pressed state. Dependency-free vanilla JS; every
  localStorage touch is wrapped in try/catch so a locked-down browser degrades
  to a still-usable dark page.
*/
(function () {
  var KEY = "omelas-theme";
  var btn = document.getElementById("omelas-theme-toggle");
  if (!btn) { return; }

  var root = document.documentElement;

  var LABELS = {
    // Shown while in dark mode: tapping switches to light.
    dark: "라이트 모드로 전환 (Switch to light theme)",
    // Shown while in light mode: tapping switches to dark.
    light: "다크 모드로 전환 (Switch to dark theme)"
  };

  function current() {
    return root.getAttribute("data-theme") === "light" ? "light" : "dark";
  }

  function reflect(theme) {
    // aria-pressed=true means the light theme is engaged.
    btn.setAttribute("aria-pressed", theme === "light" ? "true" : "false");
    btn.setAttribute("aria-label", LABELS[theme] || LABELS.dark);
  }

  // Sync the button to whatever theme is actually applied (the head script may
  // have set light before this ran).
  reflect(current());

  btn.addEventListener("click", function () {
    var next = current() === "light" ? "dark" : "light";
    root.setAttribute("data-theme", next);
    reflect(next);
    try { window.localStorage.setItem(KEY, next); } catch (e) {}
  });
})();
