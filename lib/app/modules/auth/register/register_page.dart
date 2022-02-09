import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:rango_mobile/app/core/ui/rango_state.dart';
import 'package:rango_mobile/app/core/ui/widgets/rango_appbar.dart';
import 'package:rango_mobile/app/core/ui/widgets/rango_button.dart';
import 'package:rango_mobile/app/core/ui/widgets/rango_textformfield.dart';
import 'package:rango_mobile/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RangoState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RangoAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 19, bottom: 6),
                          child: Text(
                            'Cadastre-se',
                            style: context.textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme.primaryColorDark,
                              fontSize: 27,
                            ),
                          ),
                        ),
                        const Text(
                          'Preencha os campos abaixo pra criar seu cadastro.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        RangoTextformfield(
                          label: 'Nome',
                          controller: _nameEC,
                          validator: Validatorless.required('Nome Obrigatório'),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        RangoTextformfield(
                          label: 'E-mail',
                          controller: _emailEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('E-mail Obrigatório'),
                            Validatorless.email('E-mail Inválido'),
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
                            Validatorless.required('Password Obrigatório'),
                            Validatorless.min(
                                6, 'Senha deve conter no minimo 6 caracteres'),
                          ]),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        RangoTextformfield(
                          label: 'Confirmar Senha',
                          obscureText: true,
                          validator: Validatorless.multiple([
                            Validatorless.required(
                                'Confirmar senha obrigatoria'),
                            Validatorless.compare(_passwordEC,
                                'Senha diferente de confirmar senha'),
                          ]),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: RangoButton(
                            width: context.width,
                            label: 'CADASTRAR',
                            onPressed: () {
                              final formValid =
                                  _formKey.currentState?.validate() ?? false;
                              if (formValid) {
                                controller.register(
                                  name: _nameEC.text,
                                  email: _emailEC.text,
                                  password: _passwordEC.text,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
