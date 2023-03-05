import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:video_downloder/base_module/domain/entity/app_theme_singleton.dart';



part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(appTheme.themeState);

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ChangeTheme) {
      await appTheme.setThemeType(
        themeType: event.themeType,
      );

      yield appTheme.themeState;
    }
  }
}
