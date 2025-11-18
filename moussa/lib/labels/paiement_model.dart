class Paiement {
  final int idPaiement;
  final String typeService;
  final double montant;
  final DateTime datePaiement;
  final String statut;

  Paiement({
    required this.idPaiement,
    required this.typeService,
    required this.montant,
    required this.datePaiement,
    required this.statut,
  });

  void payerFacture() {
    // TODO: Implémenter le paiement
  }

  void annulerPaiement() {
    // TODO: Implémenter l'annulation
  }
}
