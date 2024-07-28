import '../../../../file_export.dart';
import 'components/main_screen_nav_bar_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen(this.navigationShell, {super.key});

  static const route = "/MainScreen";

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      extendBody: true,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: RMDimensions.large2.h),
        child: SizedBox(
          height: 56.h,
          width: 56.w,
          child: FloatingActionButton(
            backgroundColor: AppColors.neutralColors900,
            shape: const CircleBorder(),
            hoverColor: AppColors.neutralColors500,
            onPressed: () {},
            child: SvgPicture.asset(
              Assets.icons.fiPlus,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: MainScreenNavBarWidget(
        index: navigationShell.currentIndex,
        navigationShell: navigationShell,
      ),
    );
  }
}
