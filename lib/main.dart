import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteapp/controller/note_cubit.dart';
import 'package:noteapp/model/NoteModel.dart';
import 'package:noteapp/service/hive%20helper.dart';
import 'package:noteapp/views/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await HiveHelper.intil();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          //fontFamily: 'Poplar',
          useMaterial3: true,
        ),
        home: Home(),
      ),
    );
  }
}


