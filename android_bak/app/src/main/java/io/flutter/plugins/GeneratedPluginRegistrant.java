package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.alveliu.flutterfullpdfviewer.FlutterFullPdfViewerPlugin;
import com.github.adee42.keyboardvisibility.KeyboardVisibilityPlugin;
import net.nfet.flutter.printing.PrintingPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    FlutterFullPdfViewerPlugin.registerWith(registry.registrarFor("com.alveliu.flutterfullpdfviewer.FlutterFullPdfViewerPlugin"));
    KeyboardVisibilityPlugin.registerWith(registry.registrarFor("com.github.adee42.keyboardvisibility.KeyboardVisibilityPlugin"));
    PrintingPlugin.registerWith(registry.registrarFor("net.nfet.flutter.printing.PrintingPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
