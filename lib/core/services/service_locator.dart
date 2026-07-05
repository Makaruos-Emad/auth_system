import 'package:auth_system/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:auth_system/features/profile/data/datasource/profile_remote_data_source_impl.dart';
import 'package:auth_system/features/profile/data/repositories/profile_repository.dart';
import 'package:auth_system/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:auth_system/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/datasource/auth_remote_data_source.dart';
import '../../features/auth/data/datasource/auth_remote_data_source_impl.dart';
import '../../features/auth/data/repositories/auth_repository.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Data Source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  // AuthCubit
  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(getIt<AuthRepository>()),
  );

  // Profile DataSource
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(),
  );

  // Profile Repository
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(getIt<ProfileRemoteDataSource>()),
  );

  // Profile Cubit
  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(getIt<ProfileRepository>()),
  );
}
