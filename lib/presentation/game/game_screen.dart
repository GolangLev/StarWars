import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/game_bloc/list_game_bloc/game_cubit.dart';
import 'package:star_wars_front/presentation/components/container.dart';
import 'package:star_wars_front/presentation/components/top_bar.dart';

import 'list_game/list_game_items.dart';

class GameScreenPage extends StatelessWidget {
  const GameScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(builder: (context, state) {
      if (state is GameStateNothing) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        );
      } else if (state is GameStateLoaded) {
        return Scaffold(
          body: Column(
            children: [
              const TopBar(
                title: 'Игры',
              ),
              Expanded(
                  child: SingleChildScrollView(
                    child: ContentContainer(
                      child: ListGamesItems(
                        game: state.game.game,
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
