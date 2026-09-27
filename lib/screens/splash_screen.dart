import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _openHome();
  }

  Future<void> _openHome() async {
    // Gives the application enough time to display the
    // branded splash screen before opening the dashboard.
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) {
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeDashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 180,
              height: 110,
              child: Image.asset(
                'assets/images/pokestrength_logo.png',
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            const CircularProgressIndicator(color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}
