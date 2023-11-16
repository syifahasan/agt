import 'dart:async';
import 'package:authentic_guards/data/repository/local/hive_local_database.dart';
import 'package:authentic_guards/domain/model/body/user_local_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum LoggedEnum {
  loading,
  logged,
  empty
}

class AuthCubit extends Cubit<LoggedEnum> {
  AuthCubit() : super(LoggedEnum.loading) {
    initial();
  }

  initial() async {
    try {
      emit(LoggedEnum.loading);

      final UserLocalBody data = await HiveLocalDatabase.getUserInfo();

      if(data.name == null) {
        await FirebaseAuth.instance.signOut();
        emit(LoggedEnum.empty);
        return;
      }

      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        Timer(
            const Duration(seconds: 2),() {
            if (user == null) {
              emit(LoggedEnum.empty);
            } else {
              emit(LoggedEnum.logged);
              }
            }
        );

      });
    } catch (e) {
      emit(LoggedEnum.empty);
    }
  }

  void setEnum(LoggedEnum d) {
    emit(d);
  }
}