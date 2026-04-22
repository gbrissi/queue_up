import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/menu_btn.dart';
import 'package:queue_up/shared/components/windows_title_bar/windows_title_bar.dart';

class BaseWindow extends StatefulWidget {
  const BaseWindow({
    super.key,
    required this.child,
    this.enableScroll = true,
    this.enablePadding = true,
    this.showBackButton = false,
  });
  final Widget child;
  final bool enableScroll;
  final bool showBackButton;
  final bool enablePadding;

  @override
  State<BaseWindow> createState() => _BaseWindowState();
}

class _BaseWindowState extends State<BaseWindow> {
  buildChild() {
    Widget newChild = widget.child;

    if (widget.enablePadding) {
      newChild = Padding(padding: const EdgeInsets.all(24), child: newChild);
    }

    if (widget.enableScroll) {
      newChild = ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(child: newChild),
      );
    }

    return newChild;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        elevation: 2,
        shadowColor: Colors.black,
        child: Column(
          children: [
            WindowsTitleBar(),
            Expanded(
              child: Stack(
                children: [
                  LayoutBuilder(
                    builder: (_, constraints) {
                      return SizedBox(
                        height: constraints.maxHeight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.showBackButton)
                              Padding(
                                padding: EdgeInsets.fromLTRB(4, 4, 0, 0),
                                child: BackButton(),
                              ),
                            Expanded(child: buildChild()),
                          ],
                        ),
                      );
                    },
                  ),
                  Positioned(top: 4, right: 4, child: MenuBtn()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
