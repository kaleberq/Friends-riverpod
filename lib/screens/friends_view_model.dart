import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends/models/FriendModel.dart';
import 'package:friends/screens/friends_state.dart';

final friendsListViewModelProvider =
    StateNotifierProvider.autoDispose<FriendsListViewModel, FriendsState>(
        (ref) {
  return FriendsListViewModel();
});

class FriendsListViewModel extends StateNotifier<FriendsState> {
  FriendsListViewModel() : super(const FriendsState());

  setNewFriend({required FriendModel friend}) {
    //state = state.copyWith(friend);
  }
}
