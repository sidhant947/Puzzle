{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    const appRunner = await engineInitializer.initializeEngine();
    await appRunner.runApp();
    const loader = document.getElementById('loading');
    if (loader) {
      loader.style.opacity = '0';
      loader.style.transition = 'opacity 0.2s ease';
      setTimeout(function() {
        if (loader.parentNode) {
          loader.parentNode.removeChild(loader);
        }
      }, 200);
    }
  }
});
