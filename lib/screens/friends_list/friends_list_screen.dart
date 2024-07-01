import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends/models/FriendModel.dart';
import 'package:friends/screens/friends_view_model.dart';

class FriendsList extends ConsumerStatefulWidget {
  const FriendsList({super.key});

  @override
  _FriendsListState createState() => _FriendsListState();
}

class _FriendsListState extends ConsumerState<FriendsList> {
  late final friendsListViewModel =
      ref.read(friendsListViewModelProvider.notifier);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer(builder: (BuildContext build, WidgetRef refData, _) {
                final AsyncValue<List<FriendModel>> friends =
                    ref.watch(friendsListViewModelProvider).friends;

                return friends.when(data: (data) {
                  return Text(data.first.name);
                }, error: (Object, StackTrace) {
                  return SizedBox.shrink();
                }, loading: () {
                  return SizedBox.shrink();
                });
              }),
              TextButton(
                onPressed: () {
                  friendsListViewModel.setNewFriend(
                      friend: FriendModel(
                          name: 'Rafael', age: 28, hobby: 'futebol'));
                },
                child: const Text('add friend'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
