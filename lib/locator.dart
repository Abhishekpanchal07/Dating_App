import 'package:demoapp/providers/getting_user_details.dart';
import 'package:demoapp/services/api.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerFactory(() => GettingUserDetailsProvider());
}
