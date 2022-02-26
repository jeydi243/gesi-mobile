enum RoleUtilisateurs {
  Academique,
  Administratif,
  AdministrateurBudget,
  Caissier,
  Etudiant,
  Professeur,
  ResponsableBibliotheque,
  Administrateur,
  SuperAdministrateur,
}

class User {
  late String username;
  late String password;
  late List<String> role;
  User.gt();

  User({required this.password, required this.username, required this.role});
  User.from(Map<String, dynamic> map) {
    username = map["username"];
    password = map["password"];
  }
}
