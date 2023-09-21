import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? needLeadingPopBack;

  const CommonAppBar({super.key, required this.title, this.needLeadingPopBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: needLeadingPopBack == null
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
