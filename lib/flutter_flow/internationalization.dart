import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'tr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? trText = '',
  }) =>
      [enText, trText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '3jt752y9': {
      'en': 'Back To Main Page',
      'tr': 'Ana Sayfaya Dön',
    },
    '67qmizqw': {
      'en': 'Yavuz\'s Blog Page',
      'tr': 'Yavuz\'un Blog Sayfası',
    },
    '7z0uw5ww': {
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // blogIcerigi
  {
    '37nsk6ph': {
      'en': 'Go Back',
      'tr': 'Geri Dön',
    },
    'dad61mju': {
      'en': 'Like',
      'tr': 'Beğen',
    },
  },
  // Miscellaneous
  {
    'xlpc1qyy': {
      'en': '',
      'tr': '',
    },
    'f70kytwd': {
      'en': '',
      'tr': '',
    },
    'bfpwtrn8': {
      'en': '',
      'tr': '',
    },
    '2acstr4o': {
      'en': '',
      'tr': '',
    },
    'ezuuhvi4': {
      'en': '',
      'tr': '',
    },
    '63v3221w': {
      'en': '',
      'tr': '',
    },
    'gusverdd': {
      'en': '',
      'tr': '',
    },
    'xppmk5fm': {
      'en': '',
      'tr': '',
    },
    '147g01kw': {
      'en': '',
      'tr': '',
    },
    'prmxrlfq': {
      'en': '',
      'tr': '',
    },
    'urwcb62l': {
      'en': '',
      'tr': '',
    },
    'xw1fcx7c': {
      'en': '',
      'tr': '',
    },
    'rwvgkzml': {
      'en': '',
      'tr': '',
    },
    'hlqowgw8': {
      'en': '',
      'tr': '',
    },
    'lbs7ocjw': {
      'en': '',
      'tr': '',
    },
    'hzba8ccd': {
      'en': '',
      'tr': '',
    },
    'b6t0wf6d': {
      'en': '',
      'tr': '',
    },
    '1h14edtk': {
      'en': '',
      'tr': '',
    },
    'hqbzlo75': {
      'en': '',
      'tr': '',
    },
    'bjwdv98e': {
      'en': '',
      'tr': '',
    },
    'el9ij8sb': {
      'en': '',
      'tr': '',
    },
    'peunpch7': {
      'en': '',
      'tr': '',
    },
    'vteu9kag': {
      'en': '',
      'tr': '',
    },
    'qcycb93k': {
      'en': '',
      'tr': '',
    },
    'rbwqk14m': {
      'en': '',
      'tr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
