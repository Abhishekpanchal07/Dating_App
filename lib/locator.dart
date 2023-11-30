import 'package:demoapp/providers/getting_user_details.dart';
import 'package:demoapp/providers/homepage_bottomnavigation_provider.dart';
import 'package:demoapp/services/api.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerFactory(() => GettingUserDetailsProvider());
  locator.registerFactory(() => HomePageProvider());
}
