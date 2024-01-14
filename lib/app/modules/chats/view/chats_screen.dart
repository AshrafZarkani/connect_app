import 'package:connect_app/app/config/router/my_named_routes.dart';
import 'package:connect_app/app/config/theme/my_colors.dart';
import 'package:connect_app/app/core/extensions/build_context_extinsion.dart';
import 'package:connect_app/app/modules/auth/domain/providers/auth_providers.dart';
import 'package:connect_app/app/modules/chats/domain/providers/chats_providers.dart';
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
      body: Consumer(builder: (context, ref, child) {
        final userList = ref.watch(fetchUsersProvider);
        return userList.when(
            data: (data) {
              if (data.isNotEmpty) {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            context.pushNamed(MyNamedRoutes.chatDetails,
                                extra: data[index]);
                          },
                          title: Text(data[index].username.toString()),
                          subtitle: Text(data[index].email),
                        ),
                      );
                    });
              }
              return SizedBox();
            },
            error: (error, stackTrace) {
              return Center(
                child: Text(error.toString()),
              );
            },
            loading: () => Center(child: CircularProgressIndicator()));
      }),
    );
  }
}
