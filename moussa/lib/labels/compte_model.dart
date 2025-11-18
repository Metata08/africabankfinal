class Compte {
  final int idCompte;
  final String numeroCompte;
  double solde;
  final String devise;
  final DateTime dateCreation;
  final String typeCompte;

  Compte({
    required this.idCompte,
    required this.numeroCompte,
    required this.solde,
    required this.devise,
    required this.dateCreation,
    required this.typeCompte,
  });

  void crediter(double montant) {
    solde += montant;
  }

  void debiter(double montant) {
    solde -= montant;
  }

  double consulterSolde() {
    return solde;
  }
}
