import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/presentation/pages/cart_page.dart';
import 'package:shopping_app/presentation/pages/catalogue_page.dart';
import 'package:shopping_app/presentation/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart App',
      theme: appTheme(),
      debugShowCheckedModeBanner:
          false, // Add this line to remove the debug banner
      initialRoute: '/',
      routes: {
        '/': (context) => const CataloguePage(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}
