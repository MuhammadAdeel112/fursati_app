import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        // Soft, light cyan/blue gradient blending into white (like FursatiPro website)
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE8F4F8), // Very soft light blue/cyan at the top
            Color(0xFFFFFFFF), // Blending into pure white
          ],
          stops: [0.0, 0.4], // The gradient ends and becomes white at 40% of the screen
        ),
      ),
      child: child,
    );
  }
}
