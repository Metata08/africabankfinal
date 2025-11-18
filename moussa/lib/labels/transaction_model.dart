class Transaction {
  final int idTransaction;
  final String type;
  final double montant;
  final DateTime dateTransaction;
  final String statut;
  final String description;

  Transaction({
    required this.idTransaction,
    required this.type,
    required this.montant,
    required this.dateTransaction,
    required this.statut,
    required this.description,
  });

  void effectuer() {
    // TODO: Implémenter la logique de transaction
  }

  void annuler() {
    // TODO: Implémenter l'annulation
  }
}
