import 'package:hive/hive.dart';
import 'package:noteapp/model/NoteModel.dart';

class HiveHelper{
  static String note="Note";
  static late Box<NoteModel> mybox;
  static Future<void> intil()async{
    mybox=await Hive.openBox<NoteModel>(note);
  }
  static Future<void> addNote(NoteModel value) async {
    try {
      await mybox.add(value);
      print("Data Added Successfully: ${value.title}");
    } catch (e) {
      print("Error Adding Data: $e");
    }
  }
  static Future<void> deleteNote(int index) async{
    await mybox.deleteAt(index);
  }
  static List<NoteModel> getNotes() {
    return  mybox.values.toList();
  }
  static Future<void> updateNotes(int index,NoteModel updateNote) async{
    await mybox.putAt(index, updateNote);
  }
}