import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmojiPicker extends StatelessWidget {
  // callback to return the selected emoji
  final void Function(String) onEmojiSelected;

  const EmojiPicker({super.key, required this.onEmojiSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildEmojiItem(context, '😄', 'happy'),
        _buildEmojiItem(context, '😊', 'good'),
        _buildEmojiItem(context, '😐', 'neutral'),
        _buildEmojiItem(context, '😔', 'sad'),
        _buildEmojiItem(context, '😢', 'awful'),
      ],
    );
  }

  Widget _buildEmojiItem(BuildContext context, String emoji, String mood) {
    return GestureDetector(
        onTap: () {
          onEmojiSelected(mood);
        },
        child: Container(
          child: Text(
            emoji,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 26.sp,
                ),
          ),
        ));
  }
}
