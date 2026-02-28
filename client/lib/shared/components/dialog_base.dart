import 'package:flutter/material.dart';

class DialogBase extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;
  final List<Widget>? actions;
  const DialogBase({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "New Room",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Create a new room or join one!",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      ...children,
                      if (actions != null) ...[
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: actions!,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
