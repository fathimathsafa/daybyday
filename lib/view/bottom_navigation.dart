import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/botton_nav_controller.dart';

class Main_page extends StatelessWidget {
  const Main_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavController>(context).myPages[Provider.of<BottomNavController>(context).selectedindex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.cyan
          ),
          child: BottomNavigationBar(
            currentIndex: Provider.of<BottomNavController>(context).selectedindex,
            onTap: Provider.of<BottomNavController>(context,listen: false).onItemTap,
            elevation: 0,
            backgroundColor:Colors.cyan,
            selectedIconTheme: IconThemeData(
              color: Colors.white,
              size: 25,
            ),
            unselectedIconTheme:IconThemeData(
              size: 25,
              color: Colors.white
            ) ,
            showSelectedLabels: true,
            showUnselectedLabels: false,

            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_sharp,),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.category_rounded,),label: "Category"),
              BottomNavigationBarItem(icon: Icon(Icons.search_sharp,),label: "Search"),



            ],

          ),
        ),
      ),
    );
  }
}
