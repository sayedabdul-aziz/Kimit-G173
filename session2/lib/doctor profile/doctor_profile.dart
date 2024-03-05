import 'package:flutter/material.dart';
import 'package:session2/doctor%20profile/colors.dart';
import 'package:session2/doctor%20profile/widgets/custom_btn.dart';
import 'package:session2/doctor%20profile/widgets/custom_tile.dart';
import 'package:session2/doctor%20profile/widgets/doctor_header.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
            onPressed: () {},
            color: AppColors.white,
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text(
          'Doctor Profile',
          style: TextStyle(color: AppColors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header
              const DoctorProfileHeader(),

              // about
              const SizedBox(
                height: 25,
              ),
              const Text(
                'About',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 7,
              ),
              const Text('Former Head of Dentist at Cairo University'),
              // address
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: AppColors.secondry,
                    borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  children: [
                    CustomTileWidget(
                        text: 'Cairo University', icon: Icons.local_hospital),
                    CustomTileWidget(
                        text: '9:00 - 22:00', icon: Icons.watch_later_outlined),
                    CustomTileWidget(
                        text: 'Nasr City, Cairo',
                        icon: Icons.location_on_rounded),
                  ],
                ),
              ),
              const Divider(
                // color: AppColors.primary,
                // thickness: 4,
                // indent: 30,
                // endIndent: 30,
                height: 20,
              ),
              //contacts
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Contact Info',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: AppColors.secondry,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    const CustomTileWidget(
                        text: 'ahmed@gmail.com', icon: Icons.email_rounded),
                    InkWell(
                        onTap: () {},
                        child: const CustomTileWidget(
                            text: '01120510540', icon: Icons.call)),
                    const CustomTileWidget(
                        text: '001515440500', icon: Icons.call),
                  ],
                ),
              ),
              //buttons
              const SizedBox(height: 15),
              // SizedBox vs Container
              CustomButton(
                  text: 'Chat With Dr. Ahmed',
                  background: AppColors.green,
                  onPressed: () {}),
              const SizedBox(height: 7),
              CustomButton(
                  text: 'Book An Appointment',
                  background: AppColors.primary,
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
