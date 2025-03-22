import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/model/NoteModel.dart';
import 'package:noteapp/service/hive%20helper.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {

  NoteCubit() : super(NoteInitial());

  getNote(){
    emit(NoteLoading());
    try{
      List<NoteModel> data=[];
      data=HiveHelper.getNotes();
      emit(NoteDone(data));
    }
    catch(e){
      emit(NoteError(e.toString()));
    }
  }

  addNote(NoteModel note)async{
    emit(NoteLoading());
    try{
      await HiveHelper.addNote(note);
      getNote();
    }catch(e){
      emit(NoteError(e.toString()));
    }
  }
  UpdateNote(NoteModel note,int index)async{
    emit(NoteLoading());
    try{
      await HiveHelper.updateNotes(index,note);
      getNote();
    }catch(e){
      emit(NoteError(e.toString()));
    }
  }

  DeleteNote(int index)async{
    emit(NoteLoading());
    try{
      await HiveHelper.deleteNote(index);
      getNote();
    }catch(e){
      emit(NoteError(e.toString()));
    }
  }
}
