import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends/models/friend_model.dart';
import 'package:friends/screens/friends_view_model.dart';
import 'package:shimmer/shimmer.dart';

class FriendsList extends ConsumerStatefulWidget {
  const FriendsList({super.key});

  @override
  _FriendsListState createState() => _FriendsListState();
}

class _FriendsListState extends ConsumerState<FriendsList> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerAge = TextEditingController();
  TextEditingController _controllerHobby = TextEditingController();

  late final friendsListViewModel =
      ref.read(friendsListViewModelProvider.notifier);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
            child: Text('Friends')
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: Consumer(builder: (BuildContext build, WidgetRef refData, _) {
                      final AsyncValue<List<FriendModel>> friends =
                          ref.watch(friendsListViewModelProvider).friends;
                      return friends.when(data: (listFriends) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          listFriends.map((friend){
                            return Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                 ListTile(
                                  title: Text('Nome: ${friend.name}'),
                                  subtitle: Text('Idade: ${friend.age.toString()}'),
                                  trailing: Text('Hobby: ${friend.hobby}'),
                                 ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      TextButton(
                                        child: const Text('Excluir'),
                                        onPressed: () {
                                          friendsListViewModel.excludeFriend(friend: friend);
                                        },
                                      ),
                                      const SizedBox(width: 8),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).toList()
                        );
                      }, error: (Object, StackTrace) {
                        return SizedBox.shrink();
                      }, loading: () {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                    }),
                  ),
                ),
              ),
              Column(
                children: [
                  TextField(
                    controller: _controllerName,
                    decoration: InputDecoration(
                      hintText: 'Digite o nome...',
                      labelText: 'Nome',
                    ),
                  ),
                  TextField(
                    controller: _controllerAge,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      hintText: 'Digite a idade...',
                      labelText: 'Idade',
                    ),
                  ),
                  TextField(
                    controller: _controllerHobby,
                    decoration: InputDecoration(
                      hintText: 'Digite o hobby...',
                      labelText: 'Hobby',
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Espaçamento interno do botão
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0), // Borda arredondada do botão
                        ),
                      ),

                      onPressed: () {
                        if(_controllerName.value.text.trim() != '' &&
                            _controllerAge.value.text.trim() != '' &&
                            _controllerHobby.value.text.trim() != ''
                        ){
                          friendsListViewModel.setNewFriend(
                              friend: FriendModel(
                                  name: _controllerName.value.text,
                                  age: int.parse(_controllerAge.value.text),
                                  hobby: _controllerHobby.value.text.trim()
                              )
                          );
                          _controllerName.text = '';
                          _controllerAge.text = '';
                          _controllerHobby.text = '';
                        }

                      },
                      child: const Text('Salvar'),
                    ),
                  )
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
