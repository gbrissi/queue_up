import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyListener extends StatefulWidget {
  const KeyListener({super.key, this.keys, this.maxKeys = 3});
  final List<KeyEvent>? keys;
  final int maxKeys;

  @override
  State<KeyListener> createState() => _KeyListenerState();
}

class _KeyListenerState extends State<KeyListener> {
  // final FocusNode _focusNode = FocusNode();
  late List<KeyEvent> _currentKeys = <KeyEvent>[] = widget.keys ?? <KeyEvent>[];
  bool isCapturing = false;

  bool _isKeyContained(List<KeyEvent> keys, KeyEvent key) {
    for (int i = 0; i < keys.length; i++) {
      if (keys[i].logicalKey.keyId == key.logicalKey.keyId) return true;
    }

    return false;
  }

  List<String> get _strKeys =>
      _currentKeys.map((e) => e.logicalKey.keyLabel).toList();

  void _onKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      // Start Capturing
      if (!isCapturing) {
        startCapture();
        _currentKeys = <KeyEvent>[];
        setState(() {});
      }

      // Update
      final bool isKeyContained = _isKeyContained(_currentKeys, event);
      if (!isKeyContained) {
        _currentKeys = [..._currentKeys, event];
        setState(() {});
      }
    }

    // End Capturing
    if ((event is KeyUpEvent && isCapturing) ||
        (_currentKeys.length == widget.maxKeys)) {
      dismissCapture();
    }
  }

  void startCapture() {
    isCapturing = true;
    setState(() {});
  }

  void dismissCapture() {
    isCapturing = false;
    setState(() {});
  }

  bool _hkHandler(KeyEvent e) {
    if (e.logicalKey == LogicalKeyboardKey.escape) {
      return false;
    } else {
      _onKeyEvent(e);
      return true;
    }
  }

  @override
  void initState() {
    super.initState();
    HardwareKeyboard.instance.addHandler(_hkHandler);
  }

  @override
  void dispose() {
    super.dispose();
    HardwareKeyboard.instance.removeHandler(_hkHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color:
            !isCapturing
                ? Theme.of(context).colorScheme.surfaceContainerHigh
                : Theme.of(context).colorScheme.primary,
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: !isCapturing ? null : Colors.white),
          children: [
            TextSpan(text: 'Keys: '),
            TextSpan(text: _strKeys.join(' + ')),
          ],
        ),
      ),
    );
  }
}
