import 'package:connect_app/app/config/router/my_named_routes.dart';
import 'package:connect_app/app/config/theme/my_colors.dart';
import 'package:connect_app/app/core/extensions/build_context_extinsion.dart';
import 'package:connect_app/app/modules/auth/domain/providers/auth_providers.dart';
import 'package:connect_app/app/modules/auth/widgets/my_forms_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);
    final authState = ref.watch(authControllerProvider);
    final formProvider = ref.watch(authFormController);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primary_500,
        automaticallyImplyLeading: false,
        title: Text(
          context.translate.register,
          style: context.textTheme.headlineMedium?.copyWith(
            color: MyColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.screenHeight * 0.2,
              ),
              MyFormFields(
                formKey: formKey,
              ),
              SizedBox(
                height: context.screenHeight * 0.04,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() == true) {
                    authController
                        .register(
                            email: formProvider.email,
                            username: formProvider.userName,
                            password: formProvider.password)
                        .then((value) {
                      if (value == true) {
                        context.goNamed(MyNamedRoutes.chats);
                      }
                    });
                  }
                },
                child: Text(
                  context.translate.register,
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.04,
              ),
              TextButton(
                onPressed: () {
                  authController.googleSign().then((value) {
                    if (value == true) {
                      GoRouter.of(context).goNamed(MyNamedRoutes.chats);
                    }
                  });
                },
                child: Text(
                  context.translate.googleSign,
                  style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold, color: MyColors.primary_500),
                ),
              ),
              Visibility(
                  visible: authState.isLoading == true,
                  child: Center(child: CircularProgressIndicator()))
            ],
          ),
        ),
      ),
    );
  }
}
