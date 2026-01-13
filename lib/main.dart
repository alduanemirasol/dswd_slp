import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/global_providers.dart';
import 'services/db_service.dart';
import 'router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBService().database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: globalProviders(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
