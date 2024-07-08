import 'package:friends/domain/models/friend_model.dart';
import 'package:friends/shared/state_generic.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class FriendsState implements StateGeneric<FriendModel> {
  final AsyncValue<List<FriendModel>> friends;

  const FriendsState({this.friends = const AsyncValue.data([])});

  FriendsState _copyWith({
    AsyncValue<List<FriendModel>>? friends,
  }) {
    return FriendsState(
      friends: friends ?? this.friends,
    );
  }

  @override
  setValue({required List<FriendModel> value}) {
    return _copyWith(friends: AsyncValue.data(value));
  }

  @override
  loadingState() {
    return _copyWith(friends: AsyncLoading());
  }
}
