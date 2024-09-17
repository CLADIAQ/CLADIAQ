import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cladiaq/commons/colors.dart';

class CqButtomnNavBar extends StatefulWidget {
  const CqButtomnNavBar({super.key});

  @override
  _CqButtomnNavBarState createState() => _CqButtomnNavBarState();
}

class _CqButtomnNavBarState extends State<CqButtomnNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the respective page based on index
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed("/dashboard");
        break;
      case 1:
        Navigator.of(context).pushNamed('/news');
        break;
      case 2:
        Navigator.of(context).pushNamed('/ai');
        break;
      case 3:
        Navigator.of(context).pushNamed('/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _BottomBarItem(
            onTap: () => _onItemTapped(0),
            icon: SvgPicture.asset(
              "assets/icons/cq_home.svg",
              color: _selectedIndex == 0 ? Colors.blue : cqMediumGreyColor,
              height: 20,
              width: 20,
            ),
            label: 'Home',
          ),
          _BottomBarItem(
            onTap: () => _onItemTapped(1),
            icon: SvgPicture.asset(
              "assets/icons/cq_news.svg",
              color: _selectedIndex == 1 ? Colors.blue : cqMediumGreyColor,
              height: 20,
              width: 20,
            ),
            label: 'News',
          ),
          _BottomBarItem(
            onTap: () => _onItemTapped(2),
            icon: SvgPicture.asset(
              "assets/icons/cq_ai.svg",
              color: _selectedIndex == 2 ? Colors.blue : cqMediumGreyColor,
              height: 20,
              width: 20,
            ),
            label: 'CLADIAQ AI',
          ),
          _BottomBarItem(
            onTap: () => _onItemTapped(3),
            icon: SvgPicture.asset(
              "assets/icons/cq_settings.svg",
              color: _selectedIndex == 3 ? Colors.blue : cqMediumGreyColor,
              height: 20,
              width: 20,
            ),
            label: 'Settings',
          ),
        ],
      ),
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
