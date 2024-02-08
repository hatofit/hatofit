import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';

class SignWitGoogle extends StatelessWidget {
  const SignWitGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimens.height16,
        ),
        Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 0.5,
                color: Colors.grey[400],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                Strings.of(context)!.orSignInWith,
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 0.5,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimens.height16,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => context.read<AuthCubit>().signInWithGoogle(),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: Dimens.height8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.radius8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/icons/google.svg',
                  height: Dimens.height24,
                  width: Dimens.width24,
                ),
                SizedBox(
                  width: Dimens.width16,
                ),
                Text(
                  Constants.get.google,
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
