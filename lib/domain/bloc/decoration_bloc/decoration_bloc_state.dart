part of 'decoration_bloc_cubit.dart';

class DecorationState extends Equatable {
  const DecorationState({
    this.like = false,
    this.dislike = false,
    this.favorite = false,
    this.isFocusNickName = false,
    this.isVisibility = false,
  });

  final bool like;
  final bool dislike;
  final bool favorite;
  final bool isFocusNickName;
  final bool isVisibility;

  @override
  List<Object?> get props =>
      [like, dislike, favorite, isFocusNickName, isVisibility];

  DecorationState copyWith({
    bool? like,
    bool? dislike,
    bool? favorite,
    bool? isFocusNickName,
    bool? isVisibility,
  }) {
    return DecorationState(
      like: like ?? this.like,
      dislike: dislike ?? this.dislike,
      favorite: favorite ?? this.favorite,
      isFocusNickName: isFocusNickName ?? this.isFocusNickName,
      isVisibility: isVisibility ?? this.isVisibility,
    );
  }
}
