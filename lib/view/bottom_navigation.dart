import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/botton_nav_controller.dart';

class BottomnavigationScreen extends StatelessWidget {


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
            color: Color(0xFF121481)
          ),
          child: BottomNavigationBar(
            currentIndex: Provider.of<BottomNavController>(context).selectedindex,
            onTap: Provider.of<BottomNavController>(context,listen: false).onItemTap,
            elevation: 0,
            backgroundColor:Color(0xFF121481),
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
              BottomNavigationBarItem(icon: Icon(Icons.home_sharp,),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.category_rounded,),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.search_sharp,),label: ""),



            ],

          ),
        ),
      ),
    );
  }
}
