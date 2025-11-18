import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showMenu; // Toujours true ici
  final bool showBack; // Dashboard=false, les autres=true
  final VoidCallback? onMenu;
  final VoidCallback? onBack;
  final VoidCallback? onSettings;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showMenu = true, // Menu toujours visible
    this.showBack = false, // Par défaut Dashboard=false
    this.onMenu,
    this.onBack,
    this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF154478),

      leading: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showMenu)
            IconButton(
              icon: const Icon(
                Icons.menu,
                size: 40,
                color: Color(0xFFFCFDFD),
                weight: 200,
              ),
              onPressed: onMenu,
            ),
        ],
      ),

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showBack)
            IconButton(
              icon: const Icon(
                Icons.navigate_before,
                size: 40,
                color: Color(0xFFFCFDFD),
                 weight: 200,
              ),
              onPressed: onBack ?? () => context.go('/home'),
            ),
          Text(
            title,
            style: const TextStyle(color: Color(0xFFFCFDFD), fontSize: 25),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              size: 40,
              color: Color(0xFFFCFDFD),
               weight: 200,
            ),
            onPressed: () => context.go('/settings'),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// --------------------- DRAWER ---------------------
Drawer buildAppDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Color(0xFF154478)),
          child: Text(
            'Menu',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),

        ListTile(
          leading: const Icon(Icons.person),
          title: const Text("ACCOUNT"),
          onTap: () {
            context.go('/account');
          },
        ),

        ListTile(
          leading: const Icon(Icons.credit_card),
          title: const Text("ADD CARD"),
          onTap: () {
            context.go('/addcard');
          },
        ),

        ListTile(
          leading: const Icon(Icons.receipt_long),
          title: const Text("TRANSACTION"),
          onTap: () {
            context.go('/transaction');
          },
        ),

        ListTile(
          leading: const Icon(Icons.payment),
          title: const Text("PAYMENT"),
          onTap: () {
            context.go('/payment');
          },
        ),

        ListTile(
          leading: const Icon(Icons.swap_horiz),
          title: const Text("EXCHANGE"),
          onTap: () {
            // context.go('/exchange');
          },
        ),

        const Divider(),

        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Logout"),
          onTap: () {
            context.go('/');
          },
        ),
      ],
    ),
  );
}
