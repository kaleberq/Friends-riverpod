import 'package:friends/models/friend_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class FriendsState {
  final AsyncValue<List<FriendModel>> friends;

  const FriendsState({this.friends = const AsyncValue.loading()});

  FriendsState copyWith({
    AsyncValue<List<FriendModel>>? friends,
  }) {
    return FriendsState(
      friends: friends ?? this.friends,
    );
  }
}
