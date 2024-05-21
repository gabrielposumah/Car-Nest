import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_share_suzuki/common/widgets/appbar/appbar.dart';
import 'package:product_share_suzuki/common/widgets/images/g_circular_image.dart';
import 'package:product_share_suzuki/common/widgets/text/section_heading.dart';
import 'package:product_share_suzuki/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(showBackArrow: true, title: Text('Profile')),

      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Gsize.defaulSpace),
          child: Column(
            children: [
              // profile screen
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const GCircularImage(
                        image: 'assets/images/foto_profile.png',
                        width: 80,
                        height: 80),
                    TextButton(
                        onPressed: () {}, child: const Text('Change Profile Picture'))
                  ],
                ),
              ),

              // Details
              const SizedBox(height: Gsize.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: Gsize.spaceBtwItems),

              // Heading Profile Info
              const GSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: Gsize.spaceBtwItems),

              GProfileMenu(
                  onPressed: () {}, title: 'Name', value: 'Gabriel Posumah'),
              GProfileMenu(
                  onPressed: () {}, title: 'Username', value: 'GabrielP'),

              const SizedBox(height: Gsize.spaceBtwItems),
              const Divider(),
              const SizedBox(height: Gsize.spaceBtwItems),

              // Heading Personal Info
              const GSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: Gsize.spaceBtwItems),

              GProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: '13476',
                icon: Iconsax.copy,
              ),
              GProfileMenu(
                  onPressed: () {}, title: 'Email', value: 'nte@gmail.com'),
              GProfileMenu(
                  onPressed: () {},
                  title: 'Phone Number',
                  value: '+62-0182831'),
              GProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              GProfileMenu(
                  onPressed: () {},
                  title: 'Date of Birth',
                  value: '10 Oct, 1994'),

              const Divider(),
              const SizedBox(height: Gsize.spaceBtwItems),

              Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}