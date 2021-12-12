import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/film_bloc/detail_film_bloc/detail_film_cubit.dart';
import 'package:star_wars_front/domain/models/films.dart';
import 'package:star_wars_front/presentation/components/detail_top_bar.dart';

import 'widgets/detail_film_body.dart';

class DetailFilm extends StatelessWidget {
  final Film film;

  const DetailFilm({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailFilmCubit, DetailFilmState>(
      builder: (context, state) {
        if (state is DetailStateNothing) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DetailStateLoaded) {
          return Scaffold(
            body: Column(
              children: [
                DetailTopBar(title: state.responseFilm.film.displayTitle),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: DetailFilmBody(
                      film: state.responseFilm.film,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
      },
    );
  }
}
