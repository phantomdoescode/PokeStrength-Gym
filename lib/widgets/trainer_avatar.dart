import 'package:flutter/material.dart';

class TrainerAvatar extends StatelessWidget {
  final double size;

  const TrainerAvatar({super.key, this.size = 56});

  @override
  Widget build(BuildContext context) {
    // Uses the trainer image supplied with the project's mockup assets.
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFEF5350), width: 2),
      ),
      child: ClipOval(
        child: Image.asset(
          'docs/assets/images/trainer_avatar.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
