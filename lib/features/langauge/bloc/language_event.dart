part of 'language_bloc.dart';

@immutable
sealed class LanguageEvent {}

class LanguageChangeEvent extends LanguageEvent {
  final Locale newLocale;

  LanguageChangeEvent({required this.newLocale});
}
