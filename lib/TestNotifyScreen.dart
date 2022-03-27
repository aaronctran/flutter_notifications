import 'package:flutter/material.dart';
import 'LocalNotifyManager.dart';

class TestNotifyScreen extends StatefulWidget {
  @override
  State<TestNotifyScreen> createState() => _TestNotifyScreenState();
}

class _TestNotifyScreenState extends State<TestNotifyScreen> {

  @override
  void initState() {
    super.initState();
    localNotifyManager.setOnNotificationReceive(onNotificationReceive);
    localNotifyManager.setOnNotificationClick(onNotificationClick);

  }

  onNotificationReceive(ReceiveNotification notification) {
    print('Notification Received: ${notification.id}');
  }

  onNotificationClick(String payload) {
    print('Payload $payload');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Notifications'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () async {
            await localNotifyManager.showNotification();
          },
          child: Text('Send Notification'),
        ),
      ),
    );
  }
}
