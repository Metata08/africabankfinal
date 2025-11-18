import 'package:africa_bank/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: "SETTINGS",
        showMenu: true,
        showBack: true,
        onMenu: () => _scaffoldKey.currentState!.openDrawer(),
        onSettings: () {},
      ),
      drawer: buildAppDrawer(context),

      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: w * 0.05,
          vertical: h * 0.02,
        ),
        children: [
          // ----------------- Section GENERAL -----------------
          _sectionTitle("General", w),

          _settingItem(
            context,
            icon: Icons.person,
            title: "Edit Profile",
            w: w,
            h: h,
            onTap: () {},
          ),

          _settingItem(
            context,
            icon: Icons.language,
            title: "Language",
            w: w,
            h: h,
            onTap: () {},
          ),

          _switchItem(
            icon: Icons.dark_mode,
            title: "Dark Mode",
            value: false,
            w: w,
            h: h,
            onChanged: (v) {},
          ),

          SizedBox(height: h * 0.03),

          // ----------------- Section SECURITY -----------------
          _sectionTitle("Security", w),

          _settingItem(
            context,
            icon: Icons.lock,
            title: "Change Password",
            w: w,
            h: h,
            onTap: () {},
          ),

          _switchItem(
            icon: Icons.fingerprint,
            title: "Biometric Login",
            value: true,
            w: w,
            h: h,
            onChanged: (v) {},
          ),

          SizedBox(height: h * 0.04),

          // ----------------- Logout -----------------
          Row(
            children: [
              IconButton(
                onPressed: () => context.go('/'), 
                icon: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red, size: w * 0.07),
                    SizedBox(width: w * 0.03),
                    Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: w * 0.045,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ----------------- Widgets -----------------

  Widget _sectionTitle(String text, double w) {
    return Padding(
      padding: EdgeInsets.only(bottom: w * 0.03),
      child: Text(
        text,
        style: TextStyle(
          fontSize: w * 0.05,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF154478),
        ),
      ),
    );
  }

  Widget _settingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required double w,
    required double h,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: h * 0.018),
      child: Row(
        children: [
          Icon(icon, size: w * 0.065, color: const Color(0xFF154478)),
          SizedBox(width: w * 0.04),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: w * 0.045,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(Icons.navigate_next, size: w * 0.07, color: const Color(0xFF154478)),
        ],
      ),
    );
  }

  Widget _switchItem({
    required IconData icon,
    required String title,
    required bool value,
    required double w,
    required double h,
    required Function(bool) onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: h * 0.018),
      child: Row(
        children: [
          Icon(icon, size: w * 0.065, color: const Color(0xFF154478)),
          SizedBox(width: w * 0.04),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: w * 0.045,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
