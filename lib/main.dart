import 'package:flutter/material.dart';
import 'providers/global_providers.dart';
import 'helpers/orientation_helper.dart';
import 'helpers/router_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalProviders.initialize();
  await OrientationHelper.lockPortrait();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = buildAppRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
