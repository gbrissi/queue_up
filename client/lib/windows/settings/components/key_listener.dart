import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:queue_up/extensions/list_extension.dart';

class KeyListener extends StatefulWidget {
  const KeyListener({super.key, this.keys});
  final List<KeyEvent>? keys;

  @override
  State<KeyListener> createState() => _KeyListenerState();
}

class _KeyListenerState extends State<KeyListener> {
  final FocusNode _focusNode = FocusNode();
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

  // TODO: Add max 3 chars
  void _onKeyEvent(KeyEvent event) {
    if (event is KeyUpEvent && isCapturing) {
      // Finish capture
      isCapturing = false;
      _focusNode.unfocus();
    }

    if (event is KeyDownEvent) {
      // Start Capturing
      if (!isCapturing) {
        isCapturing = true;
        _currentKeys = <KeyEvent>[];
      }

      // Update
      final bool isKeyContained = _isKeyContained(_currentKeys, event);
      if (!isKeyContained) {
        _currentKeys = [..._currentKeys, event];
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    _focusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: _onKeyEvent,
      child: InkWell(
        onTap: () => _focusNode.requestFocus(),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Keys: '),
              TextSpan(text: _strKeys.join(' + ')),
            ],
          ),
        ),
      ),
    );
  }
}
