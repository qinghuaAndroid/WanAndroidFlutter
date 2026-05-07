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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `A professional Android community`
  String get slogan {
    return Intl.message(
      'A professional Android community',
      name: 'slogan',
      desc: '',
      args: [],
    );
  }

  /// `Play Android`
  String get tab1 {
    return Intl.message('Play Android', name: 'tab1', desc: '', args: []);
  }

  /// `Knowledge System`
  String get tab2 {
    return Intl.message('Knowledge System', name: 'tab2', desc: '', args: []);
  }

  /// `Public Account`
  String get tab3 {
    return Intl.message('Public Account', name: 'tab3', desc: '', args: []);
  }

  /// `navigation`
  String get tab4 {
    return Intl.message('navigation', name: 'tab4', desc: '', args: []);
  }

  /// `project`
  String get tab5 {
    return Intl.message('project', name: 'tab5', desc: '', args: []);
  }

  /// `My Collection`
  String get myCollect {
    return Intl.message('My Collection', name: 'myCollect', desc: '', args: []);
  }

  /// `System Settings`
  String get settings {
    return Intl.message(
      'System Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `about Us`
  String get aboutUs {
    return Intl.message('about Us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Log out`
  String get logout {
    return Intl.message('Log out', name: 'logout', desc: '', args: []);
  }

  /// `Night Mode`
  String get nightMode {
    return Intl.message('Night Mode', name: 'nightMode', desc: '', args: []);
  }

  /// `TODO`
  String get todo {
    return Intl.message('TODO', name: 'todo', desc: '', args: []);
  }

  /// `square`
  String get square {
    return Intl.message('square', name: 'square', desc: '', args: []);
  }

  /// `My Points`
  String get myScore {
    return Intl.message('My Points', name: 'myScore', desc: '', args: []);
  }

  /// `Relax`
  String get relax {
    return Intl.message('Relax', name: 'relax', desc: '', args: []);
  }

  /// `Questions`
  String get questions {
    return Intl.message('Questions', name: 'questions', desc: '', args: []);
  }

  /// `ID:`
  String get id {
    return Intl.message('ID:', name: 'id', desc: '', args: []);
  }

  /// `grade:`
  String get grade {
    return Intl.message('grade:', name: 'grade', desc: '', args: []);
  }

  /// `Ranking:`
  String get rank {
    return Intl.message('Ranking:', name: 'rank', desc: '', args: []);
  }

  /// `WanAndroid`
  String get appName {
    return Intl.message('WanAndroid', name: 'appName', desc: '', args: []);
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Please enter the account name`
  String get loginAccountNameHint {
    return Intl.message(
      'Please enter the account name',
      name: 'loginAccountNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the password`
  String get loginAccountPwdHint {
    return Intl.message(
      'Please enter the password',
      name: 'loginAccountPwdHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the password again`
  String get loginAccountRePwdHint {
    return Intl.message(
      'Please enter the password again',
      name: 'loginAccountRePwdHint',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message('Login', name: 'loginButton', desc: '', args: []);
  }

  /// `login successful`
  String get loginSuccess {
    return Intl.message(
      'login successful',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerButton {
    return Intl.message('Register', name: 'registerButton', desc: '', args: []);
  }

  /// `I have read and agreed to the terms of service`
  String get registerServiceTerms {
    return Intl.message(
      'I have read and agreed to the terms of service',
      name: 'registerServiceTerms',
      desc: '',
      args: [],
    );
  }

  /// `Please enter user name～`
  String get registerAccountEmpty {
    return Intl.message(
      'Please enter user name～',
      name: 'registerAccountEmpty',
      desc: '',
      args: [],
    );
  }

  /// `At least 6 usernames～`
  String get registerAccountLength {
    return Intl.message(
      'At least 6 usernames～',
      name: 'registerAccountLength',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the password～`
  String get registerPasswordEmpty {
    return Intl.message(
      'Please enter the password～',
      name: 'registerPasswordEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password at least 6 digits～`
  String get registerPasswordLength {
    return Intl.message(
      'Password at least 6 digits～',
      name: 'registerPasswordLength',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm the password～`
  String get registerRePasswordEmpty {
    return Intl.message(
      'Please confirm the password～',
      name: 'registerRePasswordEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password at least 6 digits～`
  String get registerRePasswordLength {
    return Intl.message(
      'Password at least 6 digits～',
      name: 'registerRePasswordLength',
      desc: '',
      args: [],
    );
  }

  /// `The two passwords entered are inconsistent～`
  String get registerPasswordDiff {
    return Intl.message(
      'The two passwords entered are inconsistent～',
      name: 'registerPasswordDiff',
      desc: '',
      args: [],
    );
  }

  /// `Please agree to the terms of service～`
  String get registerNotServiceTerms {
    return Intl.message(
      'Please agree to the terms of service～',
      name: 'registerNotServiceTerms',
      desc: '',
      args: [],
    );
  }

  /// `Registration success～`
  String get registerSuccess {
    return Intl.message(
      'Registration success～',
      name: 'registerSuccess',
      desc: '',
      args: [],
    );
  }

  /// `comprehensive`
  String get homeComplex {
    return Intl.message(
      'comprehensive',
      name: 'homeComplex',
      desc: '',
      args: [],
    );
  }

  /// `project`
  String get homeProject {
    return Intl.message('project', name: 'homeProject', desc: '', args: []);
  }

  /// `mine`
  String get homeMy {
    return Intl.message('mine', name: 'homeMy', desc: '', args: []);
  }

  /// `collect`
  String get homeCollect {
    return Intl.message('collect', name: 'homeCollect', desc: '', args: []);
  }

  /// `Points`
  String get homePoints {
    return Intl.message('Points', name: 'homePoints', desc: '', args: []);
  }

  /// `Share`
  String get homePartake {
    return Intl.message('Share', name: 'homePartake', desc: '', args: []);
  }

  /// `History`
  String get homeHistory {
    return Intl.message('History', name: 'homeHistory', desc: '', args: []);
  }

  /// `Personal information`
  String get homeUserInfo {
    return Intl.message(
      'Personal information',
      name: 'homeUserInfo',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get homeAbout {
    return Intl.message('About', name: 'homeAbout', desc: '', args: []);
  }

  /// `Share`
  String get homeShare {
    return Intl.message('Share', name: 'homeShare', desc: '', args: []);
  }

  /// `Feedback`
  String get homeFeedback {
    return Intl.message('Feedback', name: 'homeFeedback', desc: '', args: []);
  }

  /// `Say something...`
  String get webEditHint {
    return Intl.message(
      'Say something...',
      name: 'webEditHint',
      desc: '',
      args: [],
    );
  }

  /// `Do not support commenting ye`
  String get webNotComment {
    return Intl.message(
      'Do not support commenting ye',
      name: 'webNotComment',
      desc: '',
      args: [],
    );
  }

  /// `Nickname`
  String get userNickname {
    return Intl.message('Nickname', name: 'userNickname', desc: '', args: []);
  }

  /// `Come and check the ranking list~`
  String get userPointsRanking {
    return Intl.message(
      'Come and check the ranking list~',
      name: 'userPointsRanking',
      desc: '',
      args: [],
    );
  }

  /// `Points ranking`
  String get userRankingTitle {
    return Intl.message(
      'Points ranking',
      name: 'userRankingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Rank`
  String get userRankingNumber {
    return Intl.message('Rank', name: 'userRankingNumber', desc: '', args: []);
  }

  /// `Accumulated points`
  String get userRankingCoin {
    return Intl.message(
      'Accumulated points',
      name: 'userRankingCoin',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutTitle {
    return Intl.message('About Us', name: 'aboutTitle', desc: '', args: []);
  }

  /// `Version:`
  String get aboutVersion {
    return Intl.message('Version:', name: 'aboutVersion', desc: '', args: []);
  }

  /// `build:`
  String get aboutBuild {
    return Intl.message('build:', name: 'aboutBuild', desc: '', args: []);
  }

  /// `Github`
  String get aboutGithub {
    return Intl.message('Github', name: 'aboutGithub', desc: '', args: []);
  }

  /// `CSDN`
  String get aboutCSDN {
    return Intl.message('CSDN', name: 'aboutCSDN', desc: '', args: []);
  }

  /// `Technical Support`
  String get aboutSupport {
    return Intl.message(
      'Technical Support',
      name: 'aboutSupport',
      desc: '',
      args: [],
    );
  }

  /// `Copyright@2021\nAll Right Reserved`
  String get aboutCopyright {
    return Intl.message(
      'Copyright@2021\nAll Right Reserved',
      name: 'aboutCopyright',
      desc: '',
      args: [],
    );
  }

  /// `Feedback*`
  String get feedbackTitleStar {
    return Intl.message(
      'Feedback*',
      name: 'feedbackTitleStar',
      desc: '',
      args: [],
    );
  }

  /// `You can enter feedback content here`
  String get feedbackHint {
    return Intl.message(
      'You can enter feedback content here',
      name: 'feedbackHint',
      desc: '',
      args: [],
    );
  }

  /// `Upload screenshot`
  String get feedbackUploadPhoto {
    return Intl.message(
      'Upload screenshot',
      name: 'feedbackUploadPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Contact information`
  String get feedbackContact {
    return Intl.message(
      'Contact information',
      name: 'feedbackContact',
      desc: '',
      args: [],
    );
  }

  /// `(Optional)`
  String get feedbackOptional {
    return Intl.message(
      '(Optional)',
      name: 'feedbackOptional',
      desc: '',
      args: [],
    );
  }

  /// `Contact QQ group:704273239`
  String get feedbackConnectQQ {
    return Intl.message(
      'Contact QQ group:704273239',
      name: 'feedbackConnectQQ',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your contact information`
  String get feedbackConnectHint {
    return Intl.message(
      'Please enter your contact information',
      name: 'feedbackConnectHint',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get feedbackSubmit {
    return Intl.message('Submit', name: 'feedbackSubmit', desc: '', args: []);
  }

  /// `Choose up to 4~`
  String get feedbackToast {
    return Intl.message(
      'Choose up to 4~',
      name: 'feedbackToast',
      desc: '',
      args: [],
    );
  }

  /// `Feedback success!`
  String get feedbackSuccess {
    return Intl.message(
      'Feedback success!',
      name: 'feedbackSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in the feedback content!`
  String get feedbackContent {
    return Intl.message(
      'Please fill in the feedback content!',
      name: 'feedbackContent',
      desc: '',
      args: [],
    );
  }

  /// `Points details`
  String get pointsDetailTitle {
    return Intl.message(
      'Points details',
      name: 'pointsDetailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get settingTitle {
    return Intl.message('Setting', name: 'settingTitle', desc: '', args: []);
  }

  /// `Language`
  String get settingLanguage {
    return Intl.message(
      'Language',
      name: 'settingLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Follow System`
  String get settingLanguageDefault {
    return Intl.message(
      'Follow System',
      name: 'settingLanguageDefault',
      desc: '',
      args: [],
    );
  }

  /// `Clear cache`
  String get settingCache {
    return Intl.message(
      'Clear cache',
      name: 'settingCache',
      desc: '',
      args: [],
    );
  }

  /// `Clear cache successfully!`
  String get settingCacheSuccess {
    return Intl.message(
      'Clear cache successfully!',
      name: 'settingCacheSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to clear cache!`
  String get settingCacheFail {
    return Intl.message(
      'Failed to clear cache!',
      name: 'settingCacheFail',
      desc: '',
      args: [],
    );
  }

  /// `Theme Colors`
  String get settingThemeColors {
    return Intl.message(
      'Theme Colors',
      name: 'settingThemeColors',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get settingExitLogin {
    return Intl.message(
      'Sign out',
      name: 'settingExitLogin',
      desc: '',
      args: [],
    );
  }

  /// `Refresh successfully`
  String get pointsNotifySuccess {
    return Intl.message(
      'Refresh successfully',
      name: 'pointsNotifySuccess',
      desc: '',
      args: [],
    );
  }

  /// `No more data`
  String get refreshNoData {
    return Intl.message(
      'No more data',
      name: 'refreshNoData',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load!`
  String get refreshError {
    return Intl.message(
      'Failed to load!',
      name: 'refreshError',
      desc: '',
      args: [],
    );
  }

  /// `Drop-down loading`
  String get refreshPull {
    return Intl.message(
      'Drop-down loading',
      name: 'refreshPull',
      desc: '',
      args: [],
    );
  }

  /// `Pull up to refresh`
  String get refreshHeaderIdle {
    return Intl.message(
      'Pull up to refresh',
      name: 'refreshHeaderIdle',
      desc: '',
      args: [],
    );
  }

  /// `Release refresh`
  String get refreshHeaderFreed {
    return Intl.message(
      'Release refresh',
      name: 'refreshHeaderFreed',
      desc: '',
      args: [],
    );
  }

  /// `Refresh failed!`
  String get refreshHeaderFailed {
    return Intl.message(
      'Refresh failed!',
      name: 'refreshHeaderFailed',
      desc: '',
      args: [],
    );
  }

  /// `Refresh successfully`
  String get refreshHeaderSuccess {
    return Intl.message(
      'Refresh successfully',
      name: 'refreshHeaderSuccess',
      desc: '',
      args: [],
    );
  }

  /// `My collection`
  String get collectTitle {
    return Intl.message(
      'My collection',
      name: 'collectTitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get enter {
    return Intl.message('Confirm', name: 'enter', desc: '', args: []);
  }

  /// `Quit`
  String get quit {
    return Intl.message('Quit', name: 'quit', desc: '', args: []);
  }

  /// `Practical blog app recommended to you`
  String get shareApplication {
    return Intl.message(
      'Practical blog app recommended to you',
      name: 'shareApplication',
      desc: '',
      args: [],
    );
  }

  /// `Bosera, your blog steward`
  String get shareHint {
    return Intl.message(
      'Bosera, your blog steward',
      name: 'shareHint',
      desc: '',
      args: [],
    );
  }

  /// `Save to local`
  String get shareSaveLocal {
    return Intl.message(
      'Save to local',
      name: 'shareSaveLocal',
      desc: '',
      args: [],
    );
  }

  /// `Browser opens`
  String get shareBrowser {
    return Intl.message(
      'Browser opens',
      name: 'shareBrowser',
      desc: '',
      args: [],
    );
  }

  /// `Saved successfully`
  String get saveSuccess {
    return Intl.message(
      'Saved successfully',
      name: 'saveSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Saved fail`
  String get saveFail {
    return Intl.message('Saved fail', name: 'saveFail', desc: '', args: []);
  }

  /// `FrontPage`
  String get tabHome {
    return Intl.message('FrontPage', name: 'tabHome', desc: '', args: []);
  }

  /// `Square`
  String get tabSquare {
    return Intl.message('Square', name: 'tabSquare', desc: '', args: []);
  }

  /// `Q&A`
  String get tabAsk {
    return Intl.message('Q&A', name: 'tabAsk', desc: '', args: []);
  }

  /// `Search what you want`
  String get searchHint {
    return Intl.message(
      'Search what you want',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Search history`
  String get searchHistory {
    return Intl.message(
      'Search history',
      name: 'searchHistory',
      desc: '',
      args: [],
    );
  }

  /// `Hot search list`
  String get searchHotWord {
    return Intl.message(
      'Hot search list',
      name: 'searchHotWord',
      desc: '',
      args: [],
    );
  }

  /// `No more content~`
  String get refreshEmpty {
    return Intl.message(
      'No more content~',
      name: 'refreshEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Recommend a wave of excellent technical public accounts~`
  String get tabWechatPublic {
    return Intl.message(
      'Recommend a wave of excellent technical public accounts~',
      name: 'tabWechatPublic',
      desc: '',
      args: [],
    );
  }

  /// `Change batch  `
  String get tabWechatSwitch {
    return Intl.message(
      'Change batch  ',
      name: 'tabWechatSwitch',
      desc: '',
      args: [],
    );
  }

  /// `not interested`
  String get tabWechatDelete {
    return Intl.message(
      'not interested',
      name: 'tabWechatDelete',
      desc: '',
      args: [],
    );
  }

  /// `Browsing History`
  String get historyTitle {
    return Intl.message(
      'Browsing History',
      name: 'historyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Share articles`
  String get shareArticleTitle {
    return Intl.message(
      'Share articles',
      name: 'shareArticleTitle',
      desc: '',
      args: [],
    );
  }

  /// `Share to this app`
  String get shareArticleEnter {
    return Intl.message(
      'Share to this app',
      name: 'shareArticleEnter',
      desc: '',
      args: [],
    );
  }

  /// `Give the article a loud title~`
  String get shareArticleHint {
    return Intl.message(
      'Give the article a loud title~',
      name: 'shareArticleHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the title of the article~`
  String get shareArticleEdit {
    return Intl.message(
      'Please enter the title of the article~',
      name: 'shareArticleEdit',
      desc: '',
      args: [],
    );
  }

  /// `Successful sharing`
  String get shareArticleSuccess {
    return Intl.message(
      'Successful sharing',
      name: 'shareArticleSuccess',
      desc: '',
      args: [],
    );
  }

  /// `My share`
  String get shareTitle {
    return Intl.message('My share', name: 'shareTitle', desc: '', args: []);
  }

  /// `Collection success`
  String get collectSuccess {
    return Intl.message(
      'Collection success',
      name: 'collectSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Unfavorite successfully`
  String get collectQuit {
    return Intl.message(
      'Unfavorite successfully',
      name: 'collectQuit',
      desc: '',
      args: [],
    );
  }

  /// `Don't support likes at the moment~`
  String get notSupportLikes {
    return Intl.message(
      'Don\'t support likes at the moment~',
      name: 'notSupportLikes',
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
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
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
