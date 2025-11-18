import 'compte_model.dart';

class Carte {
  final int idCarte;
  final String numeroCarte;
  final String nomProprietaire;
  final DateTime dateExpiration;
  final int cvv;
  final String typeCarte;
  final String banqueEmettrice;
  Compte? compteLie;

  Carte({
    required this.idCarte,
    required this.numeroCarte,
    required this.nomProprietaire,
    required this.dateExpiration,
    required this.cvv,
    required this.typeCarte,
    required this.banqueEmettrice,
    this.compteLie,
  });

  void lierCompte(Compte compte) {
    compteLie = compte;
  }

  void supprimerCarte() {
    compteLie = null;
  }
}
