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

  /// `Request timed out. Please check your internet connection.`
  String get connectionTimeout {
    return Intl.message(
      'Request timed out. Please check your internet connection.',
      name: 'connectionTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Server error. Please try again later.`
  String get serverError {
    return Intl.message(
      'Server error. Please try again later.',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Requested resource not found.`
  String get notFound {
    return Intl.message(
      'Requested resource not found.',
      name: 'notFound',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again.`
  String get errorMessageGeneric {
    return Intl.message(
      'Something went wrong. Please try again.',
      name: 'errorMessageGeneric',
      desc: '',
      args: [],
    );
  }

  /// `Network error. Please check your connection.`
  String get networkError {
    return Intl.message(
      'Network error. Please check your connection.',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Request timed out. Please try again.`
  String get requestTimeout {
    return Intl.message(
      'Request timed out. Please try again.',
      name: 'requestTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Failed to save information securely. Please try again.`
  String get secureStorageErrorMessage {
    return Intl.message(
      'Failed to save information securely. Please try again.',
      name: 'secureStorageErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `No value found for key: `
  String get noValueKeyFound {
    return Intl.message(
      'No value found for key: ',
      name: 'noValueKeyFound',
      desc: '',
      args: [],
    );
  }

  /// `Service disabled`
  String get serviceDisabled {
    return Intl.message(
      'Service disabled',
      name: 'serviceDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Permission denied`
  String get permissionDenied {
    return Intl.message(
      'Permission denied',
      name: 'permissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Permission denied forever`
  String get permissionDeniedForever {
    return Intl.message(
      'Permission denied forever',
      name: 'permissionDeniedForever',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get confirmPassword {
    return Intl.message(
      'Please confirm your password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get paswordNotMatched {
    return Intl.message(
      'Passwords do not match',
      name: 'paswordNotMatched',
      desc: '',
      args: [],
    );
  }

  /// `Code is required`
  String get codeIsRequired {
    return Intl.message(
      'Code is required',
      name: 'codeIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid code`
  String get invalidCode {
    return Intl.message(
      'Invalid code',
      name: 'invalidCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid Egyptian phone number`
  String get enterValidEgyptianPhoneNumber {
    return Intl.message(
      'Enter a valid Egyptian phone number',
      name: 'enterValidEgyptianPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Must be at least 3 characters`
  String get mustBeAtLeast3Characters {
    return Intl.message(
      'Must be at least 3 characters',
      name: 'mustBeAtLeast3Characters',
      desc: '',
      args: [],
    );
  }

  /// `Only letters allowed`
  String get onlyLettersAllowed {
    return Intl.message(
      'Only letters allowed',
      name: 'onlyLettersAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailIsRequired {
    return Intl.message(
      'Email is required',
      name: 'emailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address`
  String get enterValidEmail {
    return Intl.message(
      'Enter a valid email address',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password needs uppercase, digit, and special char`
  String get enterValidPassword {
    return Intl.message(
      'Password needs uppercase, digit, and special char',
      name: 'enterValidPassword',
      desc: '',
      args: [],
    );
  }

  /// `ID number is required`
  String get idNumberRequired {
    return Intl.message(
      'ID number is required',
      name: 'idNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid 14-digit ID number`
  String get invalidIdNumber {
    return Intl.message(
      'Enter a valid 14-digit ID number',
      name: 'invalidIdNumber',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Oops! Something went wrong.`
  String get oopsSomthingWentWrong {
    return Intl.message(
      'Oops! Something went wrong.',
      name: 'oopsSomthingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `goToHome`
  String get goToHome {
    return Intl.message(
      'goToHome',
      name: 'goToHome',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to manage your classes`
  String get signInToManageYourClasses {
    return Intl.message(
      'Sign in to manage your classes',
      name: 'signInToManageYourClasses',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get singIn {
    return Intl.message(
      'Sign in',
      name: 'singIn',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Groups`
  String get groups {
    return Intl.message(
      'Groups',
      name: 'groups',
      desc: '',
      args: [],
    );
  }

  /// `Scanner`
  String get scanner {
    return Intl.message(
      'Scanner',
      name: 'scanner',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get schedule {
    return Intl.message(
      'Schedule',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `My Groups`
  String get myGroups {
    return Intl.message(
      'My Groups',
      name: 'myGroups',
      desc: '',
      args: [],
    );
  }

  /// `Search groups...`
  String get searchGroups {
    return Intl.message(
      'Search groups...',
      name: 'searchGroups',
      desc: '',
      args: [],
    );
  }

  /// `No gorups yet`
  String get noGroupsYet {
    return Intl.message(
      'No gorups yet',
      name: 'noGroupsYet',
      desc: '',
      args: [],
    );
  }

  /// `No groups match your search`
  String get noGroupMatchYourSearch {
    return Intl.message(
      'No groups match your search',
      name: 'noGroupMatchYourSearch',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get sunday {
    return Intl.message(
      'Sunday',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `Mondey`
  String get mondey {
    return Intl.message(
      'Mondey',
      name: 'mondey',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get tuesday {
    return Intl.message(
      'Tuesday',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get wednesday {
    return Intl.message(
      'Wednesday',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thuresday`
  String get thursday {
    return Intl.message(
      'Thuresday',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get friday {
    return Intl.message(
      'Friday',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get saturday {
    return Intl.message(
      'Saturday',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `Please select at least one day`
  String get pleaseSelectAtLeastOneDay {
    return Intl.message(
      'Please select at least one day',
      name: 'pleaseSelectAtLeastOneDay',
      desc: '',
      args: [],
    );
  }

  /// `Group created successfully`
  String get groupCreatedSuccessfully {
    return Intl.message(
      'Group created successfully',
      name: 'groupCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Create New Group`
  String get createNewGroup {
    return Intl.message(
      'Create New Group',
      name: 'createNewGroup',
      desc: '',
      args: [],
    );
  }

  /// `Group name`
  String get groupName {
    return Intl.message(
      'Group name',
      name: 'groupName',
      desc: '',
      args: [],
    );
  }

  /// `e.g. Grade 10 – Physics`
  String get groupNameHint {
    return Intl.message(
      'e.g. Grade 10 – Physics',
      name: 'groupNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a group name`
  String get pleaseEnterAGroupName {
    return Intl.message(
      'Please enter a group name',
      name: 'pleaseEnterAGroupName',
      desc: '',
      args: [],
    );
  }

  /// `Select the days and set time for each`
  String get selectTheDaysAndSetTimeForEach {
    return Intl.message(
      'Select the days and set time for each',
      name: 'selectTheDaysAndSetTimeForEach',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `End`
  String get end {
    return Intl.message(
      'End',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `Students`
  String get studnets {
    return Intl.message(
      'Students',
      name: 'studnets',
      desc: '',
      args: [],
    );
  }

  /// `No schedule`
  String get noSchedule {
    return Intl.message(
      'No schedule',
      name: 'noSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
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
