import 'package:flutter/material.dart';
import 'package:queue_up/misc/txt_style.dart';
import 'package:queue_up/shared/components/base_window.dart';
import 'package:queue_up/shared/components/dialog/action_btn.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _userField = TextEditingController();
  final _passField = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseWindow(
      enableScroll: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          // Title
          Row(
            spacing: 12,
            children: [
              Icon(Icons.login),
              Text('Login', style: TxtStyle.getHeadline(context)),
            ],
          ),
          // Form
          Form(
            key: _formKey,
            child: Column(
              spacing: 8,
              children: [
                TextFormField(
                  controller: _userField,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.person),
                    label: Text('Username'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                TextFormField(
                  controller: _passField,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.password),
                    label: Text('Password'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            // TODO:
            child: ActionBtn(
              onTap: _formKey.currentState?.validate ?? () => {},
              text: "Login",
              isPrimary: true,
            ),
          ),
        ],
      ),
    );
  }
}
