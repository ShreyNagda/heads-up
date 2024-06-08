import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heads_up/Utils/globals.dart';
import 'package:heads_up/Utils/theme.dart';
import 'package:heads_up/homepage.dart';
import 'package:heads_up/widgets/loading.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loading = true;
  @override
  void initState() {
    http.get(Uri.parse(baseURL)).then((res) => {
          if (res.statusCode == 200)
            {
              setState(() {
                loading = false;
              })
            }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.lightTheme,
          home: loading
              ? const Loading(text: "Fetching information")
              : const Home(),
        );
      },
    );
  }
}
