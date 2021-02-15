import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_book_reloaded/app/locator.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies(String environment) async {
  //External
  $initGetIt(locator, environment: environment);
}
