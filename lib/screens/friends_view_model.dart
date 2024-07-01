import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends/models/FriendModel.dart';
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

  setNewFriend({required FriendModel friend}) {
    List<FriendModel> friends = [];
    if (state.friends.hasValue) {
      friends = state.friends.value!;
      friends.add(friend);
    } else {
      friends.add(friend);
    }
    state = state.copyWith(friends: AsyncValue.data(friends));
  }
}
