import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/injection/injection_container.dart';
import 'core/router/app_router.dart';
import 'features/notes/presentation/cubit/notes_cubit.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NotesCubit>(),
      child: MaterialApp(
        title: "Notes App",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
