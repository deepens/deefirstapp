import 'dart:io';
//import 'package:deefirstapp/views/pushnotification_view.dart';
//import 'package:flutter/material.dart';

import 'package:deefirstapp/views/pushnotification_view.dart';
import 'package:flutter/material.dart';

import '../models/pushnotifiction_models.dart';
//import '../shared/routing_constants.dart';
import '../shared/locator.dart';
import '../services/navigation_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  final NavigationService _navigationService = locator<NavigationService>();

  Future initialise() async {
    if (Platform.isIOS) {
      // request permissions if we're on android
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      // Called when the app is in the foreground and we receive a push notification
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
        var title1 = message["notification"]["title"];
          var helper = message["notification"]["body"];
        //print('onResume: $message');
        print('onMessage: ' + title1);
        print('onMessage: ' + helper);
        _serialiseAndNavigate(message);
      },
      // Called when the app has been closed comlpetely and it's opened
      // from the push notification.
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        var title1 = message["notification"]["title"];
          var helper = message["notification"]["body"];
        //print('onResume: $message');
        print('onLaunch: ' + title1);
        print('onLaunch: ' + helper);


        _serialiseAndNavigate(message);
      },
      // Called when the app is in the background and it's opened
      // from the push notification.
      onResume: (Map<String, dynamic> message) async {
        var title1 = message["data"]["title"].toString();
          var helper = message["data"]["body"].toString();
        //print('onResume: $message');
        print('onResume: ' + title1);
        print('onResume: ' + helper);

        _serialiseAndNavigate(message);
      },
    );
    _fcm.requestNotificationPermissions(const IosNotificationSettings(sound: true, badge: true, alert: true));
  }
  static Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
    print('AppPushs myBackgroundMessageHandler : $message');
    return Future<void>.value();
  }  
  void _serialiseAndNavigate(Map<String, dynamic> message) {
    PushNotifiction _pushNotification = PushNotifiction();
    _pushNotification.title = message["data"]['title'].toString()??'';
    _pushNotification.body = message["data"]['body'].toString()??'';
    _pushNotification.view = message["data"]['view'].toString()??'';
  
    if (_pushNotification.view != null) {
      // Navigate to the create post view
      if (_pushNotification.view == 'push') {
       // _navigationService.navigateTo(PushNotificationViewPageRoute,arguments:{'data':_pushNotification});
       Navigator.push(_navigationService.navigationKey.currentContext,MaterialPageRoute(builder: (context) => PushNotificationView(data:_pushNotification)),);
      }
    }
  }
}