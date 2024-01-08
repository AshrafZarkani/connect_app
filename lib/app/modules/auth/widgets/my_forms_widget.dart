import 'package:connect_app/app/core/extensions/build_context_extinsion.dart';
import 'package:connect_app/app/modules/auth/domain/helper/auth_validators.dart';
import 'package:connect_app/app/modules/auth/widgets/my_textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyFormFields extends StatefulWidget {
  const MyFormFields({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<MyFormFields> createState() => _MyFormFieldsState();
}

class _MyFormFieldsState extends State<MyFormFields> {
  final _authValidators = AuthValidators();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode userNameNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    userNameNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Consumer(builder: (context, ref, child) {
              return MyTextFormField(
                textEditingController: emailController,
                myFocusNode: emailNode,
                myTextInputAction: TextInputAction.next,
                labelText: context.translate.email,
                prefexIcon: const Icon(Icons.email),
                obsecureText: false,
                onChanged: (val) {
                  print("email value $val");
                },
                validator: (value) {
                  return _authValidators.emailValidator(value);
                },
              );
            }),
            SizedBox(
              height: context.screenHeight * 0.03,
            ),
            MyTextFormField(
              textEditingController: userNameController,
              obsecureText: false,
              myFocusNode: userNameNode,
              validator: (input) => _authValidators.userNameValidator(input),
              prefexIcon: const Icon(Icons.person),
              labelText: context.translate.userName,
              myTextInputAction: TextInputAction.next,
              onChanged: (value) {
                //user name
              },
            ),
            SizedBox(
              height: context.screenHeight * 0.03,
            ),
            MyTextFormField(
              textEditingController: passwordController,
              obsecureText: false,
              myFocusNode: passwordNode,
              validator: (input) => _authValidators.passwordVlidator(input),
              prefexIcon: const Icon(Icons.password),
              labelText: context.translate.password,
              myTextInputAction: TextInputAction.next,
              onChanged: (value) {},
              suffexIcon: const Icon(Icons.remove_red_eye_outlined),
            ),
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
