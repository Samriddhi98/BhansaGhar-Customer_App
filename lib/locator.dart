import 'package:BhansaGhar/providers/cart.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void initLocator() {
  locator.registerLazySingleton(() => Cart());
 
}
