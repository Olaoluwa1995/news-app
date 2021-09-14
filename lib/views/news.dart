import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/constants/app-api.dart';
import 'package:news_app/constants/app-colors.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/views/widgets/bottom-navbar-item.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({ Key? key }) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<News> _newsList = [];
  List<News> _favorites = [];
  List<News> _displayList = [];
  bool _isLoading = false;
  bool _newsActive = true;

  Future<void> fetchNews () async {
     setState(() {
      _isLoading = true;
    });
    http.Response response = await http.get(
      Uri.parse('${AppApi.newsUrl}'),
      headers: {'Content-Type': 'application/json'},
    );
    final Map<String, dynamic> responseData = await json.decode(response.body);
    final data = responseData['data'];
      data.forEach((news) {
        _newsList.add(News(
          id: news['id'],
          summary: news['summary'],
          title: news['title'],
          published: news['published'],
        ));
      });
    if(data.length > 0) setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    fetchNews();
    _displayList = _newsList;
    super.initState();
  }

  void favToggle (News news) {
    setState(() {
      if (_favorites.contains(news)) {
        _favorites.remove(news);
      }
      else {
        _favorites.add(news);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: _isLoading ? 
        Center(
          child: CircularProgressIndicator()
        ) :
       Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: _newsActive == false && _favorites.length == 0 ?
              Center(
                child: Text('No favorite news yet.'),
              ) :
               ListView.builder(
                padding: EdgeInsets.only(bottom: size.height * 0.1, top: size.height * 0.03),
                itemCount: _displayList.length,
                itemBuilder: (BuildContext context, int index) {
                final news = _displayList[index];
                return GestureDetector(
                  onTap: () => favToggle(news),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: size.height * 0.02, 
                      left: size.width * 0.05,
                      right: size.width * 0.05,
                    ),
                    padding: EdgeInsets.all(15),
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 4,
                          offset: Offset(0, 5),
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.02),
                          child: Icon(_favorites.contains(news) ? Icons.favorite : Icons.favorite_border_outlined, 
                            color:_favorites.contains(news) ? Colors.red : Colors.black54,
                            size: 40,
                            semanticLabel: 'favorite indicator',
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.63,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                news.title, 
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Text(
                                news.summary == null ? '' : news.summary, 
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Text(
                                news.published, 
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })
            ),
            Positioned(
              bottom: 0,
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                width: size.width,
                height: size.height * 0.07,
                color: AppColors.backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomNavItem(
                      bgColor: _newsActive ? Colors.blue.shade900 : Colors.white,
                      iconColor: _newsActive ? Colors.white : Colors.black,
                      textColor: _newsActive ? Colors.white : Colors.black,
                      icon: Icons.format_list_bulleted,
                      text: 'News',
                      onPressed: () {
                        setState(() {
                          _displayList = _newsList;
                          _newsActive = true;
                        });
                      },
                    ),
                    BottomNavItem(
                      bgColor: _newsActive ? Colors.white : Colors.blue.shade900,
                      iconColor: _newsActive ? Colors.red : Colors.white,
                      textColor: _newsActive ? Colors.black : Colors.white,
                      icon: Icons.favorite,
                      text: 'Favs',
                      onPressed: () {
                        setState(() {
                          _displayList = _favorites;
                          _newsActive = false;
                        });
                      },
                    ),
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}