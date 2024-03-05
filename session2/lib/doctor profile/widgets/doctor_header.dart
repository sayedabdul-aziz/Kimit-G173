import 'package:flutter/material.dart';
import 'package:session2/doctor%20profile/colors.dart';

class DoctorProfileHeader extends StatelessWidget {
  const DoctorProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 70,
          backgroundImage: NetworkImage(
            'https://i.pinimg.com/736x/00/f8/e6/00f8e62a60bba40c1cbc109b2a8c559a.jpg',
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dr. Ahmed Tarek',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary),
            ),
            const Text(
              'Dentist',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            const Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text('5')
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.secondry,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.call,
                      ),
                      Text('1')
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.secondry,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.call,
                      ),
                      Text('2')
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
