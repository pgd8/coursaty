import 'package:coursaty/Core/Routing/routes.dart';
import 'package:coursaty/Core/Themes/assets_manager.dart';
import 'package:coursaty/Core/Themes/color_data.dart';
import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:coursaty/features/On_Boarding/widgets/onboarding_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  late PageController _pageController;
  int index = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: .min,
        mainAxisAlignment: .center,
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              scrollBehavior: MaterialScrollBehavior(),
              physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              children: tabs,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: tabs.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 10.h,
                    dotWidth: 10.w,
                    activeDotColor: ColorData.primary500Color,
                  ),
                ),
                Row(
                  children: [
                    index != 0
                        ? TextButton(
                            onPressed: () {
                              if (index > 0) {
                                setState(() {
                                  index--;
                                  _pageController.previousPage(
                                    duration: Duration(seconds: 1),
                                    curve: Curves.ease,
                                  );
                                });

                              }
                            },
                            child: Text(
                              'Back',
                              style: TextStyle(color: ColorData.gray100Color),
                            ),
                          )
                        : Container(),
                    ElevatedButton(
                      style: Styles.miniMainButtonStyle,
                      onPressed: () {
                        if (index >= 0 && index <2) {
                          setState(() {
                            index++;
                            _pageController.nextPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.ease,
                            );
                          });
                        } else if(index == 2){
                          context.go(Routes.kLogin);
                        }
                      },
                      child: Text(
                        index ==2?
                            'Get Started'
                        :'Next',
                        style: Styles.submitButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<OnboardingTab> tabs = [
    OnboardingTab(
      body:
          'Grow your Education & level up with E-learning',
      image: AssetsManager.onBoard1,
    ),
    OnboardingTab(
      body:
          'Get Professional training through E-learning',
      image: AssetsManager.onBoard2,
    ),
    OnboardingTab(
      body:
          'Learn through skilled mentor across the world',
      image: AssetsManager.onBoard3,
    ),
  ];
}
