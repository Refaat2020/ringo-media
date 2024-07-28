import 'package:ringo_media/common/rm_shadow.dart';

import '../../../../../file_export.dart';

class MainScreenNavBarWidget extends StatelessWidget {
  const MainScreenNavBarWidget(
      {super.key, required this.index, required this.navigationShell});

  final int index;
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(RMDimensions.xLarge),
          topLeft: Radius.circular(RMDimensions.xLarge),
        ),
        color: AppColors.neutralColors0,
        boxShadow: [RMShadow.large],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(),
          navBarItem(
            context: context,
            naviIndex: index,
            itemIndex: 2,
            activeLabel: "Dashboard",
            icon: SvgPicture.asset(
              Assets.icons.category,
            ),
            activeIcon: SvgPicture.asset(
              Assets.icons.category,
              colorFilter: const ColorFilter.mode(
                  AppColors.neutralColors900, BlendMode.srcIn),
            ),
          ),
          const Spacer(),
          navBarItem(
            context: context,
            naviIndex: index,
            itemIndex: 3,
            activeLabel: "project",
            icon: SvgPicture.asset(
              Assets.icons.folder,
            ),
            activeIcon: SvgPicture.asset(
              Assets.icons.folder,
              colorFilter: const ColorFilter.mode(
                  AppColors.neutralColors900, BlendMode.srcIn),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          navBarItem(
            context: context,
            naviIndex: index,
            itemIndex: 1,
            activeLabel: "calendar",
            icon: SvgPicture.asset(
              Assets.icons.calendar,
            ),
            activeIcon: SvgPicture.asset(
              Assets.icons.calendar,
              colorFilter: const ColorFilter.mode(
                  AppColors.neutralColors900, BlendMode.srcIn),
            ),
          ),
          const Spacer(),
          navBarItem(
            context: context,
            naviIndex: index,
            itemIndex: 0,
            activeLabel: "memo",
            icon: Image.asset(Assets.icons.memoji.path),
            activeIcon: Image.asset(Assets.icons.memoji.path),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget navBarItem({
    required BuildContext context,
    required int itemIndex,
    required int naviIndex,
    required Widget activeIcon,
    required String activeLabel,
    required Widget icon,
    final VoidCallback? onTap,
  }) {
    final selected = itemIndex == naviIndex;
    return InkResponse(
      onTap: () {
        navigationShell.goBranch(
          itemIndex,
          // A common pattern when using bottom navigation bars is to support
          // navigating to the initial location when tapping the item that is
          // already active. This example demonstrates how to support this behavior,
          // using the initialLocation parameter of goBranch.
          initialLocation: itemIndex == navigationShell.currentIndex,
        );
      },
      child: AnimatedContainer(
        key: Key(activeLabel),
        height: ScreenUtil().screenHeight / 10,
        duration: const Duration(milliseconds: 400),
        padding: EdgeInsets.only(bottom: 25.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            selected ? activeIcon : icon,
          ],
        ),
      ),
    );
  }
}
