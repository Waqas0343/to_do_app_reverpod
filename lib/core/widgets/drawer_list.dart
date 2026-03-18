import 'package:flutter/material.dart';

import '../theme/app_colors.dart';


class DrawerList extends StatelessWidget {
  final String title;
  final IconData? iconData;
  final Function? onTap;
  final int unReadNotifications;
  final bool isBottomBorder;

  const DrawerList({
    required this.title,
    this.onTap,
    this.isBottomBorder = true,
    this.iconData,
    this.unReadNotifications = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
      child: InkWell(
        onTap: () => onTap!(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                    Icon(
                      iconData,
                      size: 20,
                      color: AppColors.primary
                    ),
                  Flexible(
                    child: Padding(
                      padding:  EdgeInsets.all(12.0),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.black,
                        )
                      ),
                    ),
                  ),
                  if (unReadNotifications > 0)
                    Container(
                      width: 20,
                      height: 20,
                      padding:  EdgeInsets.all(2),
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        unReadNotifications.toString(),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.white,
                        )
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}