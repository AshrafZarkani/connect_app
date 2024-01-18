import 'package:connect_app/app/config/theme/my_colors.dart';
import 'package:connect_app/app/core/extensions/build_context_extinsion.dart';
import 'package:connect_app/app/modules/one_to_one_chat/domian/providers/messaging_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

mixin PickAnImageFromBottomSheet {
  showCustomBottomSheet(BuildContext context,
      {required String senderId, required String recieverId}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Consumer(builder: (context, ref, child) {
          final chatMessageProv = ref.read(chatMessageProvider.notifier);
          return SizedBox(
            height: context.screenHeight * 0.3,
            width: context.screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                    chatMessageProv.getImageFromGallery(
                        senderId: senderId, recieverId: recieverId);

                    /// toaccess photo gallery
                  },
                  child: Text(
                    context.translate.photoGallery,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.pop();
                    chatMessageProv.getImageFromCamera(
                        senderId: senderId, recieverId: recieverId);

                    /// to access photo camera
                  },
                  child: Text(
                    context.translate.cameraImage,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.pop();
                    chatMessageProv.cancel();

                    /// to access photo camera
                  },
                  child: Text(
                    context.translate.cancel,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: MyColors.primary_500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
