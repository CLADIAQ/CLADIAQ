import 'package:cladiaq/commons/colors.dart';
import 'package:cladiaq/commons/ui_helpers.dart';
import 'package:cladiaq/widgets/cq_button.dart';
import 'package:cladiaq/widgets/cq_input_field.dart';
import 'package:cladiaq/widgets/cq_text.dart';
import 'package:flutter/material.dart';

class LogInView extends StatefulWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  bool toggleValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  CqText.headline("Login"),
                ],
              ),
            ),
            verticalSpaceSmall,
            Image.asset('assets/images/ima2.png'),
            verticalSpaceSmall,
            SizedBox(
              width: screenWidth(context) * 0.85,
              child: CqInputField(
                controller: TextEditingController(),
                leading: Image.asset('assets/icons/email.png'),
                placeholder: "Enter your Email",
              ),
            ),
            verticalSpaceMedium,
            SizedBox(
              width: screenWidth(context) * 0.85,
              child: CqInputField(
                leading: Image.asset('assets/icons/lock.png'),
                trailing: Image.asset('assets/icons/password.png'),
                controller: TextEditingController(),
                placeholder: "Password",
                password: true,
              ),
            ),
            verticalSpaceSmall,
            SizedBox(
                height: 20,
                width: screenWidth(context) * 0.85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: toggleButton,
                          child: AnimatedContainer(
                            height: 40.0,
                            width: 35,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeIn,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: cqLightGreyColor),
                            child: Stack(children: [
                              Positioned(
                                left: toggleValue ? 0 : null,
                                right: toggleValue ? null : 0,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: toggleValue
                                          ? Colors.white
                                          : cqPrimaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              )
                            ]),
                          ),
                        ),
                        horizontalSpaceSmall,
                        const CqText.caption("Remember Me")
                      ],
                    ),
                    Row(
                      children: const [
                        CqText.caption("Don't have an accounty?"),
                        horizontalSpaceTiny,
                        CqText.caption("SignUp")
                      ],
                    )
                  ],
                )),
            verticalSpaceSmall,
            SizedBox(
                width: screenWidth(context) * 0.4,
                child: CqButton(title: "Login", onPressedCq: () {})),
            verticalSpaceSmall,
            const CqText.heading3("Or"),
            verticalSpaceSmall,
            SizedBox(
              width: screenWidth(context) * 0.75,
              child: CqButton(
                leading: Image.asset('assets/icons/google.png'),
                title: "Login With Google",
                onPressedCq: () {},
                outline: true,
              ),
            ),
            verticalSpaceSmall,
            SizedBox(
              width: screenWidth(context) * 0.75,
              child: CqButton(
                title: "Login With Facebook",
                onPressedCq: () {},
                outline: true,
                leading: Image.asset('assets/icons/facebook.png'),
              ),
            ),
            verticalSpaceTiny,
            SizedBox(
              width: screenWidth(context) * 0.75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Dont have an Account?"),
                  horizontalSpaceSmall,
                  Text(
                    "Sign up",
                    style: TextStyle(
                        color: cqPrimaryColor,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  toggleButton() {
    setState(() {
      toggleValue = !toggleValue;
    });
  }
}
