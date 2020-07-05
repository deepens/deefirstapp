// import 'package:compound/services/authentication_service.dart';
// import 'package:compound/services/cloud_storage_service.dart';
// import 'package:compound/services/firestore_service.dart';
// import 'package:compound/utils/image_selector.dart';
import 'package:deefirstapp/services/signout_service.dart';
import 'package:get_it/get_it.dart';
// import 'package:compound/services/navigation_service.dart';
// import 'package:compound/services/dialog_service.dart';
import '../services/auth_service.dart';
import '../services/msg_service.dart';
import '../services/user_service.dart';
import '../services/dialog_service.dart';
import '../services/navigation_service.dart';
import '../services/loading_service.dart';
import '../services/pushnotification_service.dart';
import '../services/shareddata_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => MsgService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => LoadingService());
  locator.registerLazySingleton(() => PushNotificationService());
  locator.registerLazySingleton(() => SharedDataService());
  locator.registerLazySingleton(() => SignOutService());
}
