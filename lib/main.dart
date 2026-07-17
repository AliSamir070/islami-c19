import 'package:flutter/material.dart';
import 'package:islami_c19/core/remote/local/prefs_manager.dart';
import 'package:islami_c19/core/resources/routes_manager.dart';
import 'package:islami_c19/ui/hadeth_details/screen/hadeth_details_screen.dart';
import 'package:islami_c19/ui/home/screen/home_screen.dart';
import 'package:islami_c19/ui/onboarding/screen_onboarding.dart';
import 'package:islami_c19/ui/sura_details/screen/sura_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<bool>(
        future: PrefsManager.hasSeenOnboarding(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          return snapshot.data! ? HomeScreen() : ScreenOnboarding();
        },
      ),
      title: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        RoutesManager.hadethDetailsRouteName: (_) => HadethDetailsScreen(),
        RoutesManager.suraDetailsRouteName: (_) => SuraDetailsScreen(),
      },
      // no initialRoute — `home` decides the first screen now
    );
  }
}