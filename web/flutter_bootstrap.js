{{flutter_js}}
{{flutter_build_config}}

// Serve CanvasKit and fallback fonts from this site, so visitors contact no third party.
// tool/fetch_web_fonts.py fills fonts/ after `flutter build web`.
_flutter.loader.load({
  config: {
    canvasKitBaseUrl: "canvaskit/",
    fontFallbackBaseUrl: "fonts/",
  },
});
