import 'package:flutter/material.dart';

class SettingListTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showSubtitle;
  final bool showLeading;
  final Widget leading;
  final Widget trailing;
  final VoidCallback onTap;
  const SettingListTileWidget({
    super.key,
    required this.title,
    this.subtitle = '',
    this.showSubtitle = false,
    required this.onTap,
    this.leading = const SizedBox(),
    this.trailing = const Icon(
      Icons.arrow_forward_ios,
      color: Colors.black54,
      size: 16,
    ),
    this.showLeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: showLeading ? leading : null,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: showSubtitle
          ? Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall,
            )
          : null,
      trailing: trailing,
    );
  }
}
