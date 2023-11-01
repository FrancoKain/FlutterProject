import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/parameter/init_values.dart';
import 'package:provider/provider.dart';
import 'src/presentation/pages/home_page.dart';
import 'src/core/utils/styles.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    InitCore _initCore = InitCore();
    return FutureBuilder(
      future: _initCore.initialize(),
      builder: (BuildContext context,
          AsyncSnapshot<bool> snapshot,
      ){
        if(snapshot.hasData){
          return MaterialApp(
            title: MyAppStyles.appTitle,
            debugShowCheckedModeBanner: false,
            home: Provider<InitCore>(
                create: (_) => _initCore,
                child: HomePage(),
            ),
          );
        }
        else{
          return const CircularProgressIndicator();
        }
      }
    );
  }
}
