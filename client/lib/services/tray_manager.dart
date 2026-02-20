// Encapsulates the whole tray system behavior
import 'package:tray_manager/tray_manager.dart';

class TrayService {
  static final iconPath = 'assets/images/logo_circle.ico';
  static final Menu menu = Menu(
    items: [
      MenuItem(key: 'show_window', label: 'Show Window'),
      // TODO:
      // MenuItem.checkbox(
      //   checked: true,
      //   key: 'toggle_widget',
      //   label: 'Toggle Widget',
      // ),
      MenuItem.separator(),
      MenuItem(key: 'exit_app', label: 'Exit App'),
    ],
  );

  static init() async {
    await trayManager.setIcon(iconPath);
    await trayManager.setToolTip('Queue Up!');
    await trayManager.setContextMenu(menu);
  }
}
