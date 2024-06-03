import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newss/view/widgets/news%20card.dart';
import 'package:provider/provider.dart';

import '../controller/category_controller.dart';

class Categori_page extends StatelessWidget {
void fetchData(BuildContext context)async{
  Provider.of<CategoryController>(context, listen: false).fetchData();
}

  @override
  Widget build(BuildContext context) {
  fetchData(context);
    return Consumer<CategoryController>(
      builder: ( context, provider ,child) {
        return DefaultTabController(
            length: provider.categoryList.length,
            initialIndex: 0,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
              backgroundColor: Color(0xFF121481),
                title: Text("Categories"),
                titleTextStyle: TextStyle(
                  color: Colors.white,fontSize: 20,
                  fontWeight: FontWeight.bold,

                ),
                bottom: TabBar(
                  labelStyle: TextStyle(color:Color(0xFF121481),fontWeight:FontWeight.bold
                  ),
                  labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
                  indicatorPadding:EdgeInsets.symmetric(horizontal: 5),
                  unselectedLabelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                  overlayColor: MaterialStatePropertyAll(Colors.grey),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: Color(0xFF121481),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  isScrollable:true,
                  tabs:List.generate(
                      provider.categoryList.length,
                          (index) => Tab(
                            text: provider.categoryList[index],
                          ),
                  ) ,
                  onTap: (value){
                    provider.OnTap(index:value);
                  },
                ),
              ),
              body: provider.isLoading == true
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
                      title: provider.newsModel.articles?[index].title
                          .toString() ??
                          "",
                      description: provider
                          .newsModel.articles?[index].description
                          .toString() ??
                          "",
                      date: provider
                          .newsModel.articles?[index].publishedAt,
                      imageUrl: provider
                          .newsModel.articles?[index].urlToImage
                          .toString() ??
                          "",
                      contant: provider
                          .newsModel.articles?[index].content
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
              ),




            ),
    );
      },

  );

  }
}
