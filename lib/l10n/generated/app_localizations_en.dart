import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get hiGinnerds => 'Hi, ginnerds!';

  @override
  String get somethingWentWrong => 'Oops! Something went wrong!';

  @override
  String get tryAgainLater => 'Please try again later!';

  @override
  String get tryAgainNow => 'Try again now';

  @override
  String low24Hours(Object sign, Object value) {
    return 'Low 24 Hour: $value $sign ';
  }

  @override
  String high24Hours(Object sign, Object value) {
    return 'High 24 Hour: $value $sign ';
  }
}
