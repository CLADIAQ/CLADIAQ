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
  // int _selectedIndex = 3;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });

  // Navigate to the respective page based on index
  // switch (index) {
  //   case 0:
  //     Navigator.of(context).pushNamed("/dashboard");
  //     break;
  //   case 1:
  //     break;
  //   case 2:
  //     Navigator.of(context).pushNamed('/ai');
  //     break;
  //   case 3:
  //     Navigator.of(context).pushNamed('/settings');
  //     break;
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtomNavigationBloc, ButtomNavigationState>(
      builder: (context, state) {
        return Container(
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
