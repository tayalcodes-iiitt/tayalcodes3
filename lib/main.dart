// ignore_for_file: depend_on_referenced_packages, dead_code
// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_apptesting/home_page.dart';
import 'package:flutter_apptesting/list_provider.dart';
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:share_plus/share_plus.dart';
//import 'package:provider_dynamic_listview/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic list view with provider',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ChangeNotifierProxyProvider0<ListProvider>(
        create: (context) => ListProvider(),
        child: (MyHomePage()),
      ),
    );
  }
}
