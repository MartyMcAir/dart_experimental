// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      // id: (json['id'] as num).toInt(),
      id: json['id'] != null ? json['id'] as int : 1,
      name: json['name'] as String,
      // year: (json['year'] as num).toInt(),
      year: json['year'] != null ? json['year'] as int : 0,
      color: json['color'] as String,
      pantoneValue: json['pantoneValue'] as String,
      support: Support.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year': instance.year,
      'color': instance.color,
      'pantoneValue': instance.pantoneValue,
      'support': instance.support,
    };

Support _$SupportFromJson(Map<String, dynamic> json) => Support(
      url: json['url'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$SupportToJson(Support instance) => <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };
