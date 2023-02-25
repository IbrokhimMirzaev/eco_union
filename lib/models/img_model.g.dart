// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'img_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      id: json['id'] as String? ?? '',
      imgUrl: json['img_url'] as String? ?? '',
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img_url': instance.imgUrl,
    };
