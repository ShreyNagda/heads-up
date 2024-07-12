import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heads_up/pages/home.dart';
import 'package:heads_up/pages/loading.dart';
import 'package:heads_up/pages/error.dart' as e;
import 'package:heads_up/utils/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey("dark")) {
    prefs.setBool("dark", true);
  }
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loading = true;
  String? error;
  @override
  void initState() {
    checkApiStatus();
    super.initState();
  }

  void checkApiStatus() {
    http.get(Uri.parse("https://heads-up-jxhg.onrender.com/"));
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        loading = false;
        error = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loading == true
          ? Loading(
              text: "Fetching Data",
            )
          : error != null
              ? e.Error(
                  error: error!,
                )
              : const Home(),
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
