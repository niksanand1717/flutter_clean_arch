import 'package:clean_arch/domain/model.dart';
import 'package:clean_arch/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:clean_arch/presentation/resources/assets_manager.dart';
import 'package:clean_arch/presentation/resources/color_manager.dart';
import 'package:clean_arch/presentation/resources/strings_manager.dart';
import 'package:clean_arch/presentation/resources/values_margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  // late final List<SliderObject> _list = _getSliderData();
  // int _currentIndex = 0;
  // List<SliderObject> _getSliderData() => [
  //       SliderObject(AppStrings.onBoardingSubTitle1,
  //           AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
  //       SliderObject(AppStrings.onBoardingSubTitle2,
  //           AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
  //       SliderObject(AppStrings.onBoardingSubTitle3,
  //           AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
  //       SliderObject(AppStrings.onBoardingSubTitle4,
  //           AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4),
  //     ];

  PageController _pageController = PageController(initialPage: 0);
  OnBoardingViewModel _viewModel = OnBoardingViewModel();
  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    // TODO: implement initState
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose of ViewModel
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          // itemCount: _list.length,
          itemCount: sliderViewObject.numOfSlides,
          onPageChanged: (index) {
            // setState(() {
            // _currentIndex = index;
            _viewModel.onPageChanged(index);
            // })
            ;
          },
          itemBuilder: (context, index) {
            // return onBoardingPage
            // return OnBoardingPage(_list[index]);
            return OnBoardingPage(sliderViewObject.sliderObject);
          },
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          height: AppSize.s100,
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              _getBottomSheetWidget(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              onTap: () {
                _pageController.animateToPage(_viewModel.goPrevious(),
                    duration: DurationConstant.d300, curve: Curves.bounceInOut);
              },
            ),
          ),
          // circle indicators
          Row(
            children: [
              // for (int i = 0; i < _list.length; i++)
              for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                Padding(
                  padding: EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i, sliderViewObject.currentIndex),
                )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc),
              ),
              onTap: () {
                _pageController.animateToPage(_viewModel.goNext(),
                    duration: DurationConstant.d300, curve: Curves.bounceInOut);
              },
            ),
          )
        ],
      ),
    );
  }

  // DONE: Implemented in onboarding ViewModel.
  // int _getPreviousIndex() {
  //   int previousIndex = _currentIndex--;
  //   if (previousIndex == -1) {
  //     _currentIndex = _list.length - 1;
  //   }
  //   return _currentIndex;
  // }
  //
  // int _getNextIndex() {
  //   int nextIndex = _currentIndex++;
  //   if (nextIndex >= _list.length) {
  //     _currentIndex = 0;
  //   }
  //   return _currentIndex;
  // }

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage(
    this._sliderObject, {
    Key? key,
  }) : super(key: key);

  SliderObject _sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSize.s60,
        ),
        Text(
          _sliderObject.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: AppSize.s20,
        ),
        Text(
          _sliderObject.subTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: AppSize.s20,
        ),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}
