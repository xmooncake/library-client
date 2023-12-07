import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:library_client/features/authentication/bloc/authentication_bloc.dart';
import 'package:library_client/features/authentication/components/auth_button.dart';
import 'package:library_client/features/core/components/custom_text_field.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: const _AuthenticationView(),
    );
  }
}

class _AuthenticationView extends StatelessWidget {
  const _AuthenticationView();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Welcome to our LIBRARY PRO CLIENT '),
      ),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(child: SvgPicture.asset('assets/login.svg')),
            SizedBox(
              width: size.width * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(120.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // const Padding(
                    //   padding: EdgeInsets.all(8.0),
                    //   child: Text(
                    //     'Login',
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: TextEditingController(),
                      labelText: 'Email address',
                      hintText: 'Enter your e-mail address',
                      icon: const Icon(Icons.email),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: TextEditingController(),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      icon: const Icon(Icons.password),
                    ),
                    const SizedBox(height: 30),
                    BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                        return AuthenticationButton(
                          onPressed: () => context
                              .read<AuthenticationBloc>()
                              .add(AuthenticationOnAuthCheckRequestedEvent()),
                          isLoading: state is AuthenticationLoadingState,
                        );

                        // final isLoading =
                        //     state.status == AuthenticationStatus.loading;

                        // return AuthenticationButton(
                        //   isLoading: isLoading,
                        //   onPressed: () {
                        //     context.read<AuthenticationBloc>().add(
                        //           AuthenticationOnAuthCheckRequestedEvent(),
                        //         );
                        //   },
                        // );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
