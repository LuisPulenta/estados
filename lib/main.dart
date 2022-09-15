import 'package:estados/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/pagina1',
      // routes: {
      //   'pagina1': (_) => const Pagina1Screen(),
      //   'pagina2': (_) => const Pagina2Screen(),
      // },
      getPages: [
        GetPage(name: '/pagina1', page: () => Pagina1Screen()),
        GetPage(name: '/pagina2', page: () => Pagina2Screen())
      ],
    );
  }
}
