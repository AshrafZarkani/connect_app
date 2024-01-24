import 'package:connect_app/app/core/extensions/build_context_extinsion.dart';
import 'package:flutter/material.dart';

abstract class BottomNavBarItem {
  static List<BottomNavigationBarItem> navtabs(BuildContext context) {
    return [
      BottomNavigationBarItem(
        icon: const Icon(Icons.message_outlined),
        label: context.translate.chats,
        activeIcon: const Icon(
          Icons.message_outlined,
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.location_on),
        label: context.translate.location,
        activeIcon: Icon(Icons.location_on),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: context.translate.profile,
        activeIcon: Icon(Icons.person),
      ),
    ];
  }
}
