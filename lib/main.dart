import 'package:flutter/material.dart';
import 'package:promilo/app_widgets/custom_bottom_bar.dart';
import 'package:promilo/providers/bottom_bar_provider.dart';
import 'package:provider/provider.dart';
import 'screens/meetup_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BottomBarProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  final List<Widget> _screens = [
    PlaceholderWidget('Home Screen'),  // Placeholder for Home Screen
    PlaceholderWidget('Protlet Screen'),  // Placeholder for Home Screen
    MeetUpScreen(),
    PlaceholderWidget('Explore Screen'),  // Placeholder for Home Screen
    PlaceholderWidget('Account Screen'),  // Placeholder for Home Screen
  ];

  @override
  Widget build(BuildContext context) {
    final bottomBarProvider = Provider.of<BottomBarProvider>(context);
    return Scaffold(
      body: _screens[bottomBarProvider.selectedIndex],
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: bottomBarProvider.selectedIndex,
        onTap: (index) {
          bottomBarProvider.updateIndex(index);
        },
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String text;
  
 const PlaceholderWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text, style: const TextStyle(fontSize: 24)),
    );
  }
}
