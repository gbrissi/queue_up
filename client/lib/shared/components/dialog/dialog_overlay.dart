import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_up/shared/components/dialog/dialog_provider.dart';

class DialogOverlay extends StatelessWidget {
  final Widget child;
  final List<DialogOption> options;
  const DialogOverlay({super.key, required this.child, required this.options});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DialogProvider>(
      create: (_) => DialogProvider(options),
      child: _DialogOverlayImpl(child: child),
    );
  }
}

class _DialogOverlayImpl extends StatefulWidget {
  final Widget child;
  const _DialogOverlayImpl({required this.child});

  @override
  State<_DialogOverlayImpl> createState() => _DialogOverlayState();
}

class _DialogOverlayState extends State<_DialogOverlayImpl>
    with SingleTickerProviderStateMixin {
  late final _dlgProvider = context.read<DialogProvider>();
  final _overlayController = OverlayPortalController();

  void updateOverlay() {
    if (_dlgProvider.showDialog && !_overlayController.isShowing) {
      _overlayController.show();
    }

    if (!_dlgProvider.showDialog && _overlayController.isShowing) {
      // TODO: Update animation
      // _controller.reverse();
      _overlayController.hide();
    }
  }

  @override
  void initState() {
    _dlgProvider.addListener(updateOverlay);
    super.initState();

    // Animation settings
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _dlgProvider.removeListener(updateOverlay);
    super.dispose();
  }

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: _overlayController,
      child: widget.child,
      overlayChildBuilder: (_) {
        return FadeTransition(
          opacity: _animation,
          child: _DialogLayout(
            child: Selector<DialogProvider, DialogOption>(
              selector: (_, provider) => provider.currentOption,
              builder: (_, data, __) => data.content,
            ),
          ),
        );
      },
    );
  }
}

class _DialogLayout extends StatelessWidget {
  final Widget child;
  const _DialogLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<DialogProvider>();
    return Stack(
      children: [
        Container(color: Colors.black.withValues(alpha: 0.5)),
        Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: IconButton(
                        iconSize: 16,
                        splashRadius: 24,
                        onPressed: () => controller.hide(),
                        icon: Icon(Icons.close),
                      ),
                    ),
                    child,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DialogContent extends StatelessWidget {
  final List<Widget> children;
  final List<Widget>? actions;
  final String title;
  final String subtitle;
  const DialogContent({
    super.key,
    required this.children,
    required this.title,
    required this.subtitle,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          SizedBox(height: 12),
          ...children,
          if (actions != null) ...[
            SizedBox(height: 24),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: actions!),
          ],
        ],
      ),
    );
  }
}
