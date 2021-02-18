import 'package:json_annotation/json_annotation.dart';

/**
 * @author  diaokaibin@gmail.com on 2/18/21.
 */
part 'chapter_base_mode.g.dart';

@JsonSerializable(explicitToJson: true)
class ChaptersBaseModel {
  List<dynamic> children;
  int courseId;
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;

  ChaptersBaseModel(
      this.children,
      this.courseId,
      this.id,
      this.name,
      this.order,
      this.parentChapterId,
      this.userControlSetTop,
      this.visible);

  factory ChaptersBaseModel.fromJson(Map<String, dynamic> json) => _$ChaptersBaseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChaptersBaseModelToJson(this);
}