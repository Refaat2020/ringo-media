import 'package:ringo_media/features/auth_feature/views/login_screen/components/login_form_widget.dart';
import 'package:ringo_media/features/auth_feature/views/login_screen/components/social_login_widget.dart';
import 'package:ringo_media/file_export.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const routeName = "/LoginScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: RMDimensions.xLarge.w,
            top: 80.h,
            right: RMDimensions.xLarge.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontVariations: [const FontVariation.weight(700)],
              ),
            ),
            SizedBox(
              height: RMDimensions.small2.h,
            ),
            Text(
              "Sign in to your account",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.neutralColors500,
                  letterSpacing: -.8,
                  fontVariations: [const FontVariation.weight(500)]),
            ),
            const LoginFormWidget(),
            const SocialLoginWidget(),
            SizedBox(
              height: RMDimensions.xxxLarge2.h,
            ),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.neutralColors500,
                    fontVariations: [
                      const FontVariation.weight(500),
                    ],
                  ),
                  children: [
                    TextSpan(
                      text: "Register Here",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontVariations: [const FontVariation.weight(700)],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
