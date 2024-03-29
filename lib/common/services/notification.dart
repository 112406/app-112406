import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
  //   AndroidFlutterLocalNotificationsPlugin>().requestNotificationsPermission();

  String? selectedNotificationPayload;

  final BehaviorSubject<String?> selectNotificationSubject =
      BehaviorSubject<String?>();
  initializeNotification() async {
    _configureSelectNotificationSubject();
    await _configureLocalTimeZone();
    // this is for latest iOS settings
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
            requestSoundPermission: true,
            requestBadgePermission: true,
            requestAlertPermission: true,
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    final InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (data) async {
      debugPrint('notification payload: ${data.payload!}');
      selectNotificationSubject.add(data.payload);
    });
  }

  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    // print(timeZoneName);
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  // Future selectNotification(String? payload) async {
  //   if (payload != null) {
  //     print('notification payload: $payload');
  //   } else {
  //     print("Notification Done");
  //   }
  //   Get.to(() => Container(
  //         color: Colors.white,
  //       ));
  // }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title!),
        content: Text(body!),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(payload),
                ),
              );
            },
          )
        ],
      ),
    );
    // Get.dialog(const Text('Welcome to flutter'));
  }

  displayNotification({required String title, required String body}) async {
    print("doing test");
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'You change your theme',
      'You changed your theme back !',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  Future<void> scheduledNotification(int hour, int minutes ,Task task) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      task.id!,
      task.title,
      task.note,
      // tz.TZDateTime.parse(
      //     tz.local, _nextInstanceOfTenAM(hour, minutes).toString()),
      await _nextInstanceOfTime(hour, minutes),
      // tz.TZDateTime.now(tz.local)
      //     .add(const Duration(days: 0, minutes: 0, seconds: 5)),
      // tz.TZDateTime.parse(tz.local, date),
      const NotificationDetails(
          android: AndroidNotificationDetails(
              'your channel id', 'your channel name',
              importance: Importance.max, priority: Priority.max),
          iOS: DarwinNotificationDetails()),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: "${task.title}|${task.note}|${task.startTime}|",
    );
  }

  static Future<tz.TZDateTime> _nextInstanceOfTime(int hour, int minutes) async{
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    // print(timeZoneName);
    tz.setLocalLocation(tz.getLocation(timeZoneName));
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    // print(tz.TZDateTime.parse(tz.local, scheduledDate.toString()));
    print("${scheduledDate}aaa");
    // print(tz.TZDateTime.now(tz.local));
    // print(tz.TZDateTime.now(tz.local)
    //     .add(const Duration(days: 0, minutes: 1, seconds: 15)));
    return scheduledDate;
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String? payload) async {
      debugPrint("My payload is ${payload!}");
      await Get.to(() => SecondScreen(payload));
    });
  }

  periodicalyNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'repeating channel id',
      'repeating channel name',
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(0, 'repeating title',
        'repeating body', RepeatInterval.everyMinute, platformChannelSpecifics,
        androidAllowWhileIdle: true);
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen(this.payload, {super.key});

  final String? payload;

  @override
  State<StatefulWidget> createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  String? _payload;

  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' ${_payload.toString().split("|")[0] ?? 'No title'}'),
      ),
      body: Container(
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            child: const Column(children: [
              Text(
                "Hello, DBestech",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF162339)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "You have a new reminder",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
            ]),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
              margin: const EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50))),
              //child:Text('${_payload}'),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.text_format, size: 35, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Title",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _payload.toString().split("|")[0] ?? 'No message',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Icon(Icons.description, size: 35, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Description",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _payload.toString().split("|")[1] ?? 'No message',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Icon(Icons.calendar_today_outlined,
                            size: 35, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Date",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _payload.toString().split("|")[2] ?? 'No message',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ]),
            ),
          ),
          const SizedBox(
            height: 140,
          )
        ]),
      ),
    );
  }
}
