import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se7ety_5_28/core/utils/colors.dart';
import 'package:se7ety_5_28/core/utils/styles.dart';
import 'package:se7ety_5_28/core/widgets/settings_item.dart';
import 'package:se7ety_5_28/features/intro/welcome_view.dart';
import 'package:se7ety_5_28/features/patient/profile/userDetails.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({super.key});

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  Future _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            splashRadius: 25,
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: const Text(
          'الاعدادات',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SettingsListItem(
              icon: Icons.person,
              text: 'إعدادات الحساب',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contex) => const UserDetails()));
              },
            ),
            SettingsListItem(
              icon: Icons.security_rounded,
              text: 'كلمة السر',
              onTap: () {},
            ),
            SettingsListItem(
              icon: Icons.notifications_active_rounded,
              text: 'إعدادات الاشعارات',
              onTap: () {},
            ),
            SettingsListItem(
              icon: Icons.privacy_tip_rounded,
              text: 'الخصوصية',
              onTap: () {},
            ),
            SettingsListItem(
              icon: Icons.question_mark_rounded,
              text: 'المساعدة والدعم',
              onTap: () {},
            ),
            SettingsListItem(
              icon: Icons.person_add_alt_1_rounded,
              text: 'دعوة صديق',
              onTap: () {},
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.redColor,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const WelcomeView(),
                      ),
                      (Route<dynamic> route) => false);
                  _signOut();
                },
                child: Text(
                  'تسجل خروج',
                  style: getTitleStyle(color: AppColors.white, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
