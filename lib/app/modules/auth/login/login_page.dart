import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:rango_mobile/app/core/ui/rango_state.dart';
import 'package:rango_mobile/app/core/ui/rango_ui.dart';
import 'package:rango_mobile/app/core/ui/widgets/rango_appbar.dart';
import 'package:rango_mobile/app/core/ui/widgets/rango_button.dart';
import 'package:rango_mobile/app/core/ui/widgets/rango_textformfield.dart';
import 'package:rango_mobile/app/modules/auth/login/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends RangoState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RangoAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 19),
                    child: Text(
                      'Login',
                      style: context.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark,
                        fontSize: 27,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RangoTextformfield(
                    label: 'E-mail',
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail obrigatorio'),
                      Validatorless.email('E-mail invalido'),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RangoTextformfield(
                    label: 'Senha',
                    obscureText: true,
                    controller: _passwordEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrigatoria'),
                      Validatorless.min(
                          6, 'Senha deve conter no minimo 6 caracteres'),
                    ]),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: RangoButton(
                      width: context.width,
                      label: 'ENTRAR',
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          controller.login(
                            email: _emailEC.text,
                            password: _passwordEC.text,
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: context.height / 2.8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Não possui uma conta?'),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('/auth/register');
                        },
                        child: const Text(
                          'Cadastro',
                          style: RangoUI.textBold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
