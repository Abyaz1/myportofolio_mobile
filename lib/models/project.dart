import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

// Model proyek portofolio yang disinkronkan dengan API Django REST Framework
@JsonSerializable(fieldRename: FieldRename.snake)
class Project {
  const Project({
    this.id,
    required this.title,
    required this.description,
    required this.techStack,
    required this.projectUrl,
    this.projectImageUrl = '',
  });

  // Mengonversi payload JSON dari API menjadi objek Project
  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;
  final String title;
  final String description;
  final String techStack;
  final String projectUrl;

  @JsonKey(defaultValue: '')
  final String projectImageUrl;

  // Mengonversi objek Project menjadi format JSON untuk dikirim ke API
  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
