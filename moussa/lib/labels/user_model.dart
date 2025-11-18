class Utilisateur {
  final int id;
  final String nom;
  final String email;
  final String motDePasse;
  final String telephone;
  final String adresse;
  final DateTime dateInscription;

  Utilisateur({
    required this.id,
    required this.nom,
    required this.email,
    required this.motDePasse,
    required this.telephone,
    required this.adresse,
    required this.dateInscription,
  });

  void seConnecter() {
    // TODO: Implémenter la logique de connexion
  }

  void seDeconnecter() {
    // TODO: Implémenter la déconnexion
  }

  void modifierProfil() {
    // TODO: Modifier les informations de profil
  }
}
