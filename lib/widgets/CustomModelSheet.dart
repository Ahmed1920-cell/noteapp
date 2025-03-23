import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/controller/note_cubit.dart';
import 'package:noteapp/model/NoteModel.dart';
import 'package:noteapp/widgets/CustomButton.dart';
import 'package:noteapp/widgets/CustomTextField.dart';

class Custommodelsheet extends StatefulWidget {
   Custommodelsheet({super.key});

  @override
  State<Custommodelsheet> createState() => _CustommodelsheetState();
}

class _CustommodelsheetState extends State<Custommodelsheet> {
GlobalKey<FormState> form_key=GlobalKey<FormState>();

   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

   TextEditingController title=TextEditingController();
TextEditingController subtitle=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 21),
          child: Form(
            key: form_key,
            autovalidateMode: autovalidateMode,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Customtextfield(text: "Title", controller: title,
                ),
                SizedBox(height: 10),
                Customtextfield(text: "Describtion",maxline: 6, controller: subtitle,

                ),
                SizedBox(height: 40),
                Custombutton(text: 'Add',onTap: (){
                  if (form_key.currentState!.validate()) {
                    NoteModel note=NoteModel(title: title.text, decribtion: subtitle.text,
                        date: DateFormat.yMMMEd().format(DateTime.now()));
                    BlocProvider.of<NoteCubit>(context).addNote(note);
                    form_key.currentState!.save();
                    Navigator.pop(context);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }

                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
