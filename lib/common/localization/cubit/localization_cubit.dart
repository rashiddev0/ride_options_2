import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationCubit extends Cubit<Locale> {
  LocalizationCubit() : super(const Locale('en')); // Default locale is English

  void setEnglishLocale() {
    emit(const Locale('en'));
  }

  void setUrduLocale() {
    emit(const Locale('ur'));
  }
}
