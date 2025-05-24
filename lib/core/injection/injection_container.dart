
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


final sl = GetIt.instance; //service locator

@InjectableInit()
void configureGeneratedDependencies() => sl.init();

Future<void> setupDependencyInjection() async {
  configureGeneratedDependencies();
}
