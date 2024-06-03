import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:newss/model/news_model.dart';
import 'package:http/http.dart'as http;
class SearchScreenController with ChangeNotifier{
  News? newsModel;
  bool isLoading = false;
  Future<void>searchData({required String searchText})async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://newsapi.org/v2/everything?q=$searchText&sortBy=popularity&apiKey=8bc21c8b9ed54081a5df779ba504b47d");
    try{
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.statusCode);
      if(response.statusCode == 200){
        final Map<String,dynamic> decodeData = jsonDecode(response.body);
        newsModel=News.fromJson(decodeData);

      }else{
        print("Api failed");
        // handle the failure case as needed
      }
    }catch (e){
      print("Error: $e");
      // handle the error case as needed
    }
    finally{
      isLoading = false;
      notifyListeners();
    }
  }
}