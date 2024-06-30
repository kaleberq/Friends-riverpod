import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends/models/FriendModel.dart';

class FriendsState {
  final AsyncValue<List<FriendModel>> friends;

  FriendsState({
    required this.friends
  });

  FriendsState copyWith({
    AsyncValue<List<FriendModel>>? friends,
  }) {
    return FriendsState(
      friends: friends ?? this.friends,
    );
  }
}

