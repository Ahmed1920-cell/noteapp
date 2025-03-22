import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/controller/note_cubit.dart';
import 'package:noteapp/widgets/CustomAppbar.dart';
import 'package:noteapp/widgets/CustomModelSheet.dart';
import 'package:noteapp/widgets/CustomTextField.dart';
import 'package:noteapp/widgets/Note_ListView.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) =>
              Custommodelsheet()
          );
        },
        child: Icon(Icons.add, size: 30, color: Colors.white,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomAppBar(
                text: "Note",
                icon: Icons.search, OnPress: () {},
              ),
            ),
            Expanded(
                child: BlocBuilder<NoteCubit, NoteState>(
                  builder: (context, state) {
                    if(state is NoteLoading){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else if(state is NoteDone){
                      return NoteListview(data: state.data,);
                    }
                    else{
                      return Center(
                        child: Text("", style: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.bold),),
                      );
                    }

                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}
