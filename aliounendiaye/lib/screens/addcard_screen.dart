import 'package:africa_bank/widgets/header.dart';
import 'package:flutter/material.dart';

class AddCardScreen extends StatelessWidget {
  AddCardScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // --- Composant texte + input (identique au AccountScreen) ---
    Widget buildFormField({
      required String label,
      required String placeholder,
      bool obscure = false,
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
          SizedBox(height: screenHeight * 0.005),
          TextFormField(
            obscureText: obscure,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: const TextStyle(color: Color(0xFF6F7A88)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.012,
                horizontal: screenWidth * 0.03,
              ),
            ),
          ),
        ],
      );
    }

    // --- Composant texte + Dropdown ---
    Widget buildDropdownField({
      required String label,
      required List<String> items,
      required String initialValue,
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
          DropdownButtonFormField<String>(
            initialValue: initialValue,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.012,
                horizontal: screenWidth * 0.03,
              ),
            ),
            items: items
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {},
          ),
        ],
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: "ADD CARD",
        showMenu: true,
        showBack: true,
        onMenu: () => _scaffoldKey.currentState!.openDrawer(),
        onSettings: () {},
      ),

      drawer: buildAppDrawer(context),
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.09,
            right: screenWidth * 0.09,
            top: screenHeight * 0.01,
            bottom: screenHeight * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // --- Icone carte ---
              Container(
                height: screenHeight * 0.20,
                color: const Color(0xFFFCFDFD),
                child: Center(
                  child: Icon(
                    Icons.credit_card_rounded,
                    color: const Color(0xFF2EC3EF),
                    size: screenHeight * 0.20,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.01),

              // --- Your Name ---
              buildFormField(
                label: "Your Name",
                placeholder: "Name on Card",
              ),
              SizedBox(height: screenHeight * 0.01),

              // --- Card Number ---
              buildFormField(
                label: "Card Number",
                placeholder: "INSERT YOUR CARD NUMBER",
              ),
              SizedBox(height: screenHeight * 0.01),

              // --- Expired Date ---
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Expired Date",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF154478),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Day
                  SizedBox(
                    width: screenWidth * 0.20,
                    child: buildDropdownField(
                      label: "Day",
                      initialValue: "1",
                      items: List.generate(31, (i) => "${i + 1}"),
                    ),
                  ),

                  // Month
                  SizedBox(
                    width: screenWidth * 0.36,
                    child: buildDropdownField(
                      label: "Month",
                      initialValue: "January",
                      items: const [
                        'January','February','March','April','May','June',
                        'July','August','September','October','November','December'
                      ],
                    ),
                  ),

                  // Year
                  SizedBox(
                    width: screenWidth * 0.25,
                    child: buildDropdownField(
                      label: "Year",
                      initialValue: "2025",
                      items: List.generate(15, (i) => "${2025 + i}"),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.01),

              // --- Password ---
              buildFormField(
                label: "Password",
                placeholder: "********",
                obscure: true,
              ),
              SizedBox(height: screenHeight * 0.01),

              // --- Phone Number ---
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: buildDropdownField(
                      label: "Code",
                      initialValue: "+221",
                      items: const ["+221", "+44", "+1", "+33"],
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    flex: 4,
                    child: buildFormField(
                      label: "Phone Number",
                      placeholder: "123 456 789",
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),

              // --- Bouton ---
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
                  child: const Text(
                    "LINK CARD",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
