import 'package:json_annotation/json_annotation.dart';

part 'img_model.g.dart';

@JsonSerializable(explicitToJson: false)
class ImageModel {
  @JsonKey(defaultValue: "", name: "id")
  String id;

  @JsonKey(defaultValue: "", name: "img_url")
  String imgUrl;

  ImageModel({
    required this.id,
    required this.imgUrl,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}