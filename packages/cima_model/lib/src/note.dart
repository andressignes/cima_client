import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

enum NoteType {
  @JsonValue('1')
  securityNote,
}

@JsonSerializable()
class Note extends Equatable {
  Note({
    required this.type,
    required this.number,
    this.reference,
    this.issue,
    this.publicationDate,
    this.url,
  });

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  @JsonKey(name: 'tipo')
  final NoteType type;
  @JsonKey(name: 'num')
  final String number;
  @JsonKey(name: 'ref')
  final String? reference;
  @JsonKey(name: 'asunto')
  final String? issue;
  @JsonKey(name: 'fecha')
  final DateTime? publicationDate;
  @JsonKey(name: 'url')
  final Uri? url;

  Map<String, dynamic> toJson() => _$NoteToJson(this);

  @override
  List<Object?> get props => [
        type,
        number,
        reference,
        issue,
        publicationDate,
        url,
      ];
}
