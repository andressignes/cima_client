import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

enum PhotoType {
  @JsonValue('materialas')
  material,
  @JsonValue('formafarmac')
  pharmaceuticalProduct,
}

@JsonSerializable()
class Photo extends Equatable {
  Photo({
    required this.type,
    required this.url,
    required this.latestUpdate,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  @JsonKey(name: 'tipo')
  final PhotoType type;
  @JsonKey(name: 'url')
  final Uri url;
  @JsonKey(name: 'fecha')
  final DateTime latestUpdate;

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  @override
  List<Object?> get props => [
        type,
        url,
        latestUpdate,
      ];
}
