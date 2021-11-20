import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/news_bloc/news_bloc.dart';
import 'package:star_wars_front/domain/repository/news_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(NewsRepository()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Test Bloc and API'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ActionButtons(),
            Expanded(child: NewsList()),
          ],
        ),
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewsBloc _bloc = BlocProvider.of<NewsBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
          child: const Text('Load'),
          onPressed: () {
            _bloc.add(NewsLoad());
          },
        ),
        const SizedBox(width: 7),
        OutlinedButton(
          child: const Text('Clear'),
          onPressed: () {
            _bloc.add(NewsClear());
          },
        ),
      ],
    );
  }
}

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if(state is NewsEmptyState){
          return const Center(child: Text('Нажмите на кнопку загрузки, список пусть'),);
        }else if(state is NewsLoadingState){
          return const Center(child: CircularProgressIndicator());
        }else if(state is NewsLoadedState){
          return ListView.builder(
            itemCount: state.loadedNews.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 48,
                color: index % 2 == 0 ? Colors.white : Colors.blueAccent[50],
                child: ListTile(
                  leading: const Text(
                    'ID: 1',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  title: Column(
                    children: [
                      const Text(
                        'title',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'sub_title',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          Text(
                            'description',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }else{
          return const Center(child: Text("Error"),);
        }
      },
    );
  }
}
