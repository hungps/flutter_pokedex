import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class GithubItemModel {
  GithubItemModel(
    this.name,
    this.category,
    this.imageurl,
    this.effect,
  );

  factory GithubItemModel.fromJson(Map<String, dynamic> json) => _$GithubItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$GithubItemModelToJson(this);

  @JsonKey(disallowNullValue: true)
  final String name;

  @JsonKey(defaultValue: '')
  final String category;

  @JsonKey(disallowNullValue: true)
  final String imageurl;

  @JsonKey(disallowNullValue: true)
  final String effect;
}
