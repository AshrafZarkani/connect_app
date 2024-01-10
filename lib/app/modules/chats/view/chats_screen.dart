import 'package:connect_app/app/config/router/my_named_routes.dart';
import 'package:connect_app/app/config/theme/my_colors.dart';
import 'package:connect_app/app/core/extensions/build_context_extinsion.dart';
import 'package:connect_app/app/modules/auth/domain/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate.chats),
      ),
      body: Center(
          child: Column(
        children: [
          Text(context.translate.chats),
          SizedBox(
            height: context.screenHeight * 0.1,
          ),
          Consumer(builder: (context, WidgetRef ref, child) {
            final authProvider = ref.read(authControllerProvider.notifier);
            return IconButton(
              onPressed: () {
                authProvider.signOut().then((value) {
                  if (value == true) {
                    context.goNamed(MyNamedRoutes.register);
                  }
                });
              },
              icon: Icon(
                Icons.logout,
                color: MyColors.black,
              ),
            );
          }),
        ],
      )),
    );
  }
}
