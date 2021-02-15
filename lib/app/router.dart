import 'package:auto_route/auto_route_annotations.dart';
import 'package:my_book_reloaded/ui/views/account_info_view/account_info_view.dart';
import 'package:my_book_reloaded/ui/views/audio_intro_view/audio_intro_view.dart';
import 'package:my_book_reloaded/ui/views/base_template_view/base_template_view.dart';
import 'package:my_book_reloaded/ui/views/book_view/base_book_view.dart';
import 'package:my_book_reloaded/ui/views/chapter_view/chapter_view.dart';
import 'package:my_book_reloaded/ui/views/input_template_view/input_template_view.dart';
import 'package:my_book_reloaded/ui/views/join_us_view/join_us_view.dart';
import 'package:my_book_reloaded/ui/views/legal_view/legal_view.dart';
import 'package:my_book_reloaded/ui/views/main_view/main_view.dart';
import 'package:my_book_reloaded/ui/views/notifications_view/notifications_view.dart';
import 'package:my_book_reloaded/ui/views/onboarding_view/onboarding_view.dart';
import 'package:my_book_reloaded/ui/views/reminder_view/reminder_view.dart';
import 'package:my_book_reloaded/ui/views/stats_details_view/stats_details_view.dart';
import 'package:my_book_reloaded/ui/views/subscription_view/subscription_view.dart';
import 'package:my_book_reloaded/ui/views/success_view/success_view.dart';
import 'package:my_book_reloaded/ui/views/support_view/support_view.dart';

// flutter packages pub run build_runner watch

@AdaptiveAutoRouter(routes: [
  AdaptiveRoute(page: OnboardingView, name: "OnboardingView", initial: true),
  AdaptiveRoute(page: JoinUsView, name: "JoinUsView"),
  AdaptiveRoute(page: SuccessView, name: "SuccessView"),
  AdaptiveRoute(page: MainView, name: "MainView"),
  AdaptiveRoute(page: BaseBookView, name: "BaseBookView"),
  AdaptiveRoute(page: ReminderView, name: "ReminderView"),
  AdaptiveRoute(page: StatsDetailsView, name: "StatsDetailsView"),
  AdaptiveRoute(page: AccountInfoView, name: "AccountInfoView"),
  AdaptiveRoute(page: ChapterView, name: "ChapterView"),
  AdaptiveRoute(page: SupportView, name: "SupportView"),
  AdaptiveRoute(page: NotificationsView, name: "NotificationsView"),
  AdaptiveRoute(page: LegalView, name: "LegalView"),
  AdaptiveRoute(page: AudioIntroView, name: "AudioIntroView"),
  AdaptiveRoute(page: BaseTemplateView, name: "BaseTemplateView"),
  AdaptiveRoute(page: SubscriptionView, name: "SubscriptionView"),
  AdaptiveRoute(page: InputTemplateView, name: "InputTemplateView"),
])
class $Router {}
