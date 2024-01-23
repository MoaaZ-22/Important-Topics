import 'package:animation/generated/l10n.dart';
import 'package:animation/modules/bloc_package/blocs/auth_bloc/auth_bloc.dart';
import 'package:animation/modules/bloc_package/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBlocView extends StatelessWidget {
  const AuthBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state.isLoading) {
        LoadingScreen.instance().show(
          context: context,
        );
      } else {
        LoadingScreen.instance().hide();
      }
    }, builder: (context, state) {
      if (state is AuthStateLoggedOut) {
        return const LoginBlocView();
      } else if (state is AuthStateLoggedIn) {
        return const LogOutBlocView();
      }
      return const SizedBox();
    });
  }
}

class LoginBlocView extends StatelessWidget {
  const LoginBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).loginToEnter),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthEventLogin());
              },
              child: Center(
                child: Text(S.of(context).login),
              ),
            ),
          ],
        ));
  }
}

class LogOutBlocView extends StatelessWidget {
  const LogOutBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).youAreLoggedIn),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEventLogout());
              },
              child: Center(
                child: Text(S.of(context).logOut),
              ),
            ),
          ],
        ));
  }
}
