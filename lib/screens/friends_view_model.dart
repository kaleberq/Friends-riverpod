import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends/models/friend_model.dart';
import 'package:friends/screens/friends_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final friendsListViewModelProvider =
    StateNotifierProvider.autoDispose<FriendsListViewModel, FriendsState>(
        (ref) {
  return FriendsListViewModel();
});

@riverpod
class FriendsListViewModel extends StateNotifier<FriendsState> {
  FriendsListViewModel() : super(const FriendsState());

  setNewFriend({required FriendModel friend}) async {
    if (state.friends.hasValue) {
       final List<FriendModel> friends = state.friends.value!;
       state = state.copyWith(friends: AsyncLoading());
       await Future.delayed(Duration(seconds: 1));
       friends.add(friend);
      state = state.copyWith(friends: AsyncValue.data(friends));
    } else {
      state = state.copyWith(friends: AsyncValue.data([friend]));
    }
  }
  excludeFriend({required FriendModel friend})async {
    final List<FriendModel> friends = state.friends.value!;
    state = state.copyWith(friends: AsyncLoading());
    await Future.delayed(Duration(seconds: 1));

    friends.removeWhere((data) => data == friend);
    state = state.copyWith(friends: AsyncValue.data(friends));
  }
}
