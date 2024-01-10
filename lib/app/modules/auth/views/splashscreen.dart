import 'package:connect_app/app/config/router/my_named_routes.dart';
import 'package:connect_app/app/core/extensions/build_context_extinsion.dart';
import 'package:connect_app/app/core/extensions/string_extenstion.dart';
import 'package:connect_app/app/modules/auth/domain/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkIfUserAuthinticated =
        ref.watch(checkIfAuthinticatedFutureProvider);
    return Scaffold(
      body: Center(
        child: checkIfUserAuthinticated.when(
          data: (data) {
            if (data.value?.uid != null) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                GoRouter.of(context).goNamed(MyNamedRoutes.chats);
              });
            } else {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                GoRouter.of(context).goNamed(MyNamedRoutes.register);
              });
            }
            return Center(child: Text("Spash"));
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
        ),
      ),
    );
  }
}
