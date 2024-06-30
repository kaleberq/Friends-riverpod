import 'package:flutter/material.dart';
import 'package:friends/screens/friends_list/friends_list_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return  FriendsList();
      },

    ),
  ],
);