import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? VerAulaWidget() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? VerAulaWidget() : LoginWidget(),
        ),
        FFRoute(
          name: 'Biblia',
          path: '/biblia',
          builder: (context, params) => BibliaWidget(
            getBooksShortName: params.getParam(
              'getBooksShortName',
              ParamType.String,
            ),
            getChaptersNumbers: params.getParam(
              'getChaptersNumbers',
              ParamType.String,
            ),
            getVersesNumbers: params.getParam(
              'getVersesNumbers',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Version',
          path: '/version',
          builder: (context, params) => VersionWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'Perfil',
          path: '/perfil',
          builder: (context, params) => PerfilWidget(
            userProfile: params.getParam(
              'userProfile',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'Editar_Nome',
          path: '/editarNome',
          builder: (context, params) => EditarNomeWidget(),
        ),
        FFRoute(
          name: 'Editar_Capa',
          path: '/editarCapa',
          builder: (context, params) => EditarCapaWidget(),
        ),
        FFRoute(
          name: 'Editar_Foto',
          path: '/editarFoto',
          builder: (context, params) => EditarFotoWidget(),
        ),
        FFRoute(
          name: 'Ver_Aula',
          path: '/verAula',
          builder: (context, params) => VerAulaWidget(),
        ),
        FFRoute(
          name: 'Ver_Teologia',
          path: '/verTeologia',
          builder: (context, params) => VerTeologiaWidget(
            verTeologia: params.getParam(
              'verTeologia',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Teologia'],
            ),
          ),
        ),
        FFRoute(
          name: 'Filmes',
          path: '/filmes',
          builder: (context, params) => FilmesWidget(
            userProfile: params.getParam(
              'userProfile',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'Assistir1',
          path: '/assistir1',
          builder: (context, params) => Assistir1Widget(
            filme: params.getParam(
              'filme',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Lista-Filmes1'],
            ),
          ),
        ),
        FFRoute(
          name: 'Assistir2',
          path: '/assistir2',
          builder: (context, params) => Assistir2Widget(
            filme2: params.getParam(
              'filme2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Lista-Filmes2'],
            ),
          ),
        ),
        FFRoute(
          name: 'Assistir3',
          path: '/assistir3',
          builder: (context, params) => Assistir3Widget(
            filme3: params.getParam(
              'filme3',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Lista-Filmes3'],
            ),
          ),
        ),
        FFRoute(
          name: 'Assistir4',
          path: '/assistir4',
          builder: (context, params) => Assistir4Widget(
            filme4: params.getParam(
              'filme4',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Lista-Filmes4'],
            ),
          ),
        ),
        FFRoute(
          name: 'Musica',
          path: '/musica',
          builder: (context, params) => MusicaWidget(
            userProfile: params.getParam(
              'userProfile',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'Criar_Estudo',
          path: '/criarEstudo',
          builder: (context, params) => CriarEstudoWidget(),
        ),
        FFRoute(
          name: 'Editar_Estudoo',
          path: '/editarEstudoo',
          builder: (context, params) => EditarEstudooWidget(
            editarESTUDO: params.getParam(
              'editarESTUDO',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Teologia'],
            ),
          ),
        ),
        FFRoute(
          name: 'EdicaoAudio',
          path: '/edicaoAudio',
          builder: (context, params) => EdicaoAudioWidget(
            audio: params.getParam(
              'audio',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Teologia'],
            ),
          ),
        ),
        FFRoute(
          name: 'EdicaoVideo',
          path: '/edicaoVideo',
          builder: (context, params) => EdicaoVideoWidget(
            video: params.getParam(
              'video',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Teologia'],
            ),
          ),
        ),
        FFRoute(
          name: 'EdicaoApostila',
          path: '/edicaoApostila',
          builder: (context, params) => EdicaoApostilaWidget(
            apostila: params.getParam(
              'apostila',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Teologia'],
            ),
          ),
        ),
        FFRoute(
          name: 'Criar_Login',
          path: '/criarLogin',
          builder: (context, params) => CriarLoginWidget(),
        ),
        FFRoute(
          name: 'Splash',
          path: '/splash',
          builder: (context, params) => SplashWidget(),
        ),
        FFRoute(
          name: 'Editar_CapaAulas',
          path: '/editarCapaAulas',
          builder: (context, params) => EditarCapaAulasWidget(
            editar: params.getParam(
              'editar',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Teologia'],
            ),
          ),
        ),
        FFRoute(
          name: 'Anotacao',
          path: '/anotacao',
          builder: (context, params) => AnotacaoWidget(),
        ),
        FFRoute(
          name: 'Ver_Aula2',
          path: '/verAula2',
          builder: (context, params) => VerAula2Widget(),
        ),
        FFRoute(
          name: 'Criar_Estudo2',
          path: '/criarEstudo2',
          builder: (context, params) => CriarEstudo2Widget(),
        ),
        FFRoute(
          name: 'Ver_Bacharel',
          path: '/verBacharel',
          builder: (context, params) => VerBacharelWidget(
            verBacharel: params.getParam(
              'verBacharel',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Bacharel'],
            ),
          ),
        ),
        FFRoute(
          name: 'Editar_Estudo2',
          path: '/editarEstudo2',
          builder: (context, params) => EditarEstudo2Widget(
            editarESTUDO2: params.getParam(
              'editarESTUDO2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Bacharel'],
            ),
          ),
        ),
        FFRoute(
          name: 'EdicaoAudio2',
          path: '/edicaoAudio2',
          builder: (context, params) => EdicaoAudio2Widget(
            audio2: params.getParam(
              'audio2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Bacharel'],
            ),
          ),
        ),
        FFRoute(
          name: 'EdicaoApostila2',
          path: '/edicaoApostila2',
          builder: (context, params) => EdicaoApostila2Widget(
            apostila2: params.getParam(
              'apostila2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Bacharel'],
            ),
          ),
        ),
        FFRoute(
          name: 'Editar_CapaAulas2',
          path: '/editarCapaAulas2',
          builder: (context, params) => EditarCapaAulas2Widget(
            editar2: params.getParam(
              'editar2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Bacharel'],
            ),
          ),
        ),
        FFRoute(
          name: 'Certificado',
          path: '/certificado',
          builder: (context, params) => CertificadoWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Green_Colorful_Animated_Characters_Lyrics_Tiktok_Video_(3).gif',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
