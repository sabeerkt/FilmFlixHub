class CastModel {
  String? name;
  String? originalName;
  String? profilePath;
  String? charecter;
  String? knowForDepartment;

  CastModel({
    required this.name,
    required this.originalName,
    required this.profilePath,
    required this.charecter,
    required this.knowForDepartment,
  });

factory CastModel.fromJson(Map<String, dynamic> json) {
  return CastModel(
    name: json['name']??"NO Data",
    originalName: json['original_name']??"NO Data",
    profilePath: json['profile_path']??"NO Data",
    charecter: json['character']??"NO Data",
    knowForDepartment: json['known_for_department']??"NO Data",
  );
}

}
