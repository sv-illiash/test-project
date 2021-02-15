// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../core/services/auth/auth_service.dart';
import '../core/services/auth/auth_service_impl.dart';
import '../core/services/books/books_service.dart';
import '../core/services/books/books_service_impl.dart';
import '../core/services/bottom_sheet/bottom_sheet_service.dart';
import '../core/services/bottom_sheet/bottom_sheet_service_impl.dart';
import '../core/services/dialog/dialog_service.dart';
import '../core/services/dialog/dialog_service_impl.dart';
import '../core/services/json/json_service.dart';
import '../core/services/json/json_service_impl.dart';
import '../core/services/navigation/navigation_service.dart';
import '../core/services/navigation/navigation_service_impl.dart';
import '../core/services/onboarding/onboarding_service.dart';
import '../core/services/onboarding/onboarding_service_impl.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<AuthService>(() => AuthServiceImpl());
  gh.lazySingleton<BooksService>(() => BooksServiceImpl());
  gh.lazySingleton<BottomSheetService>(() => BottomSheetServiceImpl());
  gh.lazySingleton<DialogService>(() => DialogServiceImpl());
  gh.lazySingleton<JsonService>(() => JsonServiceImpl());
  gh.lazySingleton<NavigationService>(() => NavigationServiceImpl());
  gh.lazySingleton<OnboardingService>(() => OnboardingServiceImpl());
  return get;
}
