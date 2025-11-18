import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import 'package:go_router/go_router.dart';
// 👈 important !

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool fingerprintEnabled = false;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: CustomAppBar(
        title: "Paramètres",
        showMenu: false,
        showBack: true,
        onBack: () => context.go('/home'),   //  ✔  FINI les erreurs !!
      ),


      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ========== SECTION 1 : PROFIL ==========
            const Text("PROFIL",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            const SizedBox(height: 10),

            _buildCard(children: [
              _buildTile(
                icon: Icons.person,
                title: "Modifier le profil",
                onTap: () {},
              ),
              _divider(),
              _buildTile(
                icon: Icons.lock,
                title: "Changer le mot de passe",
                onTap: () {},
              ),
            ]),

            const SizedBox(height: 25),

            // ========== SECTION 2 : SÉCURITÉ ==========
            const Text("SÉCURITÉ",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            const SizedBox(height: 10),

            _buildCard(children: [
              _switchTile(
                icon: Icons.fingerprint,
                title: "Déverrouillage par empreinte",
                value: fingerprintEnabled,
                onChanged: (val) {
                  setState(() => fingerprintEnabled = val);
                },
              ),
              _divider(),
              _switchTile(
                icon: Icons.notifications,
                title: "Notifications",
                value: notificationsEnabled,
                onChanged: (val) {
                  setState(() => notificationsEnabled = val);
                },
              ),
            ]),

            const SizedBox(height: 25),

            // ========== SECTION 3 : APPLICATION ==========
            const Text("APPLICATION",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            const SizedBox(height: 10),

            _buildCard(children: [
              _switchTile(
                icon: Icons.dark_mode,
                title: "Mode sombre",
                value: darkModeEnabled,
                onChanged: (val) {
                  setState(() => darkModeEnabled = val);
                },
              ),
              _divider(),
              _buildTile(
                icon: Icons.language,
                title: "Langue",
                onTap: () {},
              ),
              _divider(),
              _buildTile(
                icon: Icons.info,
                title: "À propos de l'application",
                onTap: () {},
              ),
            ]),

            const SizedBox(height: 25),

            // ========== DÉCONNEXION ==========
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("SE DÉCONNECTER",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------ WIDGETS ---------------------

  Widget _buildCard({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF154478)),
      title: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 17),
      onTap: onTap,
    );
  }

  Widget _switchTile({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF154478)),
      title: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing: Switch(
        activeColor: const Color(0xFF154478),
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(height: 1, thickness: 0.5),
    );
  }
}
