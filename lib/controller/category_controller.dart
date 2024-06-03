import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import '../model/news_model.dart';

class CategoryController with ChangeNotifier{
  List<String>categoryList = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];
  String category = "business";
  OnTap({required int index}){
    category = categoryList[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }
  late News newsModel ;
  bool isLoading = false;
  var baseurl ="https://newsapi.org";

  fetchData()async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("$baseurl/v2/top-headlines?country=in&category=$category&apiKey=8bc21c8b9ed54081a5df779ba504b47d");
 print(category);
 final response = await http.get(url);
 print(response.statusCode);
 Map<String,dynamic>decodeData = {};
 if(response.statusCode == 200){
   decodeData = jsonDecode(response.body);
  }else{
    print("Api failed");
  }
   newsModel= News.fromJson(decodeData);
  isLoading = false;
  notifyListeners();
}
}