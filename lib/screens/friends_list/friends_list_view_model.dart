import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends/models/FriendModel.dart';
import 'package:friends/screens/friends_state.dart';

final friendsListViewModelProvider = StateNotifierProvider.autoDispose<FriendsListViewModel, FriendsState>(
        (ref){
          return FriendsListViewModel(ref);
        }
);


class FriendsListViewModel extends  StateNotifier {
  FriendsListViewModel(super._state);

setNewFriend({required FriendModel friend}){
  state = state.copyWith(friend);
}
}