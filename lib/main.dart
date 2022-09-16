import 'package:flutter/material.dart';
import 'package:flutter_login_regis_provider/providers/auth_provider.dart';
import 'package:flutter_login_regis_provider/providers/register_provider.dart';
import 'package:flutter_login_regis_provider/providers/user_provider.dart';
import 'package:flutter_login_regis_provider/screens/dashboard.dart';
import 'package:flutter_login_regis_provider/screens/register.dart';
import 'package:flutter_login_regis_provider/screens/register_mobile.dart';
import 'package:flutter_login_regis_provider/utility/shared_preference.dart';
import 'package:provider/provider.dart';
import './screens/home.dart';
import 'models/user.dart';
import 'screens/login.dart';
import 'package:get/get.dart';
import './providers/seller_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Future<User> getUserData () => UserPreferences().getUser();

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> AuthProvider()),
          ChangeNotifierProvider(create: (_)=>UserProvider()),
          ChangeNotifierProvider(create: (_)=> RegisterProvider()),
          ChangeNotifierProvider(create: (_)=> SellerProvider())
        ],
      child:  GetMaterialApp(
        title: 'Login Registration',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
        // FutureBuilder(
        //     future: getUserData(),
        //     builder: (context, snapshot) {
        //       switch (snapshot.connectionState) {
        //         case ConnectionState.none:
        //         case ConnectionState.waiting:
        //           return CircularProgressIndicator();
        //         default:
        //           if (snapshot.hasError)
        //             return Text('Error: ${snapshot.error}');
        //           else if (snapshot.data.token == null)
        //             return Home();
        //           else
        //             Provider.of<UserProvider>(context).setUser(snapshot.data);
        //             return DashBoard();

        //       }
        //     }),
        routes: {
          '/home':(context)=>Home(),
          '/login':(context)=>Login(),
          '/register':(context)=>Register(),
          '/dashboard':(context)=>DashBoard(),
          '/register_mobile':(context)=>RegisterMobile()
        },
      ),
    );


  }
}