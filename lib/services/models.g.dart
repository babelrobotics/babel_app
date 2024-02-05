// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Module _$ModuleFromJson(Map<String, dynamic> json) => Module(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      units: (json['units'] as List<dynamic>?)
              ?.map((e) => Unit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ModuleToJson(Module instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'units': instance.units,
    };

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      sections: (json['sections'] as List<dynamic>?)
              ?.map((e) => Section.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'sections': instance.sections,
    };

Section _$SectionFromJson(Map<String, dynamic> json) => Section(
      id: json['id'] as String? ?? '',
      order: json['order'] as int? ?? 0,
      segments: (json['segments'] as List<dynamic>?)
              ?.map((e) => Segment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'segments': instance.segments,
    };

Segment _$SegmentFromJson(Map<String, dynamic> json) => Segment(
      order: json['order'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      content: json['content'] as String? ?? '',
      contentId: json['contentId'] as String? ?? '',
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      optionsMap: (json['optionsMap'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      answer: (json['answer'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SegmentToJson(Segment instance) => <String, dynamic>{
      'order': instance.order,
      'type': instance.type,
      'content': instance.content,
      'contentId': instance.contentId,
      'options': instance.options,
      'optionsMap': instance.optionsMap,
      'answer': instance.answer,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      subscription: json['subscription'] as String? ?? '',
      points: json['points'] as int? ?? 0,
      picture: json['picture'] as String? ?? '',
      bannerPicture: json['bannerPicture'] as String? ?? '',
      createdDateTime: json['createdDateTime'] as String? ?? '',
      preferences: json['preferences'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'subscription': instance.subscription,
      'points': instance.points,
      'picture': instance.picture,
      'bannerPicture': instance.bannerPicture,
      'createdDateTime': instance.createdDateTime,
      'preferences': instance.preferences,
    };

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      uid: json['uid'] as String? ?? '',
      modules: json['modules'] as Map<String, dynamic>? ?? const {},
      total: json['total'] as int? ?? 0,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'uid': instance.uid,
      'total': instance.total,
      'modules': instance.modules,
    };
