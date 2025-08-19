class LanguageModel {
  final String language;
  final String subLanguage;
  final String languageCode;

  LanguageModel({
    required this.language,
    required this.subLanguage,
    required this.languageCode,
  });
}

List<LanguageModel> get languageModel => [
  LanguageModel(
    language: 'English',
    subLanguage: 'English',
    languageCode: 'en',
  ),
  LanguageModel(language: 'हिन्दी', subLanguage: 'Hindi', languageCode: 'hi'),
];
