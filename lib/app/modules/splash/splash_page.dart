import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rango_mobile/app/core/ui/widgets/rango_button.dart';
import 'package:rango_mobile/app/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              width: context.width / 1.3,
              height: context.height / 1.9,
              child: Image.asset(
                'assets/images/RangoIcon.png',
                scale: 2.1,
              ),
            ),
            SizedBox(
              width: context.widthTransformer(reducedBy: 40),
              height: 45,
              child: RangoButton(
                label: 'ACESSAR',
                onPressed: () => controller.checkLogged(),
              ),
            ),
            const Spacer(),
            Text(
              'Version 1.0',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
