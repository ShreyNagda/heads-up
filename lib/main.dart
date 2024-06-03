import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heads_up/Utils/theme.dart';
import 'package:heads_up/homepage.dart';
import 'package:sensors_plus/sensors_plus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      home: const Home(),
    );
  }
}

class TiltCheck extends StatefulWidget {
  const TiltCheck({super.key});

  @override
  _TiltCheckState createState() => _TiltCheckState();
}

class _TiltCheckState extends State<TiltCheck> {
  double _z = 0.0;
  double threshhold = 6.0;
  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _z = event.z;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String tiltStatus;

    if (_z > threshhold) {
      tiltStatus = "Phone tilted up";
    } else if (_z < -threshhold) {
      tiltStatus = "Phone tilted down";
    } else {
      tiltStatus = "No tilt";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tilt Check'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              tiltStatus,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
