import 'package:cladiaq/commons/widgets/buttom_navigation/bloc/buttom_navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cladiaq/commons/colors.dart';

class CqButtomnNavBar extends StatefulWidget {
  const CqButtomnNavBar({super.key});

  @override
  _CqButtomnNavBarState createState() => _CqButtomnNavBarState();
}

class _CqButtomnNavBarState extends State<CqButtomnNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtomNavigationBloc, ButtomNavigationState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            // Get the current route
            final currentRoute = ModalRoute.of(context)?.settings.name;

            // Detect if the back navigation leads to the home page
            if (currentRoute != '/dashboard') {
              // Simulate clicking the Home button to dispatch the event
              BlocProvider.of<ButtomNavigationBloc>(context)
                  .add(HomeButtonClicked());
              Navigator.of(context)
                  .pushNamed('/dashboard'); // Navigate to the home page
              return false; // Prevent the default back action (since we are handling it)
            }
            return true; // Allow back navigation if already on the home page
          },
          child: Container(
            height: 50,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _BottomBarItem(
                  onTap: () {
                    BlocProvider.of<ButtomNavigationBloc>(context)
                        .add(HomeButtonClicked());
                    Navigator.of(context).pushNamed('/dashboard');
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/cq_home.svg",
                    color: state is ButtomNavigationHome
                        ? Colors.blue
                        : cqMediumGreyColor,
                    height: 20,
                    width: 20,
                  ),
                  label: 'Home',
                ),
                _BottomBarItem(
                  onTap: () {
                    BlocProvider.of<ButtomNavigationBloc>(context)
                        .add(NewsButtonClicked());
                    Navigator.of(context).pushNamed('/news');
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/cq_news.svg",
                    color: state is ButtomNavigationNews
                        ? Colors.blue
                        : cqMediumGreyColor,
                    height: 20,
                    width: 20,
                  ),
                  label: 'News',
                ),
                _BottomBarItem(
                  onTap: () {
                    BlocProvider.of<ButtomNavigationBloc>(context)
                        .add(ChatBotButtonClicked());
                    Navigator.of(context).pushNamed('/ai');
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/cq_ai.svg",
                    color: state is ButtomNavigationChatBot
                        ? Colors.blue
                        : cqMediumGreyColor,
                    height: 20,
                    width: 20,
                  ),
                  label: 'CLADIAQ AI',
                ),
                _BottomBarItem(
                  onTap: () {
                    BlocProvider.of<ButtomNavigationBloc>(context)
                        .add(SettingsButtonClicked());
                    Navigator.of(context).pushNamed("/settings");
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/cq_settings.svg",
                    color: state is ButtomNavigationSetting
                        ? Colors.blue
                        : cqMediumGreyColor,
                    height: 20,
                    width: 20,
                  ),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String label;
  final Widget icon;

  const _BottomBarItem({
    Key? key,
    this.onTap,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            this.icon,
            Text(
              this.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: cqMediumGreyColor,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
