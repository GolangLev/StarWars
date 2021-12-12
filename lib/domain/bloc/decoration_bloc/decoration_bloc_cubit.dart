import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'decoration_bloc_state.dart';

class DecorationCubit extends Cubit<DecorationState> {
  DecorationCubit() : super(const DecorationState());

  void toggleLike() {
    final like = !state.like;
    emit(state.copyWith(
      like: like,
    ));
  }

  void toggleDisLike() {
    final dislike = !state.dislike;
    emit(state.copyWith(
      dislike: dislike,
    ));
  }

  void toggleFavorite() {
    final favorite = !state.favorite;
    emit(state.copyWith(
      favorite: favorite,
    ));
  }

  isFocusNickNameField(value) {
    final isFocus = value;
    emit(state.copyWith(
      isFocusNickName: isFocus,
    ));
  }

  togglePasswordVisibility() {
    final passwordVisibility = !state.isVisibility;
    emit(state.copyWith(
      isVisibility: passwordVisibility,
    ));
  }
}
