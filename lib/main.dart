import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:legal_chat/app/bindings/main_bindings.dart';
import 'package:legal_chat/app/controllers/bottom_nav_controller.dart';
import 'package:legal_chat/app/ui/screens/users_screen.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import 'app/routes/app_routes.dart';
import 'app/ui/screens/message_view.dart';
import 'app/ui/widgets/bottom_navigator.dart';

void onConnect(StompFrame frame) {
  stompClient.subscribe(
    destination: '/topic/messages',
    callback: (frame) {
      Map<String, dynamic> result = json.decode(frame.body!);
      print(result);
    },
  );

  Timer.periodic(const Duration(seconds: 10), (_) {
    stompClient.send(
      destination: '/app/chat',
      body: json.encode({'from': 'from', 'text': 'text'}),
    );
  });
}

final stompClient = StompClient(
  config: StompConfig(
    url: 'ws://192.168.1.5:8080/chat',
    onConnect: onConnect,
    beforeConnect: () async {
      print('waiting to connect...');
      print('connecting...');
    },
    onWebSocketError: (dynamic error) => print(error.toString()),
    stompConnectHeaders: {'Authorization': 'Bearer yourToken'},
    webSocketConnectHeaders: {'Authorization': 'Bearer yourToken'},
  ),
);

void main() {
  stompClient.activate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(392, 816),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context){
        return GetMaterialApp(
          title: 'Legal Chat',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black
              ),
              shadowColor: Colors.white,
              // color: Colors.white,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
              backgroundColor: Colors.white,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
              )

            ),
            listTileTheme: ListTileThemeData(
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            ),
            textTheme: TextTheme(
              bodyText2: TextStyle(

              ),

            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.blue,
              selectedIconTheme: IconThemeData(
                color: Colors.blue
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none
              ),
              contentPadding: EdgeInsets.all(10.0)
            ),
            scaffoldBackgroundColor: Colors.white
          ),
          builder: ( context, widget){
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          initialRoute: '/',
          getPages:  AppPages.routes ,
          initialBinding: MainBindings(),
          home: ControllerScreen(),
        );
      },
    );
  }
}

class ControllerScreen extends StatelessWidget {
  const ControllerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavController bottomNavController = Get.find();
    return Scaffold(
      bottomNavigationBar: BotomNavigator(),
      body: Obx(()=>
        IndexedStack(
          index: bottomNavController.tabIndex.value,
          children: [
            MessageView(),
            UsersScreen()
          ],
        ),
      )
    );
  }
}
