import 'package:connect_app/app/config/theme/my_colors.dart';
import 'package:connect_app/app/modules/one_to_one_chat/domian/models/message.dart';
import 'package:flutter/material.dart';

class RecieverMssageBubble extends StatelessWidget {
  const RecieverMssageBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.greyscale_500,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                message.message.startsWith("https")
                    ? Image.network(message.message)
                    : Text(
                        message.message.toString(),
                      ),
                SizedBox(
                  height: 12,
                ),
                Text(message.timeStamp.toString())
              ],
            ),
          ),
        ),
      ],
    );
  }
}
