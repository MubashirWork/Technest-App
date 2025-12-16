import 'dart:async';

import 'package:flutter/material.dart';
import 'package:technest/core/widgets/app_loading_indicator.dart';
import 'package:technest/core/widgets/app_outlined_button.dart';
import 'package:technest/core/widgets/app_text.dart';
import 'package:technest/core/widgets/app_text_button.dart';
import 'package:technest/core/widgets/app_text_field.dart';
import 'package:technest/presentation/screens/auth/login_screen.dart';
import 'package:technest/presentation/screens/auth/register_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Toggle password visibility
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  // Toggle loading state
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final safeHeight =
        mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: safeHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title text
                  AppText(
                    data: "Forgot Password",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    align: TextAlign.center,
                  ),

                  // Sub title text
                  AppText(
                    data: "Enter your email first and then reset password",
                    fontSize: 16,
                    align: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  // Email address text field
                  AppTextField(
                    controller: emailController,
                    label: "Email Address",
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 16),

                  // Password text field
                  AppTextField(
                    controller: passwordController,
                    label: "Password",
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: hidePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    hideText: hidePassword,
                    suffixOnClick: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  // Confirm password text field
                  AppTextField(
                    controller: confirmPasswordController,
                    label: "Confirm Password",
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: hideConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    hideText: hideConfirmPassword,
                    suffixOnClick: () {
                      setState(() {
                        hideConfirmPassword = !hideConfirmPassword;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  // Update password outlined button
                  AppOutlinedButton(
                    onClick: () {
                      setState(() {
                        isLoading = true;
                      });
                      Future.delayed(Duration(milliseconds: 300), () {
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      });
                    },
                    child: isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                data: 'Loading....',
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(width: 8),
                              AppLoadingIndicator(),
                            ],
                          )
                        : AppText(
                            data: "Update Password",
                            fontWeight: FontWeight.w500,
                          ),
                  ),

                  const SizedBox(height: 16),

                  // Text button sign in and text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: AppText(
                          data: "Don't have an sign up?",
                          fontSize: 14,
                          align: TextAlign.center,
                        ),
                      ),
                      const SizedBox(width: 4),
                      AppTextButton(onClick: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      }, text: 'Sign up'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
