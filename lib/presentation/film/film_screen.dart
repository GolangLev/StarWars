import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/film_bloc/list_film_bloc/film_cubit.dart';
import 'package:star_wars_front/presentation/components/container.dart';
import 'package:star_wars_front/presentation/components/top_bar.dart';

import 'list_film/list_film_items.dart';

class FilmScreenPage extends StatelessWidget {
  const FilmScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmCubit, FilmState>(builder: (context, state) {
      if (state is FilmStateNothing) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        );
      } else if (state is FilmStateLoaded) {
        return Scaffold(
          body: Column(
            children: [
              const TopBar(
                title: 'Фильмы',
              ),
              Expanded(
                  child: SingleChildScrollView(
                    child: ContentContainer(
                      child: ListFilmsItems(
                        film: state.film.film,
                      ),
                    ),
                  )),
            ],
          ),
        );
      } else {
        return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ));
      }
    });
  }
}
