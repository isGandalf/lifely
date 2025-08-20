import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:lifely/features/student_view/presentation/bloc/bloc/mission_bloc.dart';
import 'package:meta/meta.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final MissionBloc missionBloc;
  LanguageBloc(this.missionBloc) : super(const LanguageInitial()) {
    on<LanguageChangeEvent>(languageChangeEvent);
  }

  FutureOr<void> languageChangeEvent(
    LanguageChangeEvent event,
    Emitter<LanguageState> emit,
  ) {
    emit(LanguageUpdatedState(event.newLocale));
    missionBloc.add(MissionLoadEvent());
  }
}
