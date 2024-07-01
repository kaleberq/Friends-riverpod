import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends/models/FriendModel.dart';

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
