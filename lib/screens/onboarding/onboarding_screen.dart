import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authscreen/login_email_screen.dart';
import '../components/buttom_circular.dart';
import 'onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(bottom: 90),
        child: PageView.builder(
            itemCount: onboardings.length,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => isLastPage = index == onboardings.length - 1);
            },
            itemBuilder: (context, index) {
              final currentIndex = onboardings[index];

              return Container(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentIndex.title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        currentIndex.imagePath,
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        currentIndex.description,
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: isLastPage
          ? ButtonCircular(
              buttonText: "Commencer",
              onPressed: () async {
                await _completeOnboarding();
                Get.off(() => LoginScreen());
              },
            )
          : Container(
              height: 80,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (!isLastPage)
                    TextButton(
                      onPressed: () {
                        _pageController.jumpToPage(onboardings.length - 1);
                      },
                      child: Text(
                        "Passer",
                        style: TextStyle(
                            color: Colors.red.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: onboardings.length,
                      effect: WormEffect(
                        activeDotColor: Colors.red.shade500,
                        dotHeight: 16,
                        dotWidth: 16,
                      ),
                      onDotClicked: (index) {
                        _pageController.animateToPage(index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      "Suivant",
                      style: TextStyle(
                          color: Colors.red.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
