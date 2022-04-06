import 'package:hive/hive.dart';
part 'source_model.g.dart';

@HiveType(typeId: 0)
class Source {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: (json["id"] == null) ? "" : json["id"],
        name: json["name"] ?? "",
      );
}
