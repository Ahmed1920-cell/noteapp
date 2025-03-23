import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/controller/note_cubit.dart';
import 'package:noteapp/model/NoteModel.dart';
import 'package:noteapp/widgets/CustomAppBarSearch.dart';
import 'package:noteapp/widgets/CustomAppbar.dart';
import 'package:noteapp/widgets/CustomModelSheet.dart';
import 'package:noteapp/widgets/CustomTextField.dart';
import 'package:noteapp/widgets/Note_ListView.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
bool IsSearch=false;
List<NoteModel> temp=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<NoteCubit>(context).getNote();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: BlocListener<NoteCubit, NoteState>(
  listener: (context, state) {
    // TODO: implement listener}
  },
  child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: !IsSearch?CustomAppBar(
                text: "Note",
                icon: Icons.search, OnPress: () {
                 setState(() {
    final state = context.read<NoteCubit>().state;
    if (state is NoteDone)
      temp=state.data;
                   IsSearch=!IsSearch;
                 });
              },
              ):CustomAppbarSearch( text: "Note",hint: "Enter the data",onChange: (value){
                final state = context.read<NoteCubit>().state;
    if (state is NoteDone) {
      if(value.isEmpty)
    temp = state.data;
    print("done");
setState(() {
  temp=state.data.where((note) => note.title.toLowerCase().contains(value.toLowerCase()))
      .toList();
});
    print(temp);
    }

              },OnPress: (){
                setState(() {
                  IsSearch=!IsSearch;
                });
              },),
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

                      return temp.isNotEmpty||IsSearch?NoteListview(data: temp,):NoteListview(data: state.data,);
                    }
                    else{
                      return Center(
                        child: Text("Error", style: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.bold),),
                      );
                    }

                  },
                )
            ),
          ],
        ),
      ),
),
    );
  }
}
