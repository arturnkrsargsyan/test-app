import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/features/authentication/domain/entities/sign_out_entity.dart';
import '../../../../core/error/failures.dart';
import '../entities/first_page_entity.dart';
import '../entities/sign_in_entity.dart';
import '../entities/sign_up_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserCredential>> signIn(SignInEntity signIn);
  Future<Either<Failure, UserCredential>> signUp(SignUpEntity signUp);
  Future<void> signOut(SignOutEntity signOut);
  Future<Either<Failure, UserCredential>> googleSignIn();
  FirstPageEntity firstPage();
  Future<Either<Failure, Unit>> verifyEmail();
  Future<Either<Failure, Unit>> checkEmailVerification(Completer completer);
}
