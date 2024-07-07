import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heads_up/pages/home.dart';
import 'package:heads_up/pages/loading.dart';
import 'package:heads_up/pages/error.dart' as e;
import 'package:heads_up/utils/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
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
    http.get(Uri.parse("https://heads-up-jxhg.onrender.com/")).then((res) {
      print(res);
      if (res.statusCode == 200) {
        setState(() {
          loading = false;
          error = null;
        });
      } else {
        setState(() {
          loading = false;
          error = "An error occurred!\nTry Again Later";
        });
      }
      // }else if(res.isRedirect)
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loading == true
          ? const Loading()
          : error != null
              ? e.Error(
                  error: error!,
                )
              : const Home(),
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
