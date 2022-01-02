import 'package:flutter/material.dart';
import 'package:news_api_87/api_manager.dart';
import 'package:news_api_87/news_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<NewsModel>? _newsModel;

  @override
  void initState() {
    _newsModel = ApiManager().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: FutureBuilder(
        future: _newsModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("item"),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
