import 'package:bookia_app/core/constants/assets/assets_icons.dart';
import 'package:bookia_app/core/functions/routing.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/features/profile/presentation/manager/profile_cubit.dart';
import 'package:bookia_app/features/profile/presentation/manager/profile_states.dart';
import 'package:bookia_app/features/profile/presentation/views/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AssetsIcons.logout,
                colorFilter:
                    const ColorFilter.mode(AppColors.red, BlendMode.srcIn),
              )),
          const Gap(5)
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileStates>(
        buildWhen: (previous, current) =>
            current is GetProfileSuccess || current is GetProfileLoading,
        builder: (context, state) {
          if (state is GetProfileSuccess) {
            var profile = state.getProfileResponse.data;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // IMAGE
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            profile?.image ?? '',
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // NAME
                            Text(
                              profile?.name ?? '',
                              style: getTitleStyle(),
                            ),
                            // EMAIL
                            Text(
                              profile?.email ?? '',
                              style: getsmallStyle(),
                            ),
                          ],
                        ))
                      ],
                    ),
                    const Gap(20),
                    Divider(
                      color: AppColors.grey.withOpacity(.5),
                      endIndent: 20,
                      indent: 20,
                    ),
                    const Gap(10),
                    Card(
                      color: AppColors.white,
                      elevation: 20,
                      shadowColor: AppColors.grey.withOpacity(.3),
                      child: ListTile(
                        onTap: () {},
                        tileColor: AppColors.white,
                        title: const Text('My Orders'),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    ),
                    const Gap(5),
                    Card(
                      color: AppColors.white,
                      elevation: 20,
                      shadowColor: AppColors.grey.withOpacity(.3),
                      child: ListTile(
                        onTap: () {
                          navigateTo(context, EditprofileView(model: profile!));
                        },
                        tileColor: AppColors.white,
                        title: const Text('Edit Profile'),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    ),
                    const Gap(5),
                    Card(
                      color: AppColors.white,
                      elevation: 20,
                      shadowColor: AppColors.grey.withOpacity(.3),
                      child: ListTile(
                        onTap: () {},
                        tileColor: AppColors.white,
                        title: const Text('Reset Password'),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    ),
                    const Gap(5),
                    Card(
                      color: AppColors.white,
                      elevation: 20,
                      shadowColor: AppColors.grey.withOpacity(.3),
                      child: ListTile(
                        onTap: () {},
                        tileColor: AppColors.white,
                        title: const Text('Contact Us'),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    ),
                    const Gap(5),
                    Card(
                      color: AppColors.white,
                      elevation: 20,
                      shadowColor: AppColors.grey.withOpacity(.3),
                      child: ListTile(
                        onTap: () {},
                        tileColor: AppColors.white,
                        title: const Text('About Us'),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    ),
                    const Gap(5),
                    Card(
                      color: AppColors.white,
                      elevation: 20,
                      shadowColor: AppColors.grey.withOpacity(.3),
                      child: ListTile(
                        onTap: () {},
                        tileColor: AppColors.white,
                        title: const Text('Terms & Conditions'),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
