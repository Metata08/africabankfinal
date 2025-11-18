import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth  = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            // ------------------ PARTIE HAUTE : 25% ------------------
            Container(
              height: screenHeight * 0.25,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF154478), Color(0xFF154478)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: screenHeight * 0.02),

                  // --- Ligne des 3 icônes ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.account_balance, color: Colors.white, size: 55),
                      SizedBox(width: 20),
                      Icon(Icons.link, color: Colors.white, size: 35),
                      SizedBox(width: 20),
                      Icon(Icons.phone_android, color: Colors.white, size: 50),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.015),

                  const Text(
                    'Connect to your bank account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            // ------------------ PARTIE BASSE : 75% ------------------
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.12),
              child: Column(
                children: [

                  SizedBox(height: screenHeight * 0.04),

                  // -------- Name --------
                  SizedBox(
                    height: screenHeight * 0.065,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Your Name',
                        prefixIcon: const Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // -------- Bank account --------
                  SizedBox(
                    height: screenHeight * 0.065,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Bank Account',
                        prefixIcon: const Icon(Icons.account_balance_wallet_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // -------- Email --------
                  SizedBox(
                    height: screenHeight * 0.065,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // -------- Password --------
                  SizedBox(
                    height: screenHeight * 0.065,
                    child: TextFormField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  // -------- Password guidance --------
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Use 6 characters with a mix of letters,\n numbers & symbols.',
                      style: TextStyle(
                        color: Color(0xFF2EC3EF),
                        fontSize: 13,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  // -------- Terms checkbox --------
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (_) {}, // to activate later
                      ),
                      const Expanded(
                        child: Text(
                          "By signing up, you agree to Bank's Term of Use & Privacy Policy.",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // -------- Buttons SIGNUP / CANCEL --------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.35,
                        height: screenHeight * 0.05,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF154478),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text('SIGN UP', style: TextStyle(color: Colors.white)),
                        ),
                      ),

                      SizedBox(width: screenWidth * 0.04),

                      SizedBox(
                        width: screenWidth * 0.35,
                        height: screenHeight * 0.05,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF154478)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text('CANCEL', style: TextStyle(color: Color(0xFF154478))),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // -------- Already signed up? --------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already signed up? "),
                      TextButton(
                        onPressed: () => context.go('/'),
                        child: Text(
                          "LOG IN",
                          style: TextStyle(
                            color: Color(0xFF2EC3EF),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF2EC3EF),
                            decorationThickness: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.04),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
