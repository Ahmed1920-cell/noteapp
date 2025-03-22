import 'package:flutter/material.dart';
import 'package:noteapp/model/NoteModel.dart';
import 'package:noteapp/widgets/Note_ListTile.dart';

class NoteListview extends StatelessWidget {
  const NoteListview({super.key,required this.data});
  final List<NoteModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context,index)=>NoteListtile(note: data[index], index: index,));
  }
}
