import 'package:africa_bank/widgets/header.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    Widget buildHtmlField({
      required String label,
      required String placeholder,
      bool obscureText = false,
      int maxLines = 1,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF154478),
            ),
          ),
          // SizedBox(height: screenHeight * 0.005),
          TextFormField(
            obscureText: obscureText,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Color(0xFF6F7A88)),
              hintText: placeholder,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01, horizontal: screenWidth * 0.03
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: "ACCOUNT",
        showMenu: true,
        showBack: true,
        onMenu: () => _scaffoldKey.currentState!.openDrawer(),
        onSettings: () {},
      ),
      drawer: buildAppDrawer(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.08, vertical: screenHeight * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Avatar ---
              Center(
                child: Container(
                  width: screenWidth * 0.2,
                  height: screenWidth * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth),
                    gradient: const LinearGradient(
                      colors: [Color.fromARGB(255, 19, 158, 200), Color(0xFF2EC3EF)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: screenWidth * 0.19,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // --- Formulaire ---
              buildHtmlField(label: 'Your Name', placeholder: 'Alioune NDIAYE'),
              SizedBox(height: screenHeight * 0.01),
              buildHtmlField(label: 'Bank Account', placeholder: '00 123 456'),
              SizedBox(height: screenHeight * 0.01),
              buildHtmlField(label: 'Email', placeholder: 'monemail@gmail.com'),
              SizedBox(height: screenHeight * 0.01),
              buildHtmlField(label: 'Password', placeholder: '**********', obscureText: true),
              SizedBox(height: screenHeight * 0.01),
              buildHtmlField(label: 'Phone Number', placeholder: '+221 77 123 45 67'),
              SizedBox(height: screenHeight * 0.01),
              buildHtmlField(
                  label: 'Your Address',
                  placeholder: 'Avenue Lycée 6, Saint Louis, Senegal',
                  maxLines: 2),
              SizedBox(height: screenHeight * 0.03),

              // --- Bouton ---
              Center(
                child: SizedBox(
                  width: screenWidth * 0.45,
                  height: screenHeight * 0.05,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF154478),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Text(
                      'SAVE CHANGES',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
