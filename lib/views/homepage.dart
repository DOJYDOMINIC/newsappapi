import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../controler/control_provider.dart';


class MyNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('My News App'),
        ),
        body: Consumer<NewsProvider>(
          builder: (context, newsProvider, _) {
            if (newsProvider.articles.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: newsProvider.articles.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 390,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(newsProvider.articles[index].urlToImage ?? ''),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        newsProvider.articles[index].title,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        newsProvider.articles[index].description ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
