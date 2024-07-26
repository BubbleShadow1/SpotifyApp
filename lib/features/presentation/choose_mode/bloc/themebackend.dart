import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class Themebackend extends HydratedCubit<ThemeMode>{
  Themebackend():super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode){
    return emit(themeMode);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    return ThemeMode.values[json['theme'] as int];
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'theme':state.index};
  }


}
