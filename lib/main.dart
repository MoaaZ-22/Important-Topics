import 'package:animation/generated/l10n.dart';
import 'package:animation/modules/bloc_package/blocs/auth_bloc/auth_bloc.dart';
import 'package:animation/modules/bloc_package/repos/auth_repository.dart';
import 'package:animation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/functions.dart';
import 'helpers/bloc_observer.dart';
import 'helpers/service_locator.dart';
import 'modules/connectivity/cubits/connectivity_cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  runApp(const AdvancedTopicsApp());
}

class AdvancedTopicsApp extends StatelessWidget {
  const AdvancedTopicsApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// To make snackbar on the main root to show it in all screens
    final GlobalKey<ScaffoldMessengerState> mainRootScaffoldMessengerKey =
        GlobalKey<ScaffoldMessengerState>();
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ConnectivityCubit()..checkConnectivity()),
          BlocProvider(create: (context) => AuthBloc(AuthRepository())),
        ],
        child: BlocListener<ConnectivityCubit, ConnectivityState>(
          listener: (context, state) {
            checkConnectionStateFunction(state, mainRootScaffoldMessengerKey);
          },
          child: MaterialApp(
            scaffoldMessengerKey: mainRootScaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.startRoute,
            onGenerateRoute: RouteGenerator.getRoute,
            theme: ThemeData.dark(useMaterial3: true),
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          ),
        ));
  }
}//