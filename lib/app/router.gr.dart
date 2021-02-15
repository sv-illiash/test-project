// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/models/book_object.dart';
import '../ui/views/account_info_view/account_info_view.dart';
import '../ui/views/audio_intro_view/audio_intro_view.dart';
import '../ui/views/base_template_view/base_template_view.dart';
import '../ui/views/book_view/base_book_view.dart';
import '../ui/views/chapter_view/chapter_view.dart';
import '../ui/views/input_template_view/input_template_view.dart';
import '../ui/views/join_us_view/join_us_view.dart';
import '../ui/views/legal_view/legal_view.dart';
import '../ui/views/main_view/main_view.dart';
import '../ui/views/notifications_view/notifications_view.dart';
import '../ui/views/onboarding_view/onboarding_view.dart';
import '../ui/views/reminder_view/reminder_view.dart';
import '../ui/views/stats_details_view/stats_details_view.dart';
import '../ui/views/subscription_view/subscription_view.dart';
import '../ui/views/success_view/success_view.dart';
import '../ui/views/support_view/support_view.dart';

class Routes {
  static const String OnboardingView = '/';
  static const String JoinUsView = '/join-us-view';
  static const String SuccessView = '/success-view';
  static const String MainView = '/main-view';
  static const String BaseBookView = '/base-book-view';
  static const String ReminderView = '/reminder-view';
  static const String StatsDetailsView = '/stats-details-view';
  static const String AccountInfoView = '/account-info-view';
  static const String ChapterView = '/chapter-view';
  static const String SupportView = '/support-view';
  static const String NotificationsView = '/notifications-view';
  static const String LegalView = '/legal-view';
  static const String AudioIntroView = '/audio-intro-view';
  static const String BaseTemplateView = '/base-template-view';
  static const String SubscriptionView = '/subscription-view';
  static const String InputTemplateView = '/input-template-view';
  static const all = <String>{
    OnboardingView,
    JoinUsView,
    SuccessView,
    MainView,
    BaseBookView,
    ReminderView,
    StatsDetailsView,
    AccountInfoView,
    ChapterView,
    SupportView,
    NotificationsView,
    LegalView,
    AudioIntroView,
    BaseTemplateView,
    SubscriptionView,
    InputTemplateView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.OnboardingView, page: OnboardingView),
    RouteDef(Routes.JoinUsView, page: JoinUsView),
    RouteDef(Routes.SuccessView, page: SuccessView),
    RouteDef(Routes.MainView, page: MainView),
    RouteDef(Routes.BaseBookView, page: BaseBookView),
    RouteDef(Routes.ReminderView, page: ReminderView),
    RouteDef(Routes.StatsDetailsView, page: StatsDetailsView),
    RouteDef(Routes.AccountInfoView, page: AccountInfoView),
    RouteDef(Routes.ChapterView, page: ChapterView),
    RouteDef(Routes.SupportView, page: SupportView),
    RouteDef(Routes.NotificationsView, page: NotificationsView),
    RouteDef(Routes.LegalView, page: LegalView),
    RouteDef(Routes.AudioIntroView, page: AudioIntroView),
    RouteDef(Routes.BaseTemplateView, page: BaseTemplateView),
    RouteDef(Routes.SubscriptionView, page: SubscriptionView),
    RouteDef(Routes.InputTemplateView, page: InputTemplateView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    OnboardingView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => OnboardingView(),
        settings: data,
      );
    },
    JoinUsView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => JoinUsView(),
        settings: data,
      );
    },
    SuccessView: (data) {
      final args = data.getArgs<SuccessViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SuccessView(
          key: args.key,
          title: args.title,
          nextRoute: args.nextRoute,
        ),
        settings: data,
      );
    },
    MainView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => MainView(),
        settings: data,
      );
    },
    BaseBookView: (data) {
      final args = data.getArgs<BaseBookViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => BaseBookView(
          key: args.key,
          bookObject: args.bookObject,
        ),
        settings: data,
      );
    },
    ReminderView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ReminderView(),
        settings: data,
      );
    },
    StatsDetailsView: (data) {
      final args = data.getArgs<StatsDetailsViewArguments>(
        orElse: () => StatsDetailsViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => StatsDetailsView(
          key: args.key,
          statObject: args.statObject,
        ),
        settings: data,
      );
    },
    AccountInfoView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => AccountInfoView(),
        settings: data,
      );
    },
    ChapterView: (data) {
      final args = data.getArgs<ChapterViewArguments>(
        orElse: () => ChapterViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ChapterView(
          key: args.key,
          chapterObject: args.chapterObject,
        ),
        settings: data,
      );
    },
    SupportView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SupportView(),
        settings: data,
      );
    },
    NotificationsView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => NotificationsView(),
        settings: data,
      );
    },
    LegalView: (data) {
      final args = data.getArgs<LegalViewArguments>(
        orElse: () => LegalViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => LegalView(
          key: args.key,
          data: args.data,
        ),
        settings: data,
      );
    },
    AudioIntroView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => AudioIntroView(),
        settings: data,
      );
    },
    BaseTemplateView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => BaseTemplateView(),
        settings: data,
      );
    },
    SubscriptionView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SubscriptionView(),
        settings: data,
      );
    },
    InputTemplateView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => InputTemplateView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SuccessView arguments holder class
class SuccessViewArguments {
  final Key key;
  final String title;
  final String nextRoute;
  SuccessViewArguments({this.key, @required this.title, this.nextRoute});
}

/// BaseBookView arguments holder class
class BaseBookViewArguments {
  final Key key;
  final BookObject bookObject;
  BaseBookViewArguments({this.key, @required this.bookObject});
}

/// StatsDetailsView arguments holder class
class StatsDetailsViewArguments {
  final Key key;
  final BookObject statObject;
  StatsDetailsViewArguments({this.key, this.statObject});
}

/// ChapterView arguments holder class
class ChapterViewArguments {
  final Key key;
  final ChapterObject chapterObject;
  ChapterViewArguments({this.key, this.chapterObject});
}

/// LegalView arguments holder class
class LegalViewArguments {
  final Key key;
  final String data;
  LegalViewArguments({this.key, this.data});
}
