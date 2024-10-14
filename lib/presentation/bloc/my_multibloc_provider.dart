import 'package:ai_assiatant_flutter/injection.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/auth/auth_bloc.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/docs/docs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyMultiblocProvider extends StatelessWidget {
  final Widget child;
  const MyMultiblocProvider({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthenticationBloc>(
        create: (context) => getIt<AuthenticationBloc>(),
      ),
      BlocProvider<DocsCubit>(
        create: (context) => getIt<DocsCubit>(),
      ),
    ], child: child);
  }
}
