import 'package:flutter/material.dart';
import 'package:africa_bank/widgets/header.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: "PAYMENT",
        showMenu: true,
        showBack: true,
        onMenu: () => _scaffoldKey.currentState!.openDrawer(),
        onSettings: () {},
      ),

      drawer: buildAppDrawer(context),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: screenHeight * 0.05,
        
          children: [
            Container(
              color: Color(0xFF154478),
              height: screenHeight * 0.20,
              padding: EdgeInsets.only(left: screenWidth*0.05),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: screenWidth * 0.05,
                children: [
                  Container(
                    width: screenHeight * 0.15,
                    height: screenHeight * 0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFCFDFD), Color(0xFFFCFDFD)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Icon(
                      Icons.person,
                      size: screenHeight * 0.14,
                      color: Color(0xFF154478),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: screenWidth*0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'BALANCE',
                          style: TextStyle(
                            color: Color(0xFF2EC3EF),
                            fontSize: 14,
                            letterSpacing: 1.5,
                          ),
                        ),
                        Text(
                          '\$4,180.20',
                          style: TextStyle(
                            color: Color(0xFFFCFDFD),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: screenWidth*0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: screenHeight*0.05,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildPaymentItem(
                        icon: Icons.water_drop,
                        label: "Water",
                        backgroundColor: Color(0xFF18B3E6),
                        size: screenWidth * 0.2,
                      ),
                      buildPaymentItem(
                        icon: Icons.lightbulb,
                        label: "Electricity",
                        backgroundColor: Color(0xFFFBAD08),
                        size: screenWidth * 0.2,
                      ),
                      buildPaymentItem(
                        icon: Icons.local_fire_department_sharp,
                        label: "Gas",
                        backgroundColor: Color(0xFFFA523E),
                        size: screenWidth * 0.2,
                      ),
                    ],
                  ),
              
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildPaymentItem(
                        icon: Icons.shopping_bag,
                        label: "Shopping",
                        backgroundColor: Color(0xFFEA617B),
                        size: screenWidth * 0.2,
                      ),
                      buildPaymentItem(
                        icon: Icons.phone_android,
                        label: "Phone",
                        backgroundColor: Color(0xFF5F5BFA),
                        size: screenWidth * 0.2,
                      ),
                      buildPaymentItem(
                        icon: Icons.credit_card,
                        label: "Credit Card",
                        backgroundColor: Color(0xFF0F7C76),
                        size: screenWidth * 0.2,
                      ),
                    ],
                  ),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildPaymentItem(
                        icon: Icons.security,
                        label: "Insurance",
                        backgroundColor: Color(0xFF174175),
                        size: screenWidth * 0.2,
                      ),
                      buildPaymentItem(
                        icon: Icons.home,
                        label: "Mortgage",
                        backgroundColor: Color(0xFF5F5BFA),
                        size: screenWidth * 0.2,
                      ),
                      buildPaymentItem(
                        icon: Icons.receipt_long_outlined,
                        label: "Other Bills",
                        backgroundColor: Color(0xFF4E5A6F),
                        size: screenWidth * 0.2,
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: screenWidth*0.05),
                        child: TextButton(
                          onPressed: (){}, 
                          child: Text('more>>', style: TextStyle(color: Color(0xFF18B3E6)),)
                        ),
                      ),
                    ]
                  )
              
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Construction des items
  Widget buildPaymentItem({
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required double size,
  }) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [backgroundColor, backgroundColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Icon(
            icon,
            size: size * 0.60,
            color: Color(0xFFFCFDFD),
          ),
        ),
        SizedBox(height: size*0.05),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

}
