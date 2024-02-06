import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.showMessage = true});

  final bool showMessage;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ColorLoader(),
          Visibility(
            visible: showMessage,
            child: Text(
              Strings.of(context)!.loading,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
