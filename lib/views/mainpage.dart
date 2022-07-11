import 'package:flutter/material.dart';
import 'package:lab3_279199/views/login.dart';
import 'package:lab3_279199/views/mainscreen.dart';
import 'package:lab3_279199/views/profile.dart';
import 'package:lab3_279199/views/subscribe.dart';
import 'Tutor.dart';
import 'fav.dart';

class MainPage extends StatefulWidget {
  // final Customer customer;
  // const MainPage({
  //   Key? key,
  //   required this.customer,
  // }) : super(key: key);
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final screens = [
        MainScreen(),
        TutorScreen(),
        SubscirbeScreen(),
  FavouriteScreen(),
    ProfileScreen(
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
                body: screens[index],
        // body: screens[index],
        // body: IndexedStack(index: index, children: screens,),
        bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: Colors.amber.shade100,
            ),
            child: NavigationBar(
              backgroundColor: Colors.yellow,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              selectedIndex: index,
              animationDuration: Duration(seconds: 3),
              destinations: [
                NavigationDestination(icon: Icon(Icons.book), label: 'Subject'),
                NavigationDestination(
                    icon: Icon(Icons.person), label: 'Tutors'),
                NavigationDestination(
                    icon: Icon(Icons.bookmark), label: 'Subscirbe'),
                NavigationDestination(
                    icon: Icon(Icons.favorite), label: 'Favourite'),
                NavigationDestination(
                    icon: Icon(Icons.account_box), label: 'Profile'),
              ],
 
            )));
  }

}