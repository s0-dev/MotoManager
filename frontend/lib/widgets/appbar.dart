import 'package:flutter/material.dart';

// PreferredSizeWidget is an interface that define the size of the widget, this is useful for widgets like appbar, which need to have a specific height to fit properly within the layout of the app.
// You are telling flutter that the widget has a preferred size that can be use by the parent widget (like Scaffold) to determine the space the widget will take
// Scaffold needs to know how much vertical space to allocate for the AppBar.
// Makes it compatible with the build-in AppBar widget.
// If you need to change the height, you can simply change the preferredSize property.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFF1C1B2E);

    return AppBar(
      automaticallyImplyLeading: false,
      leading: Builder(
        builder:
            (context) => IconButton(
              icon: const Icon(Icons.menu_rounded, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
      ),
      centerTitle: true,
      title: Text(title, style: const TextStyle(color: Colors.white)),
      backgroundColor: backgroundColor,
      elevation: 0,
    );
  }

  // You override the preferredSize, you provide your own implementation of the getter.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  // Size.fromHeight(kToolbarHeight)
  // This creates a Size object with a height equal to kToolbarHeight, which is a constant defined in Flutter that represents the standard height of a toolbar (typically 56.0 pixels).
  // the const indicates that is compile-time constant, which helps with performance.
}
