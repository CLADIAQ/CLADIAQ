import 'package:cladiaq/commons/colors.dart';
import 'package:cladiaq/commons/ui_helpers.dart';
import 'package:cladiaq/login/login_view.dart';
import 'package:cladiaq/widgets/cq_button.dart';
import 'package:cladiaq/widgets/cq_input_field.dart';
import 'package:cladiaq/widgets/cq_text.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpaceLarge,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Row(
              children: [
                CqText.headline("Sign Up"),
              ],
            ),
          ),
          verticalSpaceSmall,
          Center(
            child: SizedBox(
              width: screenWidth(context) * 0.9,
              child: CqInputField(
                controller: TextEditingController(),
                leading: Image.asset("assets/icons/person.png"),
                placeholder: "Full Name",
              ),
            ),
          ),
          verticalSpaceSmall,
          Center(
            child: SizedBox(
              width: screenWidth(context) * 0.9,
              child: CqInputField(
                controller: TextEditingController(),
                leading: Image.asset("assets/icons/email.png"),
                placeholder: "Enter your Email",
              ),
            ),
          ),
          verticalSpaceSmall,
          Center(
            child: SizedBox(
              width: screenWidth(context) * 0.9,
              child: CqInputField(
                controller: TextEditingController(),
                leading: Image.asset("assets/icons/phone.png"),
                placeholder: "Mobile",
              ),
            ),
          ),
          verticalSpaceSmall,
          Center(
            child: SizedBox(
              width: screenWidth(context) * 0.9,
              child: CqInputField(
                password: true,
                controller: TextEditingController(),
                leading: Image.asset("assets/icons/lock.png"),
                placeholder: "Password",
                trailing: Image.asset("assets/icons/password.png"),
              ),
            ),
          ),
          verticalSpaceSmall,
          Center(
            child: SizedBox(
              width: screenWidth(context) * 0.9,
              child: CqInputField(
                password: true,
                controller: TextEditingController(),
                leading: Image.asset("assets/icons/lock.png"),
                placeholder: "Confirm Password",
                trailing: Image.asset("assets/icons/password.png"),
              ),
            ),
          ),
          verticalSpaceSmall,
          SizedBox(
              width: screenWidth(context) * 0.85,
              child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                        activeColor: cqPrimaryColor,
                        value: checkbox,
                        onChanged: (t) {
                          setState(() {
                            checkbox = !checkbox;
                          });
                        }),
                    Container(
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("I agree to the",
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                              Text("Terms & Conditions",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: cqPrimaryColor,
                                      decoration: TextDecoration.underline)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("and"),
                              Text(" Privacy Policy",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: cqPrimaryColor,
                                      decoration: TextDecoration.underline)),
                            ],
                          )
                        ],
                      ),
                    )
                  ])),
          verticalSpaceTiny,
          SizedBox(
              width: screenWidth(context) * 0.4,
              child: CqButton(
                title: "Sign up",
                onPressedCq: () {},
              )),
          verticalSpaceSmall,
          const CqText.heading3("Or"),
          verticalSpaceSmall,
          SizedBox(
            width: screenWidth(context) * 0.75,
            child: CqButton(
              leading: Image.asset('assets/icons/google.png'),
              title: "Sign up With Google",
              onPressedCq: () {},
              outline: true,
            ),
          ),
          verticalSpaceSmall,
          SizedBox(
            width: screenWidth(context) * 0.75,
            child: CqButton(
              title: "Sign up With Facebook",
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
                const Text("Already have an account"),
                horizontalSpaceSmall,
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const LogIn())));
                  },
                  child: const Text(
                    "Log in",
                    style: TextStyle(
                        color: cqPrimaryColor,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          )
        ],
      ))),
    );
  }
}
