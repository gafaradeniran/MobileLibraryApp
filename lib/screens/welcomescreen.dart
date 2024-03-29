import 'package:flutter/material.dart';
import 'package:mylibrary/classes/button.dart';
import 'package:mylibrary/screens/onboarding.dart';
import 'package:mylibrary/screens/auth_screens/login.dart';
import 'package:mylibrary/screens/auth_screens/register.dart';
import 'package:mylibrary/styles.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentIndex = 0;
  PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: sliders.length,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemBuilder: (context, index) => Column(
                    children: [
                      const SizedBox(height: 25),
                      Image.asset(
                        sliders[index].img,
                        fit: BoxFit.contain,
                      ),
                      Text(sliders[index].title, style: titleStyle),
                      const SizedBox(height: 15),
                      Text(sliders[index].description,
                          style: descStyle, textAlign: TextAlign.center),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            sliders.length,
                            (index) => AnimatedContainer(
                                  margin: const EdgeInsets.only(right: 10),
                                  duration: Duration(milliseconds: 400),
                                  height: 12,
                                  width: 12,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentIndex == index
                                        ? Colors.purple
                                        : Colors.grey,
                                  ),
                                )),
                      ),
                    ],
                  ),
                ),
              ),
              currentIndex == sliders.length - 1
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: myButtons(
                                'SIGN UP',
                                () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const Registration()));
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: myButtons(
                                'SIGN IN',
                                () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Login()));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const Center(),
            ],
          ),
        ),
      ),
    );
  }
}
