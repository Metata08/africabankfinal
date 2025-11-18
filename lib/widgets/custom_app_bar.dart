import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showMenu;
  final bool showBack;
  final VoidCallback? onMenu;
  final VoidCallback? onBack;
  final VoidCallback? onSettings;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showMenu = true,
    this.showBack = false,
    this.onMenu,
    this.onBack,
    this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF154478),

      // -------- BOUTON GAUCHE (BACK ou MENU) --------
      leading: showBack
          ? IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          size: 28,
          color: Colors.white,
        ),
        onPressed: onBack,     // ✔ Pas de navigation par défaut
      )
          : IconButton(
        icon: const Icon(
          Icons.menu,
          size: 32,
          color: Colors.white,
        ),
        onPressed: onMenu,
      ),

      // -------- TITRE --------
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,

      // -------- BOUTON PARAMÈTRES --------
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, size: 28, color: Colors.white),
          onPressed: onSettings ?? () => context.go('/settings'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


// ================================
//          DRAWER GLOBAL
// ================================

Drawer buildAppDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Color(0xFF154478)),
          child: Center(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ),

        ListTile(
          leading: const Icon(Icons.person),
          title: const Text("ACCOUNT"),
          onTap: () => context.go('/account'),
        ),

        ListTile(
          leading: const Icon(Icons.credit_card),
          title: const Text("ADD CARD"),
          onTap: () => context.go('/addcard'),
        ),

        ListTile(
          leading: const Icon(Icons.receipt_long),
          title: const Text("TRANSACTION"),
          onTap: () => context.go('/transaction'),
        ),

        ListTile(
          leading: const Icon(Icons.payment),
          title: const Text("PAYMENT"),
          onTap: () => context.go('/payment'),
        ),

        ListTile(
          leading: const Icon(Icons.swap_horiz),
          title: const Text("EXCHANGE"),
          onTap: () => context.go('/exchange'),
        ),

        const Divider(),

        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Logout"),
          onTap: () => context.go('/'),
        ),
      ],
    ),
  );
}
