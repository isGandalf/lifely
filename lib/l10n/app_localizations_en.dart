// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String missionCompletedTitle(Object missionTitle) {
    return 'Mission $missionTitle completed';
  }

  @override
  String get missionCompletedDescription =>
      'Your child has completed a new activity today!';
}
