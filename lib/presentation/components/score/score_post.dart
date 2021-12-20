import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/decoration_bloc/decoration_bloc_cubit.dart';
import 'package:star_wars_front/presentation/components/score/widgets/toggle_dislike.dart';
import 'package:star_wars_front/presentation/components/score/widgets/toggle_favorite.dart';
import 'package:star_wars_front/presentation/components/score/widgets/toggle_like.dart';

class ScorePost extends StatelessWidget {
  const ScorePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DecorationCubit, DecorationState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ToggleLike(
              isLike: (){
                context.read<DecorationCubit>().toggleLike();
              },
              isChange: state.like,
            ),
            const SizedBox(width: 5),
            ToggleDisLike(
              isDislike: (){
                context.read<DecorationCubit>().toggleDisLike();
              },
              isChange: state.dislike,
            ),
            const SizedBox(width: 5),
            ToggleFavorite(
              isFavorite: (){
                context.read<DecorationCubit>().toggleFavorite();
              },
              isChange: state.favorite,
            ),
          ],
        );
      },
    );
  }
}
