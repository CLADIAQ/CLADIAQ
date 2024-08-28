import 'package:cladiaq/commons/colors.dart';
import 'package:cladiaq/commons/ui_helpers.dart';
import 'package:cladiaq/widgets/cq_button.dart';
import 'package:cladiaq/widgets/cq_input_field.dart';
import 'package:cladiaq/widgets/cq_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        children: [
          CqText.heading1("Design System"),
          verticalSpaceSmall,
          Divider(),
          verticalSpaceSmall,
          ...buttonWidgets,
          ...textFields,
          ...inputFields,
        ],
      ),
      // body: Stack(
      //   children: [
      //     Center(
      //       child: Column(

      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: <Widget>[
      //           const SizedBox(
      //             height: 30,
      //           ),
      //           Center(
      //             child: Image.asset('assets/images/ima.jpg'),
      //           ),
      //           const SizedBox(
      //             height: 70,
      //           ),
      //           const Text(
      //             'Healthy Spaces Better',
      //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
      //           ),
      //           const Text(
      //             'Lives',
      //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
      //           ),
      //           const SizedBox(
      //             height: 40,
      //           ),
      //           const Text(
      //             'Living Well has never been',
      //             style: TextStyle(fontWeight: FontWeight.normal, fontSize: 28),
      //           ),
      //           const Text(
      //             'so easy as with CLADIAQ',
      //             style: TextStyle(fontWeight: FontWeight.normal, fontSize: 28),
      //           ),
      //           const SizedBox(
      //             height: 50,
      //           )
      //         ],
      //       ),
      //     ),
      //     Positioned(
      //         bottom: 5,
      //         right: 20,
      //         child: GestureDetector(
      //           child: Image.asset('assets/icons/next.png'),
      //           onTap: () async {
      //             final prefs = await SharedPreferences.getInstance();
      //             prefs.setBool("onboarding", false);
      //           },
      //         )),
      //   ],
      // ),
      // // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> get buttonWidgets => [
        CqText.headline("Button"),
        verticalSpaceMedium,
        CqText.body("Normal"),
        verticalSpaceSmall,
        CqButton(title: "SIGN IN", onPressedCq: () {}),
        verticalSpaceSmall,
        CqText.body("Disabled"),
        verticalSpaceSmall,
        CqButton(
          title: "SIGN IN",
          onPressedCq: () {},
          disabled: true,
        ),
        verticalSpaceSmall,
        CqText.body("Busy"),
        verticalSpaceSmall,
        CqButton(
          title: "SIGN IN",
          onPressedCq: () {},
          busy: true,
        ),
        verticalSpaceSmall,
        CqText.body("Outline"),
        verticalSpaceSmall,
        CqButton(
          title: "SIGN IN",
          onPressedCq: () {},
          outline: true,
          leading: const Icon(
            Icons.abc,
            color: cqMediumGreyColor,
          ),
        )
      ];

  List<Widget> get textFields => const [
        verticalSpaceLarge,
        CqText.headline("Headline"),
        verticalSpaceMedium,
        CqText.heading1("Heading1"),
        verticalSpaceSmall,
        CqText.heading2("Heading2"),
        verticalSpaceSmall,
        CqText.heading3("Heading3"),
        verticalSpaceSmall,
        CqText.subHeading("SubHeading"),
        verticalSpaceSmall,
        CqText.caption("Caption"),
        verticalSpaceSmall,
      ];

  List<Widget> get inputFields => [
        verticalSpaceLarge,
        CqInputField(
            trailingTapped: () {
              print("I have been clicked");
            },
            leading: Icon(Icons.email),
            trailing: Icon(
              Icons.remove_red_eye,
            ),
            controller: TextEditingController())
      ];
}
