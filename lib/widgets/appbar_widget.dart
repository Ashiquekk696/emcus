import 'package:emcus/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final bool showDrawer;
  final List<Widget>? actions;
  final Color backgroundColor;
  final void Function()? onPressed;

  const AppTopBarWidget({
    super.key,
    this.showBackButton = false,
    this.showDrawer = false,
    this.actions,
    this.backgroundColor = Colors.white,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.appbarRed.withOpacity(1),
              AppColors.appbarRed2.withOpacity(0.8),
            ],
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: showDrawer
              ? Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu_sharp, color: AppColors.white),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                )
              : showBackButton
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  : null,
          title: Image.asset(
            "assets/images/emcus_horizontal.png",
            height: 35,
          ),
          centerTitle: true,
          actions: [
            ...?actions,
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: AppColors.white),
              onSelected: (value) {
                if (value == 'logout') {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Logout"),
                      content: const Text("Are you sure you want to logout?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // close the dialog
                            onPressed
                                ?.call(); // call the passed logout function
                          },
                          child: const Text("Logout"),
                        ),
                      ],
                    ),
                  );
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'logout',
                  child: Text("Logout"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
