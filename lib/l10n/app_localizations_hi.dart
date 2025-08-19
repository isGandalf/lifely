// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String missionCompletedTitle(Object missionTitle) {
    return 'मिशन $missionTitle पूरा हुआ';
  }

  @override
  String get missionCompletedDescription =>
      'आपके बच्चे ने आज एक नई गतवध पूरी की!';
}
