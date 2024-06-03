import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newss/view/widgets/news%20card.dart';
import 'package:provider/provider.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  void fetchData(BuildContext context) {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF121481),
          elevation: 0,
          title: const Text(
            "DAY BY DAY",
          ),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        body: Consumer<HomeScreenController>(builder: (context, provider, child) {
          return provider.isLoading == true
              ? Center(
              child: LottieBuilder.asset(
                "assets/loading.json",
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ))
              : Padding(
            padding: const EdgeInsets.all(10),

            child: ListView.separated(
                itemBuilder: (context, index) => NewsCard(
                  title: provider.newsModel.articles?[index].title.toString() ?? "",
                  description: provider.newsModel.articles?[index].description
                      .toString() ??
                      "",
                  date:
                  provider.newsModel.articles?[index].publishedAt,
                  imageUrl: provider
                      .newsModel.articles?[index].urlToImage
                      .toString() ??
                      "",
                  contant: provider.newsModel.articles?[index].content
                      .toString() ??
                      "",
                  sourceName: provider
                      .newsModel.articles?[index].source?.name
                      .toString() ??
                      "",
                  url: provider.newsModel.articles?[index].url
                      .toString() ??
                      "",
                ),
                separatorBuilder: (context, index) => const Divider(
                  height: 20,
                ),
                itemCount: provider.newsModel.articles?.length ?? 0),
          );
        }));
  }
}

