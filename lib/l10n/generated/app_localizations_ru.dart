import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get helloWorld => 'Здарова мир!';

  @override
  String get hiGinnerds => 'Чекаво, гиннерды!';

  @override
  String get somethingWentWrong => 'Ой-ё! Что-то пошло не так!';

  @override
  String get tryAgainLater => 'Пожалуйста, попробуйте позже!';

  @override
  String get tryAgainNow => 'Попробовать сейчас';

  @override
  String low24Hours(Object sign, Object value) {
    return 'Дно за 24 часа: $value $sign ';
  }

  @override
  String high24Hours(Object sign, Object value) {
    return 'Потолок за 24 часа: $value $sign ';
  }
}
