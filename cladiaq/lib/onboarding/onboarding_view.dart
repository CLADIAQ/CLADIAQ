import 'package:cladiaq/onboarding/onboarding_items.dart';
import 'package:cladiaq/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final onboardingItems = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: isLastPage
            ? getStarted(context)
            : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton(
                    onPressed: () => pageController
                        .jumpToPage(onboardingItems.items.length - 1),
                    child: const Text("Skip")),
                SmoothPageIndicator(
                  onDotClicked: (index) => pageController.animateToPage(index,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn),
                  controller: pageController,
                  count: onboardingItems.items.length,
                  effect: const WormEffect(
                    activeDotColor: Color(0xff56ADF0),
                    dotHeight: 12,
                    dotWidth: 12,
                  ),
                ),
                TextButton(
                    onPressed: () => pageController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn),
                    child: const Text("Next")),
              ]),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
            onPageChanged: (index) => setState(() {
                  isLastPage = onboardingItems.items.length - 1 == index;
                }),
            itemCount: onboardingItems.items.length,
            controller: pageController,
            itemBuilder: (conte, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(onboardingItems.items[index].image),
                  const SizedBox(height: 15),
                  Text(
                    onboardingItems.items[index].title,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Center(
                      child: Text(
                    onboardingItems.items[index].descriptions,
                    style: const TextStyle(
                      color: Color(0xff4F4A4A),
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  )),
                ],
              );
            }),
      ),
    );
  }

  Widget getStarted(context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xff56ADF0)),
      width: MediaQuery.of(context).size.width * .95,
      height: 50,
      child: Center(
        child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const WelcomePage())));
            },
            child: const Text(
              "Get Started",
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
