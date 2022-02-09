import 'package:get/get.dart';
import 'package:rango_mobile/app/modules/auth/register/register_controller.dart';
import 'package:rango_mobile/app/repositories/auth/auth_repository.dart';
import 'package:rango_mobile/app/repositories/auth_repository_impl.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        restClient: Get.find(),
      ),
    );

    Get.lazyPut(
      () => RegisterController(authRepository: Get.find()),
    );
  }
}
