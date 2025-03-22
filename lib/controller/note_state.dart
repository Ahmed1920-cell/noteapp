part of 'note_cubit.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}
final class NoteLoading extends NoteState {}
final class NoteDone extends NoteState {
  List<NoteModel> data;
  NoteDone(this.data);
}
final class NoteError extends NoteState {
  String error;
  NoteError(this.error);
}
