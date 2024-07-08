import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends/domain/models/friend_model.dart';
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

  void setValue({required FriendModel value}) async {
    if (state.friends.value!.isNotEmpty) {
      final List<FriendModel> friends = state.friends.value!;
      state = state.loadingState();
      await Future.delayed(Duration(seconds: 2));
      friends.add(value);
      state = state.setValue(value: friends);
    } else {
      state = state.setValue(value: [value]);
    }
  }

  void excludeValue({required FriendModel value}) async {
    final List<FriendModel> friends = state.friends.value!;
    state = state.loadingState();
    await Future.delayed(Duration(seconds: 2));

    friends.removeWhere((data) => data == value);
    state = state.setValue(value: friends);
  }
}
