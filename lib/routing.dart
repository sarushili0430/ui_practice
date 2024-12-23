import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_practice/admin_mobile.dart';
import 'package:ui_practice/main.dart';
import 'package:ui_practice/signin.dart';

final goRouter = GoRouter(
  // アプリが起動した時
  initialLocation: '/',
  // パスと画面の組み合わせ
  routes: [
    GoRoute(
      path: '/',
      name: 'initial',
      pageBuilder: (context, state) {
        return MaterialPage(
          child: const UiNavigator(),
        );
      },
    ),
    // ex) アカウント画面
    GoRoute(
      path: '/admin-mobile',
      name: 'admin-mobile',
      pageBuilder: (context, state) {
        return MaterialPage(
          child: AdminMobile(),
        );
      },
    ),
    // ex) アカウント詳細画面
    GoRoute(
      path: '/signin',
      name: 'signin',
      pageBuilder: (context, state) {
        return MaterialPage(
          child: SigninSignout(),
        );
      },
    ),
  ],
  // 遷移ページがないなどのエラーが発生した時に、このページに行く
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
);
