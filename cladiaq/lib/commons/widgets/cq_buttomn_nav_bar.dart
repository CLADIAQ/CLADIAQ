import 'package:cladiaq/commons/colors.dart';
import 'package:cladiaq/home/dashboard/sensor_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CqButtomnNavBar extends StatelessWidget {
  const CqButtomnNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _BottomBarItem(
            onTap: () {
              // Navigator.of(context).pushAndRemoveUntil(
              //     VehiclePage.route(), (route) => route.isFirst);
              // Navigator.of(context).push(VehiclePage.route());
            },
            icon: SvgPicture.asset(
              "assets/icons/cq_home.svg",
              color: cqMediumGreyColor,
              height: 20,
              width: 20,
            ),
            label: 'Home',
          ),
          _BottomBarItem(
            icon: SvgPicture.asset(
              "assets/icons/cq_news.svg",
              color: cqMediumGreyColor,
              height: 20,
              width: 20,
            ),
            onTap: () {
              // Navigator.of(context).pushAndRemoveUntil(
              //     UsersPage.route(), (route) => route.isFirst);
              // Navigator.of(context).push(UsersPage.route());
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SensorDataPage()));
            },
            label: 'News',
          ),
          _BottomBarItem(
            onTap: () {},
            icon: SvgPicture.asset(
              "assets/icons/cq_ai.svg",
              color: cqMediumGreyColor,
              height: 20,
              width: 20,
            ),
            label: 'CLADIAQ AI',
          ),
          _BottomBarItem(
            icon: SvgPicture.asset(
              "assets/icons/cq_settings.svg",
              color: cqMediumGreyColor,
              height: 20,
              width: 20,
            ),
            onTap: () {
              // Navigator.of(context).pushAndRemoveUntil(
              //     UsersPage.route(), (route) => route.isFirst);
              // Navigator.of(context).push(UsersPage.route());
            },
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
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(top: 2),
          child: Column(
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
      ),
    );
  }
}
