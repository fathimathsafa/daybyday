import 'package:flutter/material.dart';

import '../view/categori.dart';
import '../view/home.dart';
import '../view/search_screen.dart';

class BottomNavController with ChangeNotifier{
  int selectedindex= 0;

  void onItemTap(index){
    selectedindex = index;
    notifyListeners();
  }
  List<Widget>myPages = [
    HomeScreen(),
    Categori_page(),
    Search_screen(),
  ];
}