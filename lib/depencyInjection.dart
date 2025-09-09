import 'package:ecommerce_store/Features/Auth/Domain/Repository/auth_repository.dart';
import 'package:ecommerce_store/Features/Auth/data/auth_remote_data_source.dart';
import 'package:ecommerce_store/Features/Navigation/Data/navigation_remote_data_source.dart';
import 'package:ecommerce_store/Features/Navigation/Domain/Repository/navigation_repository.dart';
import 'package:ecommerce_store/Features/Navigation/Presentation/NavigationBlocs/navigation_bloc.dart';
import 'package:ecommerce_store/Features/ProductDetails/Data/product_remote_data_source.dart';
import 'package:ecommerce_store/Features/ProductDetails/Domain/ProductRepository/product_repository.dart';
import 'package:ecommerce_store/Features/ProductDetails/Presentation/ProductsBloc/products_bloc.dart';
import 'package:ecommerce_store/Features/Settings/data/settings_remote_data_source.dart';
import 'package:ecommerce_store/Features/Settings/domain/Repository/settings_repository.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'Features/Auth/Presentation/AuthBloc/auth_bloc.dart';
import 'Features/Settings/Presentaion/settingBloc/settings_bloc.dart';
import 'firebase_options.dart';

final injector = GetIt.instance;
Future<void> initialize() async {
  await firebaseInitialize();
  auth();
  settings();
  products();
  wish();
}

Future<void> firebaseInitialize() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void auth() {
  injector.registerFactory(() => AuthRemoteDataSourceImpl());
  injector.registerFactory(() => AuthRepository(impl: injector()));
  injector.registerSingleton(AuthBloc(rep: injector()));
}
void wish() {
  injector.registerFactory(() => NavigationRemoteDataSourceImpl());
  injector.registerFactory(() => NavigationRepository(impl: injector()));
  injector.registerSingleton(WishBloc(injector()));
}

void settings() {
  injector.registerFactory(() => SettingsRemoteDataSourceImpl());
  injector.registerFactory(() => SettingsRepository(impl: injector()));
  injector.registerSingleton(SettingsBloc(injector()));
}

void products() {
  injector.registerFactory(() => ProductRemoteDataSourceImpl());
  injector.registerFactory(() => ProductRepository(impl: injector()));
  injector.registerSingleton(ProductsBloc(injector()));
}
