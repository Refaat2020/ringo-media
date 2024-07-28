import 'package:ringo_media/file_export.dart';

class ProjectScreenHeaderWidget extends StatelessWidget {
  const ProjectScreenHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(RMDimensions.xLarge.h),
      child: Column(
        children: [
          ///search textField
          RegularTextField(
            keyboardType: TextInputType.emailAddress,
            label: "Search",
            hintText: "Search project here",
            suffix: SvgPicture.asset(Assets.icons.searchNormal),
          ),
          SizedBox(
            height: RMDimensions.xLarge.h,
          ),
          //cards
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///blue
              Container(
                padding: EdgeInsets.all(RMDimensions.large.h),
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(RMDimensions.small2)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff3A9ADE),
                      Color(0xff5EACE4),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "10",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                            color: AppColors.neutralColors0,
                            fontVariations: [
                              const FontVariation.weight(700),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: RMDimensions.xLarge.h,
                        ),
                        SvgPicture.asset(Assets.icons.clock),
                      ],
                    ),
                    SizedBox(
                      height: RMDimensions.small2.h,
                    ),
                    Text(
                      "Project\nIn Progress",
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: AppColors.neutralColors0,
                          ),
                    ),
                  ],
                ),
              ),

              ///green
              Container(
                padding: EdgeInsets.all(RMDimensions.large.h),
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(RMDimensions.small2)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff3F8B8D),
                      Color(0xff58B2B4),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "24",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                            color: AppColors.neutralColors0,
                            fontVariations: [
                              const FontVariation.weight(700),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: RMDimensions.xLarge.h,
                        ),
                        SvgPicture.asset(Assets.icons.verify),
                      ],
                    ),
                    SizedBox(
                      height: RMDimensions.small2.h,
                    ),
                    Text(
                      "Project\nCompeted",
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: AppColors.neutralColors0,
                          ),
                    ),
                  ],
                ),
              ),

              ///red
              Container(
                padding: EdgeInsets.all(RMDimensions.large.h),
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(RMDimensions.small2)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffDD4A4A),
                      Color(0xffE87777),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "5",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                            color: AppColors.neutralColors0,
                            fontVariations: [
                              const FontVariation.weight(700),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: RMDimensions.xLarge.h,
                        ),
                        SvgPicture.asset(Assets.icons.closeCircle),
                      ],
                    ),
                    SizedBox(
                      height: RMDimensions.small2.h,
                    ),
                    Text(
                      "Project\nCancelled",
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: AppColors.neutralColors0,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: RMDimensions.xLarge.h,
          ),
          //view all Project
          AppButton(
            height: 48.h,
            width: ScreenUtil().screenWidth / 1.2,
            name: "View All Project",
            onTap: () {},
            containerColor: AppColors.neutralColors0,
            borderColor: AppColors.neutralColors900,
            radius: 8,
          )
        ],
      ),
    );
  }
}
