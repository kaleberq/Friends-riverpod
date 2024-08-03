import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends/domain/models/friend_model.dart';
import 'package:friends/screens/friends_view_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';


enum TutorialIdentifyEnum{

  textFieldName(identify: 'text_field_name'),
  textFieldAge(identify: 'text_field_age'),
  textFieldHobby(identify: 'text_field_hobby'),
  saveButton(identify: 'save_button'),
  cardFirstFriend(identify: 'card_first_friend');

  final String identify;

  const TutorialIdentifyEnum({required this.identify});
}

class FriendsList extends ConsumerStatefulWidget {
  const FriendsList({super.key});

  @override
  _FriendsListState createState() => _FriendsListState();
}

class _FriendsListState extends ConsumerState<FriendsList> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerAge = TextEditingController();
  TextEditingController _controllerHobby = TextEditingController();

  late TutorialCoachMark _tutorialCoachMark;
  GlobalKey textFieldName = GlobalKey();
  GlobalKey textFieldAge = GlobalKey();
  GlobalKey textFieldHobby = GlobalKey();
  GlobalKey saveButton = GlobalKey();
  GlobalKey cardFirstFriend = GlobalKey();

  final FriendModel friendTest = FriendModel(
    name: 'Kalebe Misael Santos e Silva',
    age: 28,
    hobby: 'Aeromodelismo'
  );


  late final friendsListViewModel =
      ref.read(friendsListViewModelProvider.notifier);

  @override
  void initState() {
    _createTutorial();
    Future.delayed(Duration(seconds: 2), showTutorial);
    super.initState();
  }
  void showTutorial() {
    _tutorialCoachMark.show(context: context);
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [
      TargetFocus(
        identify: TutorialIdentifyEnum.textFieldName.identify,
        keyTarget: textFieldName,
        shape: ShapeLightFocus.RRect,
        radius: 4,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Campo de nome",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Aqui você ira inserir o nome do seu amigo",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      TargetFocus(
        identify: TutorialIdentifyEnum.textFieldAge.identify,
        keyTarget: textFieldAge,
        shape: ShapeLightFocus.RRect,
        radius: 4,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Campo de idade",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Aqui você ira inserir a idade de seu amigo",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      TargetFocus(
        identify: TutorialIdentifyEnum.textFieldHobby.identify,
        keyTarget: textFieldHobby,
        shape: ShapeLightFocus.RRect,
        radius: 4,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Campo de hobby",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Aqui você ira inserir a hobby de seu amigo",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      TargetFocus(
        identify: TutorialIdentifyEnum.saveButton.identify,
        keyTarget: saveButton,
        shape: ShapeLightFocus.RRect,
        radius: 4,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Botão de salvar",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Ao clicar aqui você ira adicionar um novo amigo a lista",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      TargetFocus(
        identify: TutorialIdentifyEnum.cardFirstFriend.identify,
        keyTarget: cardFirstFriend,
        shape: ShapeLightFocus.RRect,
        radius: 4,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Aqui está seu novo amigo",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Nesse card você encontrará os dados do seu novo amigo",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ];


    return targets;
  }

  void _createTutorial() {
    _tutorialCoachMark = TutorialCoachMark(
      hideSkip: true,
      pulseEnable: false,
      useSafeArea: true,
      targets: _createTargets(),
      colorShadow: Colors.black,
      opacityShadow: 0.8,
      unFocusAnimationDuration: Duration(seconds: 0),
      showSkipInLastTarget: true,
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) async{
        if(target.identify == TutorialIdentifyEnum.textFieldName.identify){
          _controllerName.text = friendTest.name;
          print('cai aqui');
          await Future.delayed(Duration(seconds: 1));
        }else if(target.identify == TutorialIdentifyEnum.textFieldAge.identify){
          _controllerAge.text = friendTest.age.toString();
          await Future.delayed(Duration(seconds: 1));
        }else if(target.identify == TutorialIdentifyEnum.textFieldHobby.identify){
          _controllerHobby.text = friendTest.hobby;
          await Future.delayed(Duration(seconds: 1));
        }
        else if(target.identify == TutorialIdentifyEnum.saveButton.identify){
          saveFriend();
          await Future.delayed(Duration(seconds: 1));
        }
        else if(target.identify == TutorialIdentifyEnum.cardFirstFriend.identify){
          await Future.delayed(Duration(seconds: 1));
        }
        print('onClickTarget: $target');
      },
    );
  }

  void saveFriend(){
    if(_controllerName.value.text.trim() != '' &&
        _controllerAge.value.text.trim() != '' &&
        _controllerHobby.value.text.trim() != ''
    ){
      friendsListViewModel.setValue(
          value: FriendModel(
              name: _controllerName.value.text,
              age: int.parse(_controllerAge.value.text),
              hobby: _controllerHobby.value.text.trim()
          )
      );
      _controllerName.text = '';
      _controllerAge.text = '';
      _controllerHobby.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text('Friends')
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: Consumer(builder: (BuildContext build, WidgetRef refData, _) {
                    final AsyncValue<List<FriendModel>> friends =
                        ref.watch(friendsListViewModelProvider).friends;
                    return friends.when(data: (listFriends) {
                      return ListView.builder(
                          itemCount: listFriends.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              key: index == 0 ? cardFirstFriend : null,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    title: Text('Nome: ${listFriends[index].name}'),
                                    subtitle: Text('Idade: ${listFriends[index].age.toString()}'),
                                    trailing: Text('Hobby: ${listFriends[index].hobby}'),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      TextButton(
                                        child: const Text('Excluir'),
                                        onPressed: () {
                                          friendsListViewModel.excludeValue(value: listFriends[index]);
                                        },
                                      ),
                                      const SizedBox(width: 8),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                      );
                    }, error: (Object, StackTrace) {
                      return SizedBox.shrink();
                    }, loading: () {
                      return ListView(
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
              Column(
                children: [
                  TextField(
                    key: textFieldName,
                    controller: _controllerName,
                    decoration: InputDecoration(
                      hintText: 'Digite o nome...',
                      labelText: 'Nome',
                    ),
                  ),
                  TextField(
                    key: textFieldAge,
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
                    key: textFieldHobby,
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
                      key: saveButton,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Espaçamento interno do botão
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0), // Borda arredondada do botão
                        ),
                      ),

                      onPressed: () {
                        saveFriend();
                      },
                      child:  Text(
                          'Salvar'
                      ),
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
