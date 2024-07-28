import '../../file_export.dart';

class AppButton extends StatelessWidget {
  final String name;
  final double height;
  final double width;
  final Function onTap;
  final Color containerColor;
  final Color borderColor;
  final double radius;
  final double borderWidth;
  final Color? textColors;
  final Widget? widget;
  final bool loading;
  final bool disabled;
  final TextAlign? textAlign;
  final Color? smallTextColors;
  final TextStyle? style;

  const AppButton({
    super.key,
    required this.height,
    required this.width,
    required this.name,
    required this.onTap,
    required this.containerColor,
    required this.borderColor,
    required this.radius,
    this.textColors,
    this.widget,
    this.loading = false,
    this.textAlign,
    this.smallTextColors,
    this.style,
    this.disabled = false,
    this.borderWidth = 0.8,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (loading || disabled) {
          return;
        }
        onTap();
      },
      child: AnimatedContainer(
        height: height,
        width: width,
        duration: const Duration(milliseconds: 900),
        decoration: BoxDecoration(
          color: disabled ? AppColors.neutralColors300 : containerColor,
          borderRadius: BorderRadius.circular(radius.r),
          border: Border.all(
            color: disabled ? AppColors.neutralColors300 : borderColor,
            width: borderWidth,
          ),
        ),
        child: loading == true
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : widget ??
                Center(
                  child: Text(
                    name,
                    style: style ??
                        Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontVariations: [
                            const FontVariation.weight(700),
                          ],
                          color: textColors,
                        ),
                  ),
                ),
      ),
    );
  }
}
