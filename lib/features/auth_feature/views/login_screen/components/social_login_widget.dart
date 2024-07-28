import 'package:ringo_media/file_export.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: RMDimensions.xLarge.h,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Or login with account",
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppColors.neutralColors500,
                fontVariations: [const FontVariation.weight(600)]),
          ),
        ),
        SizedBox(
          height: RMDimensions.xLarge.h,
        ),
        //Google
        AppButton(
          height: 56.h,
          width: ScreenUtil().screenWidth / 1.2,
          name: "",
          textColors: AppColors.neutralColors900,
          widget: Padding(
            padding: const EdgeInsets.only(left: RMDimensions.large),
            child: Row(
              children: [
                SvgPicture.asset(Assets.icons.google),
                const Spacer(),
                Text(
                  "Continue with Google",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.neutralColors900,
                      fontVariations: [const FontVariation.weight(700)]),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
          onTap: () {},
          containerColor: AppColors.neutralColors0,
          borderColor: AppColors.neutralColors200,
          radius: 8,
          borderWidth: 1.5,
        ),
        SizedBox(
          height: RMDimensions.large.h,
        ),
        //Facebook
        AppButton(
          height: 56.h,
          width: ScreenUtil().screenWidth / 1.2,
          name: "",
          textColors: AppColors.neutralColors900,
          widget: Padding(
            padding: const EdgeInsets.only(left: RMDimensions.large),
            child: Row(
              children: [
                SvgPicture.asset(Assets.icons.facebook),
                const Spacer(),
                Text(
                  "Continue with Facebook",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.neutralColors900,
                      fontVariations: [const FontVariation.weight(700)]),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
          onTap: () {},
          containerColor: AppColors.neutralColors0,
          borderColor: AppColors.neutralColors200,
          radius: 8,
          borderWidth: 1.5,
        ),
        SizedBox(
          height: RMDimensions.large.h,
        ),

        ///Apple
        AppButton(
          height: 56.h,
          width: ScreenUtil().screenWidth / 1.2,
          name: "",
          textColors: AppColors.neutralColors900,
          widget: Padding(
            padding: const EdgeInsets.only(left: RMDimensions.large),
            child: Row(
              children: [
                SvgPicture.asset(Assets.icons.apple),
                const Spacer(),
                Text(
                  "Continue with Apple",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.neutralColors900,
                      fontVariations: [const FontVariation.weight(700)]),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
          onTap: () {},
          containerColor: AppColors.neutralColors0,
          borderColor: AppColors.neutralColors200,
          radius: 8,
          borderWidth: 1.5,
        ),
      ],
    );
  }
}
