import 'package:cladiaq/commons/colors.dart';
import 'package:flutter/material.dart';

class CqButtomnNavBar extends StatelessWidget {
  const CqButtomnNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(6),
        topRight: Radius.circular(6),
      ),
      child: BottomAppBar(
        color: Colors.transparent,
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _BottomBarItem(
                onTap: () {
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     VehiclePage.route(), (route) => route.isFirst);
                  // Navigator.of(context).push(VehiclePage.route());
                },
                icon: const Icon(Icons.home, color: cqMediumGreyColor),
                // Image.asset(
                //   'assets/icons/vehicles.png',
                //   height: 28,
                //   width: 28,
                // ),
                label: 'vehicles',
              ),
              _BottomBarItem(
                onTap: () {
                  // Navigator.of(context).pop();
                  // Navigator.of(context)
                  //     .pushAndRemoveUntil(HomePage.route(), (route) => false);
                  // Navigator.of(context).pushReplacement(HomePage.route());
                },
                icon: const Icon(
                  Icons.home,
                  color: cqMediumGreyColor,
                ),
                label: 'dashboard',
              ),
              /* 
              _BottomBarItem(
                onTap: () {
                  // Navigator.of(context).push(Drivers.route());
                },
                icon: Image.asset(
                  'assets/icons/drivers.png',
                  height: 28,
                  width: 28,
                ),
                label: 'Drivers',
              ), */
              _BottomBarItem(
                icon: const Icon(
                  Icons.group,
                  color: cqMediumGreyColor,
                  size: 28,
                ),
                onTap: () {
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     UsersPage.route(), (route) => route.isFirst);
                  // Navigator.of(context).push(UsersPage.route());
                },
                label: 'users',
              ),
            ],
          ),
        ),
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
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              this.icon,
              Text(
                this.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
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
