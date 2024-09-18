import 'package:flutter/material.dart';
import 'package:phone_auth_app/screens/signIn_signUp_screen/widgets/circular_buttons.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularImageButton(
          imageUrl:
              'https://img.freepik.com/premium-vector/logo-google_798572-207.jpg',
          onPressed: () {},
        ),
        const SizedBox(width: 20),
        CircularImageButton(
          imageUrl:
              'https://store-images.s-microsoft.com/image/apps.37935.9007199266245907.b029bd80-381a-4869-854f-bac6f359c5c9.91f8693c-c75b-4050-a796-63e1314d18c9?h=210',
          onPressed: () {},
        ),
      ],
    );
  }
}
