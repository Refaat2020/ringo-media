import 'package:badges/badges.dart' as badges;
import 'package:ringo_media/file_export.dart';

class RMAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget? titleWidget;
  final List<Widget>? actions;
  final bool centerTitle;
  final Widget? bottom;
  final ShapeBorder? shape;
  final String? image;
  final Widget? leading;
  final double? leadingWidth;
  final double? toolbarHeight;

  const RMAppBarWidget({
    super.key,
    this.titleWidget,
    this.actions,
    this.centerTitle = false,
    this.toolbarHeight,
    this.bottom,
    this.shape,
    this.image,
    this.leading,
    this.leadingWidth,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      centerTitle: centerTitle,
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: leading ??
          Padding(
            padding: const EdgeInsets.only(
              left: RMDimensions.xLarge,
            ),
            child: SvgPicture.asset(
              Assets.icons.menu,
            ),
          ),
      leadingWidth: leadingWidth ?? (kToolbarHeight + RMDimensions.small2),
      actions: [
        Container(
          margin: EdgeInsets.only(right: RMDimensions.large.w),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutralColors300, width: 1.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(RMDimensions.small2),
            ),
          ),
          child: badges.Badge(
            position: badges.BadgePosition.topEnd(top: 1.6, end: 3),
            child: SvgPicture.asset(
              Assets.icons.notification,
            ),
          ),
        ),
        ...?actions,
      ],
      title: titleWidget,
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(220),
              child: bottom!,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}
