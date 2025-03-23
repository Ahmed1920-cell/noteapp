import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/controller/note_cubit.dart';
import 'package:noteapp/model/NoteModel.dart';
import 'package:noteapp/views/home.dart';
import 'package:noteapp/widgets/CustomAppbar.dart';
import 'package:noteapp/widgets/CustomTextField.dart';

class EditNote extends StatefulWidget {
   EditNote({super.key,required this.note,required this.index});
   NoteModel note;
int index;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController title_controller=TextEditingController();
  TextEditingController subtitle=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title_controller.text=widget.note.title;
    subtitle.text=widget.note.decribtion;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomAppBar(
                text: "Note Edit",
                icon: Icons.done_outline_outlined, OnPress: () async {
                  await BlocProvider.of<NoteCubit>(context).UpdateNote(NoteModel(title: title_controller.text, decribtion: subtitle.text, date: widget.note.date),widget.index);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (route)=>false);  },
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 21),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Customtextfield(text: "Title", controller: title_controller,
                              
                            ),
                            SizedBox(height: 10),
                            Customtextfield(text: "Describtion",maxline: 6, controller: subtitle,
                              
                            ),
                            SizedBox(height: 40),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
