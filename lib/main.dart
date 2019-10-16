import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/main_page.dart';
import 'pages/sign_in_page.dart';
import 'pages/mission_submit.dart';
import 'shared/providers/user_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Raíz da aplicação.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>.value(
          value: UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Meu Vivo Museu',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          buttonTheme: ButtonThemeData(minWidth: 10),
          textTheme: TextTheme(
            button: TextStyle(fontSize: 10),
          ),
        ),
        home: SignInPage(),
        routes: {
          SignInPage.routeName: (_) => SignInPage(),
          MainPage.routeName: (_) => MainPage(),
        },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case MissionSubmit.routeName:
              return MaterialPageRoute(
                builder: (_) => MissionSubmit(settings.arguments),
              );
              break;
            default:
              return null;
          }
        },
      ),
    );
  }
}
