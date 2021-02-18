// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChaptersMode _$ChaptersModeFromJson(Map<String, dynamic> json) {
  return ChaptersMode(
    json['errorCode'] as int,
    json['errorMsg'] as String,
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ChaptersBaseModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ChaptersModeToJson(ChaptersMode instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
    };
