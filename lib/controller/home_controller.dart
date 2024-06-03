import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/news_model.dart';

class HomeScreenController with ChangeNotifier{
  late News newsModel;
  bool isLoading = false;
  var baseurl ="https://newsapi.org";
  
  fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("$baseurl/v2/top-headlines?country=in&apiKey=8bc21c8b9ed54081a5df779ba504b47d");
    final response = await http.get(url);
    print(response.statusCode);

    Map<String,dynamic> decodeData ={};   /// map for string response body
    if(response.statusCode == 200){
      decodeData = jsonDecode(response.body);
    }else{
      print("Api Failed");
    }
    newsModel= News.fromJson(decodeData);
    isLoading = false;
    notifyListeners();

  }
  Future<void>launchURL(String url)async{
    final Uri url1 = Uri.parse(url);
    try{
      if(! await launchUrl(url1,mode:LaunchMode.inAppWebView)){
        await launchUrl(url1,mode:LaunchMode.inAppWebView);
      }else{
        throw "Could not lauch $url";
      }
    }catch(e){
      print("Error launching url: $e");
    }
  }
  void shareText({String textToShare = ""}){
    try{
      Share.share(textToShare);
    }catch(e){
      print("Error sharing $e");
    }
  }
 }