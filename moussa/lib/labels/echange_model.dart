class Echange {
  final int idEchange;
  final double montantSource;
  final double montantConverti;
  final String deviseSource;
  final String deviseCible;
  final double tauxConversion;
  final DateTime dateEchange;

  Echange({
    required this.idEchange,
    required this.montantSource,
    required this.montantConverti,
    required this.deviseSource,
    required this.deviseCible,
    required this.tauxConversion,
    required this.dateEchange,
  });

  void convertirDevise() {
    // TODO: Implémenter la logique de conversion
  }
}
