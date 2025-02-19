import 'package:flutter/material.dart';
import 'package:plantapp_2/const/constants.dart';
import 'package:plantapp_2/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            // profile image
            Container(
              width: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.primaryColor.withValues(alpha: 0.5),
                  width: 5.0,
                ),
              ),
              child: const CircleAvatar(
                radius: 60.0,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage(
                  'assets/images/profile.jpg',
                ),
              ),
            ),
            // end profile image
            const SizedBox(height: 20.0),
            // profile name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ساناز امینی',
                  style: TextStyle(
                    color: Constants.blackColor,
                    fontSize: 20.0,
                    fontFamily: 'YekanBakh',
                  ),
                ),
                const SizedBox(width: 5.0),
                SizedBox(
                  height: 20.0,
                  child: Image.asset(
                    'assets/images/verified.png',
                  ),
                ),
              ],
            ),
            // end profile name
            const SizedBox(height: 10.0),
            // profile email
            Text(
              'sanaz@gmail.com',
              style: TextStyle(
                color: Constants.blackColor.withValues(alpha: 0.4),
                fontSize: 15.0,
              ),
            ),
            // end profile email
            const SizedBox(height: 30.0),
            // Profile Options
            SizedBox(
              height: size.height * 0.4,
              width: size.width,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BuildOptions(title: 'پروفایل من', icon: Icons.person),
                  BuildOptions(title: 'تنظیمات', icon: Icons.settings),
                  BuildOptions(
                      title: 'اطلاع رسانی‌ها', icon: Icons.notifications),
                  BuildOptions(
                      title: 'شبکه‌های اجتماعی', icon: Icons.share_rounded),
                  BuildOptions(title: 'خروج', icon: Icons.logout),
                ],
              ),
              // end Profile Options
            ),
          ],
        ),
      ),
    );
  }
}
