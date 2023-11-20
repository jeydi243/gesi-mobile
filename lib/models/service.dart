class StudentService {
  String code;
  String icon;
  String id;
  String name;
  String organization_id;
  String website;
  String description;
  String availibility;
  Map<String, dynamic> contacts;

  StudentService(this.icon, this.id, this.code, this.name, this.organization_id,
      this.description, this.contacts, this.availibility, this.website);
}
