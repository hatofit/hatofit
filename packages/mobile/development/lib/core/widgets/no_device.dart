import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';

class NoDevice extends StatelessWidget {
  final Text? text;
  final Function()? onPressed;
  final bool showButton;
  const NoDevice({
    super.key,
    this.text,
    this.onPressed,
    this.showButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.of(context)!.didntDetectAnyDevice,
        ),
        SizedBox(height: Dimens.height8),
        Text(
          Strings.of(context)!.makeSureYourDeviceIsTurnedOnAndNearby,
        ),
        showButton ? SizedBox(height: Dimens.height8) : const SizedBox(),
        showButton
            ? ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimens.height8),
                  ),
                ),
                child: text,
              )
            : const SizedBox(),
      ],
    );
  }
}
