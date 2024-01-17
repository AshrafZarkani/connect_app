import 'package:connect_app/app/config/theme/my_colors.dart';
import 'package:connect_app/app/core/extensions/build_context_extinsion.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

mixin PickAnImageFromBottomSheet {
  showCustomBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: context.screenHeight * 0.3,
          width: context.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();

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
      },
    );
  }
}
