/*
  Theme toggle: progressive enhancement for the light/dark switch.

  The head script has already applied any stored theme before paint, and the
  server renders no data-theme attribute so light is the default and the no-JS
  fallback; dark is the opt-in override. This handler wires the header button:
  it reflects the current theme in the button's aria state, and on click flips
  <html data-theme>, persists the choice to localStorage under 'omelas-theme'
  (a key distinct from the language gate's 'omelas-lang'), and updates the aria
  label/pressed state. Dependency-free vanilla JS; every localStorage touch is
  wrapped in try/catch so a locked-down browser degrades to a still-usable
  light page.
*/
(function () {
  var KEY = "omelas-theme";
  var btn = document.getElementById("omelas-theme-toggle");
  if (!btn) { return; }

  var root = document.documentElement;

  var LABELS = {
    // Shown while in light mode: tapping switches to dark.
    light: "다크 모드로 전환 (Switch to dark theme)",
    // Shown while in dark mode: tapping switches to light.
    dark: "라이트 모드로 전환 (Switch to light theme)"
  };

  function current() {
    return root.getAttribute("data-theme") === "dark" ? "dark" : "light";
  }

  function reflect(theme) {
    // aria-pressed=true means the dark theme is engaged (light is the default).
    btn.setAttribute("aria-pressed", theme === "dark" ? "true" : "false");
    btn.setAttribute("aria-label", LABELS[theme] || LABELS.light);
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
