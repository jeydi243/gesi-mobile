import 'package:gesi_mobile/models/parts.dart';

class Course {
  String name;
  String description;
  List<String> tags;
  List<String> images;
  List<String> authors;
  List<Part> parts;

  Course(this.name, this.description, this.tags, this.images, this.authors,
      this.parts);
}
