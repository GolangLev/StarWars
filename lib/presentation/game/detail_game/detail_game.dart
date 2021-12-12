import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/game_bloc/detail_game_bloc/detail_game_cubit.dart';
import 'package:star_wars_front/domain/models/games.dart';
import 'package:star_wars_front/presentation/components/detail_top_bar.dart';

import 'widgets/detail_game_body.dart';

class DetailGame extends StatelessWidget {
  final Game game;

  const DetailGame({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailGameCubit, DetailGameState>(
      builder: (context, state) {
        if (state is DetailStateNothing) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DetailStateLoaded) {
          return Scaffold(
            body: Column(
              children: [
                DetailTopBar(title: state.responseGame.game.displayTitle),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: DetailGameBody(game: state.responseGame.game),
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
