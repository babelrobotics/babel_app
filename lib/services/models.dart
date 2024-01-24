import 'package:cloud_firestore/cloud_firestore.dart';  
import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';


/*=========================================================
            Modules
=========================================================*/

@JsonSerializable()
class Module {
  final String id;
  final String title;
  final String description;
  final List<Unit> units;


  Module({
    this.id = '',
    this.title = '',
    this.description = '',
    this.units = const []
  });

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);
  Map<String, dynamic> toJson() => _$ModuleToJson(this);
}

@JsonSerializable()
class Unit {
  final String id;
  final String title;
  final String description;
  final List<Section> sections;

  Unit({
    this.id = '',
    this.title = '',
    this.description = '',
    this.sections = const []
  });

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
  Map<String, dynamic> toJson() => _$UnitToJson(this);
}

@JsonSerializable()
class Section {
  final String id;
  final int order;
  final List<Segment> segments;

  Section({
    this.id = '',
    this.order = 0,
    this.segments = const []
  });

  factory Section.fromJson(Map<String, dynamic> json) => _$SectionFromJson(json);
  Map<String, dynamic> toJson() => _$SectionToJson(this);
}

@JsonSerializable()
class Segment {
  final int order;
  final String type;
  final String content;
  final String contentId;
  final List<String> options;
  final Map<String, String> optionsMap;
  final List<String> answer;

  Segment({
    this.order = 0,
    this.type = '',
    this.content = '',
    this.contentId = '',
    this.options = const [],
    this.optionsMap = const {},
    this.answer = const []
  });

  factory Segment.fromJson(Map<String, dynamic> json) => _$SegmentFromJson(json);
  Map<String, dynamic> toJson() => _$SegmentToJson(this);
}

/*=========================================================
            Users
=========================================================*/

@JsonSerializable()
class User {
  final String id;
  final String name;
  final int points;
  final String picture;
  final String createdDateTime;

  User({
    this.id = '',
    this.name = '',
    this.points = 0, 
    this.picture = '',
    this.createdDateTime = ''
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Report {
  String uid;
  int total;
  Map modules;

  Report({
    this.uid = '', 
    this.modules = const {}, 
    this.total = 0
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

