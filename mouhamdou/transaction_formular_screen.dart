import 'package:flutter/material.dart';

class TransactionFormScreen extends StatefulWidget {
  const TransactionFormScreen({Key? key}) : super(key: key);

  @override
  _TransactionFormScreenState createState() => _TransactionFormScreenState();
}

class _TransactionFormScreenState extends State<TransactionFormScreen> {
  // Variables pour gérer l'état des dropdowns
  String? _selectedAccount;
  String _selectedCurrency = '\$';

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF154478);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF154478),
        elevation: 0,
        //  icon de navigation de retour dans l'application
        leading: Row(
          children: [
            const Icon(Icons.chevron_left, color: Colors.white, size: 40,),
          ],
        ),
        title: const Text(
          'TRANSACTION',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Icône de transaction alignée avec  un billet de banque
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.payments,
                  size: 150,
                  color: primaryBlue,
                ),
                const Icon(
                  Icons.swap_horiz_rounded,
                  size: 150,
                  color: primaryBlue,
                )
              ],
            ),

            // Champ "From Bank Account"
            const Text('From Bank Account',
                style:
                    TextStyle(color: primaryBlue, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(

                hintText: '0D 123 456',
                hintStyle: TextStyle(color: Color(0xFF8F9EAB)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryBlue, width: 3.0),
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryBlue, width: 3.0),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Champ "To Bank Account"
            const Text('To Bank Account',
                style:
                    TextStyle(color: primaryBlue, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: primaryBlue, width: 3.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              value: _selectedAccount,
              hint: const Text('SELECT'),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedAccount = newValue;
                });
              },
              items: <String>['Ecobank', 'SGB', 'Bicis']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Champ "Amount"
            const Text('Amount',
                style:
                    TextStyle(color: primaryBlue, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                // Dropdown pour la devise
                SizedBox(
                  width: 80,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: primaryBlue, width: 3.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    value: _selectedCurrency,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCurrency = newValue!;
                      });
                    },
                    items: <String>['\$', '€', '£']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                            child: Text(value,
                                style: const TextStyle(fontSize: 18))),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 10),
                // Champ pour le montant
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: primaryBlue, width: 3.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    initialValue: '2,195.00',
                    textAlign: TextAlign.right,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Champ "Messages"
            const Text('Messages',
                style:
                    TextStyle(color: primaryBlue, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: primaryBlue, width: 3.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              // maxLines: 4,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),

            // Boutons d'action
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Bouton SEND
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('SEND',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('or', style: TextStyle(color: Colors.grey)),
                ),
                // Bouton CANCEL
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: primaryBlue, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        // taille de la bordure
                      ),
                    ),
                    child: Text('CANCEL',
                        style: TextStyle(
                          color: Colors.red,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
