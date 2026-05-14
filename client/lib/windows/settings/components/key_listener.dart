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
    final ColorScheme cs = Theme.of(context).colorScheme;
    return _AnimatedColorBox(
      enabled: isCapturing,
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      standardColor: cs.onSurface,
      animatedColor1: cs.onSurface,
      animatedColor2: cs.primary,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: cs.surface,
            borderRadius: BorderRadius.circular(4),
          ),
          width: double.infinity,
          child: Center(
            child: Text.rich(
              TextSpan(
                style: TextStyle(color: !isCapturing ? null : Colors.white),
                children: [TextSpan(text: _strKeys.join(' + '))],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedColorBox extends StatefulWidget {
  const _AnimatedColorBox({
    required this.standardColor,
    required this.animatedColor1,
    required this.animatedColor2,
    required this.enabled,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
  });

  final bool enabled;
  final Color standardColor;
  final Color animatedColor1;
  final Color animatedColor2;
  final BorderRadius borderRadius;
  final Widget child;

  @override
  State<_AnimatedColorBox> createState() => __AnimatedColorBoxState();
}

class __AnimatedColorBoxState extends State<_AnimatedColorBox>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    colorAnimation = ColorTween(
      begin: widget.animatedColor1,
      end: widget.animatedColor2,
    ).animate(controller);

    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: colorAnimation,
      builder: (_, __) {
        return Container(
          decoration: BoxDecoration(
            color: widget.enabled ? colorAnimation.value : widget.standardColor,
            borderRadius: widget.borderRadius,
          ),
          child: widget.child,
        );
      },
    );
  }
}
