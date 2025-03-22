import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/controller/note_cubit.dart';
import 'package:noteapp/model/NoteModel.dart';
import 'package:noteapp/views/Edit_Note.dart';

class NoteListtile extends StatelessWidget {
  const NoteListtile({super.key,required this.note,required this.index});
  final NoteModel note;
  final index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>EditNote(note: note,index:index)), (route)=>false);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xff93764e),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
               note.decribtion,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              trailing: IconButton(onPressed: (){
                BlocProvider.of<NoteCubit>(context).DeleteNote(index);
              }, icon: Icon(
                Icons.delete,
                size: 30,
                color: Colors.grey,
              ),
              ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                note.date,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
