import 'package:animation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              create: (context) => ConnectivityCubit()..checkConnectivity())
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
          ),
        ));
  }
}//