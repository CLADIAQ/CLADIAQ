import 'package:cladiaq/commons/colors.dart';
import 'package:cladiaq/commons/ui_helpers.dart';
import 'package:cladiaq/forgot_password/create_new_password.dart';
import 'package:cladiaq/signup/signup_view.dart';
import 'package:cladiaq/commons/widgets/cq_button.dart';
import 'package:cladiaq/commons/widgets/cq_input_field.dart';
import 'package:cladiaq/commons/widgets/cq_text.dart';
import 'package:cladiaq/commons/widgets/cq_toogle_button.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
              child: const Row(
                children: [
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
                        CqToogleButton(
                          toggleFunct: () {
                            setState(() {
                              toggleValue = !toggleValue;
                            });
                          },
                          toggleValue: toggleValue,
                        ),
                        horizontalSpaceSmall,
                        const CqText.caption("Remember Me")
                      ],
                    ),
                    const CqText.caption("Forgot Password?"),
                  ],
                )),
            verticalSpaceSmall,
            SizedBox(
                width: screenWidth(context) * 0.4,
                child: CqButton(
                    title: "Login",
                    onPressedCq: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  const ForgotPasswordEmail())));
                    })),
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
                children: [
                  const Text("Dont have an Account?"),
                  horizontalSpaceSmall,
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const SignUp())));
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          color: cqPrimaryColor,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
