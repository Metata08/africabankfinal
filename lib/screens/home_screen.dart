// home_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // ------------------ PARTIE HAUTE : 55% ------------------
            Container(
              height: screenHeight * 0.53,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  colors: [Color(0xFF154478), Color(0xFF154478)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WELCOME !',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  // SizedBox(height: 20),
                  Icon(Icons.account_balance, color: Colors.white, size: screenHeight*0.55*0.6),
                ],
              ),
            ),

            // ------------------ PARTIE BASSE : 45% ------------------
            SizedBox(
              height: screenHeight * 0.47,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.05),

                    // -------- Username --------
                    SizedBox(
                      height: screenHeight * 0.07,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Username or E-mail',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.01),

                    // -------- Password --------
                    SizedBox(
                      height: screenHeight * 0.07,
                      child: TextFormField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.01),

                    // -------- LOGIN button --------
                    SizedBox(
                      height: screenHeight * 0.04,
                      width: screenWidth * 0.35,
                      child: ElevatedButton(
                        onPressed: () {
                          context.go('/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF154478),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.015),

                    // -------- Forgot Password --------
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xFF2EC3EF),
                          decorationColor: Color(0xFF2EC3EF),
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.5,
                        ),
                      ),
                    ),

                    // -------- Sign Up --------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("New to AfricaBank? "),
                        TextButton(
                          onPressed: () => context.go('/signup'),
                          child: const Text(
                            "Sign Up",
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
