import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:sensormobileapplication/components/ThemeProvider.dart';
import 'package:sensormobileapplication/screens/StepCounter.dart';
import 'package:sensormobileapplication/screens/compass.dart';
import 'package:sensormobileapplication/screens/lightsensor.dart';
import 'package:sensormobileapplication/screens/maps.dart';
import 'package:sensormobileapplication/screens/proximitysensor.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
  await initNotifications();
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
      // Handle notification tap
    },
  );
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VitalTrack',
      theme: themeNotifier.currentTheme,
      home: const MyHomePage(title: 'VitalTrack'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({required this.title, Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.secondary,
        title: Text(
          widget.title,
          style: TextStyle(color: theme.colorScheme.onSecondary),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.primaryColorDark, theme.primaryColorLight],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://source.unsplash.com/random/800x600', 
              width: 300,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null ?
                        loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                );
              },
            ),
            SizedBox(height: 20),
            Icon(Icons.devices_other, size: 60, color: theme.colorScheme.onPrimary), // Technology Icon
            SizedBox(height: 10),
            Text(
              'Welcome to VitalTrack',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Explore our sensors and tools to monitor your environment!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: theme.colorScheme.onPrimary.withAlpha(200),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildSpeedDial(context, themeNotifier, theme),
    );
  }

  Widget _buildSpeedDial(
      BuildContext context, ThemeNotifier themeNotifier, ThemeData theme) {
    return SpeedDial(
      icon: Icons.filter_list,
      activeIcon: Icons.close_sharp,
      backgroundColor: theme.hintColor,
      foregroundColor: theme.primaryColor,
      overlayColor: Colors.transparent,
      children: [
        SpeedDialChild(
          child: Icon(Icons.location_on, color: theme.primaryColor),
          backgroundColor: theme.hintColor,
          label: 'Maps',
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MapPage())),
        ),
        SpeedDialChild(
          child: Icon(Icons.sensor_occupied_sharp, color: theme.primaryColor),
          backgroundColor: theme.hintColor,
          label: 'Proximity Sensor',
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ProximityPage())),
        ),
        SpeedDialChild(
          child: Icon(Icons.directions_walk_rounded, color: theme.primaryColor),
          backgroundColor: theme.hintColor,
          label: 'Step Counter',
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => StepCounterPage())),
        ),
        SpeedDialChild(
          child: Icon(Icons.compass_calibration_sharp,
              color: theme.primaryColor),
          backgroundColor: theme.hintColor,
          label: 'Compass',
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CompassPage())),
        ),
        SpeedDialChild(
          child: Icon(Icons.light_mode, color: theme.primaryColor),
          backgroundColor: theme.hintColor,
          label: 'Light Sensor',
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LightSensorPage())),
        ),
      ],
    );
  }
}
