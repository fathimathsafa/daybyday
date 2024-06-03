import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newss/controller/search_screen_controller.dart';
import 'package:newss/view/widgets/news%20card.dart';
import 'package:provider/provider.dart';

class Search_screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    SearchScreenController provider = Provider.of<SearchScreenController>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 45,
                      width: MediaQuery.sizeOf(context).width * 2 / 3,
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF121481), width: 3)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          provider.searchData(searchText: textController.text.toLowerCase());
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                            MaterialStatePropertyAll(Color(0xFF121481))),
                        child: const Text(
                          "Search",
                          style: TextStyle(color: Colors.white,fontSize: 13),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Provider.of<SearchScreenController>(context).isLoading ==
                      true
                      ? Center(
                      child: LottieBuilder.asset(
                        "assets/loading.json",
                        fit: BoxFit.cover,
                        height: 150,
                        width: 150,
                      ))
                      : ListView.separated(
                      itemBuilder: (context, index) => NewsCard(
                          title:
                          provider.newsModel?.articles?[index].title ?? "",
                          description:
                          provider.newsModel?.articles?[index].description ??
                              "",
                          date:
                          provider.newsModel?.articles?[index].publishedAt,
                          imageUrl:
                          provider.newsModel?.articles?[index].urlToImage ??
                              "",
                          contant: provider.newsModel?.articles?[index].content ??
                              "",
                          sourceName:
                          provider.newsModel?.articles?[index].source?.name ??
                              "",
                          url: provider.newsModel?.articles?[index].url ?? ""),
                      separatorBuilder: (context, index) => const Divider(height: 20),
                      itemCount: provider.newsModel?.articles?.length ?? 0),
                )
              ],
            ),
          )),

    );
  }
}
