import 'package:json_annotation/json_annotation.dart';

part 'api_resource_list.g.dart';

@JsonSerializable()
class ApiResourceList {
  ApiResourceList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory ApiResourceList.fromJson(Map<String, dynamic> json) =>
      _$ApiResourceListFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResourceListToJson(this);

  final int count;
  final String? next;
  final String? previous;
  final List<NamedApiResource> results;
}

@JsonSerializable()
class NamedApiResource {
  NamedApiResource({
    required this.name,
    required this.url,
  });

  factory NamedApiResource.fromJson(Map<String, dynamic> json) =>
      _$NamedApiResourceFromJson(json);

  Map<String, dynamic> toJson() => _$NamedApiResourceToJson(this);

  final String name;
  final String url;
}
