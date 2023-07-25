import 'package:animation/modules/pagination/repo/posts_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../network/dio_factory.dart';
import '../network/network_info.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() async {
    ///Dio Factory
    getIt.registerLazySingleton<DioFactory>(() => DioFactory());

    /// Network info
    getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

    /// Network Connection checker
    getIt.registerLazySingleton<InternetConnectionChecker>(
        () => InternetConnectionChecker());

    /// Posts Repository
    getIt.registerLazySingleton<PostsRepo>(() => PostsRepo());
  }
}
