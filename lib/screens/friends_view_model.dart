import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends/domain/models/friend_model.dart';
import 'package:friends/screens/friends_state.dart';
import 'package:friends/shared/state_generic.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final friendsListViewModelProvider =
    StateNotifierProvider.autoDispose<FriendsListViewModel, FriendsState>(
        (ref) {
  return FriendsListViewModel();
});

@riverpod
class FriendsListViewModel extends StateNotifier<FriendsState>
    implements StateGeneric<FriendModel> {
  FriendsListViewModel() : super(const FriendsState());

  @override
  void setValue({required FriendModel value}) async {
    if (state.friends.value!.isNotEmpty) {
      final List<FriendModel> friends = state.friends.value!;
      state = state.copyWith(friends: AsyncLoading());
      await Future.delayed(Duration(seconds: 1));
      friends.add(value);
      state = state.copyWith(friends: AsyncValue.data(friends));
    } else {
      state = state.copyWith(friends: AsyncValue.data([value]));
    }
  }

  @override
  void excludeValue({required FriendModel value}) async {
    final List<FriendModel> friends = state.friends.value!;
    state = state.copyWith(friends: AsyncLoading());
    await Future.delayed(Duration(seconds: 1));

    friends.removeWhere((data) => data == value);
    state = state.copyWith(friends: AsyncValue.data(friends));
  }
}
