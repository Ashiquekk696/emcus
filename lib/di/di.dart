import 'package:emcus/modules/auth/bloc/auth_bloc.dart';
import 'package:emcus/modules/auth/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';




final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // Repositories
  sl.registerLazySingleton(() => AuthRepository());

  // BLoC
  sl.registerFactory(() => AuthBloc(authRepository: sl()));
}
