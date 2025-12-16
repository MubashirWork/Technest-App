import 'package:flutter/material.dart';
import 'package:technest/core/constants/app_assets.dart';
import 'package:technest/core/widgets/app_loading_indicator.dart';
import 'package:technest/core/widgets/app_outlined_button.dart';
import 'package:technest/core/widgets/app_text.dart';
import 'package:technest/core/widgets/appbar.dart';
import 'package:technest/presentation/screens/auth/login_screen.dart';
import 'package:technest/presentation/screens/profile/edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  // Loading state
  bool isLoading = false;
  bool isLoadingEdit = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final safeHeight =
        mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;

    return Scaffold(
      appBar: Appbar(text: 'Profile',),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: safeHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    // Profile icon
                    Image(image: AssetImage(Assets.profile),
                    height: MediaQuery.of(context).size.height * 0.16,
                    width: MediaQuery.of(context).size.width * 0.50,
                    ),

                    const SizedBox(height: 16,),

                    // User full name
                    AppText(
                      data: 'Mubashir',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),

                    const SizedBox(height: 16),

                    // User email
                    AppText(
                      data: 'mub@gmail.com',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),

                    const SizedBox(height: 16),

                    // Edit profile outlined button
                    AppOutlinedButton(
                      onClick: () {
                        setState(() {
                          isLoadingEdit = true;
                        });
                        Future.delayed(Duration(milliseconds: 300), () {
                          setState(() {
                            isLoadingEdit = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfile(),
                            ),
                          );
                        });
                      },
                      child: isLoadingEdit
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            data: 'Loading...',
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(width: 8),
                          AppLoadingIndicator(),
                        ],
                      )
                          : AppText(data: "Edit Profile", fontWeight: FontWeight.w500),
                    ),

                    const SizedBox(height: 16),

                    // Log out outlined button
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
                            data: 'Loading...',
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(width: 8),
                          AppLoadingIndicator(),
                        ],
                      )
                          : AppText(data: "Logout", fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
