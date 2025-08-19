part of 'language_bloc.dart';

@immutable
sealed class LanguageState {
  final Locale locale;

  const LanguageState({required this.locale});
}

final class LanguageInitial extends LanguageState {
  const LanguageInitial() : super(locale: const Locale('en'));
}

final class LanguageUpdatedState extends LanguageState {
  const LanguageUpdatedState(Locale locale) : super(locale: locale);
}
