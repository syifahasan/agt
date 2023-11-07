import 'package:authentic_guards/data/repository/remote/profile_repository.dart';
import 'package:authentic_guards/data/repository/remote/auth_repository.dart';
import 'package:authentic_guards/data/repository/remote/scanner_repository.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
// import 'package:agt/app/data/provider/jnc_client.dart';
// import 'package:agt/app/data/repository/remote/auth_repository.dart';
// import 'package:agt/app/data/repository/remote/product_repository.dart';
// import 'package:agt/app/data/repository/remote/profile_repository.dart';
// import 'package:agt/app/data/repository/remote/scanner_repository.dart';
// import 'package:agt/app/views/auth/controller/auth_controller.dart';

import '../provider/dio_client.dart';

final inject = GetIt.instance;

Future<void> init(String baseUrl) async {
  // Get.put(() => () {
  //   return AuthController(
  //       auth: AuthRepositoryImpl(dio: inject()));
  // },permanent: true);

  //Remote
  inject.registerLazySingleton(() => DioClient(baseUrl));
  inject.registerLazySingleton(() => inject<DioClient>().dio);
  inject.registerLazySingleton(() => AuthRepositoryImpl(dio: inject()));
  inject.registerLazySingleton(() => ScannerRepositoryImpl(inject()));
  inject.registerLazySingleton(() => ProfileRepositoryImpl(inject()));
  // inject.registerLazySingleton(() => ProductRepositoryImpl());
}

Future<void> initJncClient(String baseUrl) async {
  // inject.registerLazySingleton(() => JncClient(baseUrl));
  // inject.registerLazySingleton(() => inject<JncClient>().dio);
  // inject.registerLazySingleton(() => ProductRepositoryImpl(inject()));
}
