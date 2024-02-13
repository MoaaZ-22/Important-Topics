// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `My App`
  String get appName {
    return Intl.message(
      'My App',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Vandad Animations`
  String get vandadAnimations {
    return Intl.message(
      'Vandad Animations',
      name: 'vandadAnimations',
      desc: '',
      args: [],
    );
  }

  /// `Design Patterns`
  String get designPatterns {
    return Intl.message(
      'Design Patterns',
      name: 'designPatterns',
      desc: '',
      args: [],
    );
  }

  /// `Pagination`
  String get pagination {
    return Intl.message(
      'Pagination',
      name: 'pagination',
      desc: '',
      args: [],
    );
  }

  /// `Responsive UI`
  String get responsiveUi {
    return Intl.message(
      'Responsive UI',
      name: 'responsiveUi',
      desc: '',
      args: [],
    );
  }

  /// `Bloc Examples`
  String get blocExamples {
    return Intl.message(
      'Bloc Examples',
      name: 'blocExamples',
      desc: '',
      args: [],
    );
  }

  /// `Login Bloc View`
  String get loginBlocView {
    return Intl.message(
      'Login Bloc View',
      name: 'loginBlocView',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `You Are Logged In`
  String get youAreLoggedIn {
    return Intl.message(
      'You Are Logged In',
      name: 'youAreLoggedIn',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Login To Enter`
  String get loginToEnter {
    return Intl.message(
      'Login To Enter',
      name: 'loginToEnter',
      desc: '',
      args: [],
    );
  }

  /// `Generic dialog`
  String get genericDialog {
    return Intl.message(
      'Generic dialog',
      name: 'genericDialog',
      desc: '',
      args: [],
    );
  }

  /// `Generic Dialog View`
  String get genericDialogView {
    return Intl.message(
      'Generic Dialog View',
      name: 'genericDialogView',
      desc: '',
      args: [],
    );
  }

  /// `Unblock Dialog`
  String get unblockDialog {
    return Intl.message(
      'Unblock Dialog',
      name: 'unblockDialog',
      desc: '',
      args: [],
    );
  }

  /// `Interest Dialog`
  String get interestDialog {
    return Intl.message(
      'Interest Dialog',
      name: 'interestDialog',
      desc: '',
      args: [],
    );
  }

  /// `Search with Bloc`
  String get searchWithBloc {
    return Intl.message(
      'Search with Bloc',
      name: 'searchWithBloc',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
