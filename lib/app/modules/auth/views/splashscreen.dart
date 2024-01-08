import 'package:connect_app/app/core/extensions/build_context_extinsion.dart';
import 'package:connect_app/app/core/extensions/string_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.amber,
            height: context.screenHeight * 0.3,
            width: context.screenWidth * 0.3,
            child: Center(child: Text(context.translate.login))),
      ),
    );
  }
}
