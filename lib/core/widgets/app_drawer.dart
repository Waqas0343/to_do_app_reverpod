import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_colors.dart';
import 'drawer_list.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
                top: 60, bottom: 20, left: 16, right: 16),
            decoration: const BoxDecoration(color: AppColors.primary),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12,),
                    Text(
                      'Muhammad Waqas',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.textLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "waqasraza0343@gmail.com",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child:  CircleAvatar(
                      radius: 14,
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.close, size: 18, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 12,),
          Expanded(
            child: ListView(
              padding:  EdgeInsets.symmetric(horizontal: 16),
              children: [
                _sectionTitle(context, "Account"),

                DrawerList(
                  title: "My Profile",
                  iconData: Icons.person,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                DrawerList(
                  title: "Delete Account",
                  iconData: Icons.delete,
                  onTap: () {
                    Navigator.pop(context);

                  },
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),

        ],
      ),
    );
  }

  /// 🔹 Section Title
  Widget _sectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }
}