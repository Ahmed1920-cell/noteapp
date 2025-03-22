import 'package:hive_flutter/hive_flutter.dart';
part 'NoteModel.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  String decribtion;
  @HiveField(2)
  String date;
  NoteModel({required this.title,required this.decribtion,required this.date});
}