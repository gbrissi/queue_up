import 'package:flutter/material.dart';

class DialogOption {
  final String name;
  final Widget content;
  DialogOption({required this.name, required this.content});
}

class DialogProvider extends ChangeNotifier {
  bool _showDialog = false;
  bool get showDialog => _showDialog;
  late final List<DialogOption> _dlgOptions;
  late DialogOption currentOption;
  DialogProvider(List<DialogOption> options) {
    _dlgOptions = options;
    currentOption = options[0];
  }

  void show({required String name}) {
    _showDialog = true;
    // TODO: Add where or null
    _dlgOptions.where((e) => e.name == name);
    notifyListeners();
  }

  void hide() {
    _showDialog = false;
    notifyListeners();
  }
}
