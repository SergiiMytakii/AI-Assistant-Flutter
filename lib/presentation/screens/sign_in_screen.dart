import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template/core/constants/constants.dart';
import 'package:my_template/injection.dart';
import 'package:my_template/presentation/bloc/bloc/auth_bloc.dart';
import 'package:my_template/presentation/screens/widget/alert_dialog.dart';
import 'package:my_template/presentation/screens/widget/my_text_button.dart';
import 'package:my_template/presentation/screens/widget/my_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    _emailController.text = 'test@gmail.com';
    _passwordController.text = '111124';
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 400,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Welcome to....',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyTextField(
                          controller: _emailController,
                          hint: 'Email',
                          validator: _validateEmail,
                          maxLength: 30,
                        ),
                        MyTextField(
                          controller: _passwordController,
                          obscureText: true,
                          hint: 'Password',
                          validator: _validatePassword,
                          maxLength: 16,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            MyTextButton(
                              onPressed: () {
                                _login();
                              },
                              label: 'Login',
                            ),
                            const Spacer(),
                            MyTextButton(
                              onPressed: () {
                                _signup();
                              },
                              label: 'Sign Up',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextButton(
                          onPressed: () async {
                            final Uri emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: email,
                              query: encodeQueryParameters(<String, String>{
                                'subject': 'app support',
                                'body': ''
                              }),
                            );
                            if (await canLaunchUrl(emailLaunchUri)) {
                              await launchUrl(emailLaunchUri);
                            } else {
                              throw 'Could not launch $emailLaunchUri';
                            }
                          },
                          child: const Text(email),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocConsumer<AuthenticationBloc, AuthenticationState>(
            bloc: getIt<AuthenticationBloc>(),
            listener: (context, state) {
              state.whenOrNull(
                error: (message) {
                  showAlertDialog(context, message);
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  orElse: () => const SizedBox.shrink());
            },
          ),
        ],
      ),
    );
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      getIt<AuthenticationBloc>().add(
        AuthenticationEvent.signInRequested(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }
  }

  void _signup() {
    if (_formKey.currentState!.validate()) {
      getIt<AuthenticationBloc>().add(
        AuthenticationEvent.signUpRequested(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }
  }
}
