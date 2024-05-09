import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_app/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:test_app/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:test_app/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:test_app/features/authentication/domain/usecases/check_verification_usecase.dart';
import 'package:test_app/features/authentication/domain/usecases/first_page_usecase.dart';
import 'package:test_app/features/authentication/domain/usecases/google_auth_usecase.dart';
import 'package:test_app/features/authentication/domain/usecases/sign_in_usecase.dart';
import 'package:test_app/features/authentication/domain/usecases/sign_out_usecase.dart';
import 'package:test_app/features/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:test_app/features/authentication/domain/usecases/verifiy_email_usecase.dart';
import 'package:test_app/features/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'core/network/network_info.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => AuthBloc(
      signInUseCase: sl(),
      signUpUseCase: sl(),
      signOutUseCase: sl(),
      firstPage: sl(),
      verifyEmailUseCase: sl(),
      checkVerificationUseCase: sl(),
      googleAuthUseCase: sl()));

// Usecases

  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));
  sl.registerLazySingleton(() => FirstPageUseCase(sl()));
  sl.registerLazySingleton(() => VerifyEmailUseCase(sl()));
  sl.registerLazySingleton(() => CheckVerificationUseCase(sl()));
  sl.registerLazySingleton(() => GoogleAuthUseCase(sl()));

// Repository

  sl.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImp(
          networkInfo: sl(), authRemoteDataSource: sl()));

// Datasources

  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
