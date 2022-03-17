import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/pages/movies/movies_list_page.dart';
import '../../bloc/login_bloc.dart';
import '../../widgets/build_loading.dart';
import '../../widgets/generate_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginCubit _loginCubit = LoginCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Colors.redAccent,
      ),
      body: BlocProvider<LoginCubit>(
        create: (BuildContext context) => _loginCubit,
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            print('state: ${state.runtimeType}');
            if (state is InitLoginState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child:
                          const GenerateButton(text: 'Generate token Button'),
                      onTap: () {
                        _loginCubit.getDataEvent(context);
                      },
                    ),
                    InkWell(
                      child: const GenerateButton(
                        text: 'Skip and show Movies',
                      ),
                      onTap: () {
                        skippAndShowMovies(context);
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const BuildLoading();
            }

            // return widget here based on BlocA's state
          },
        ),
      ),
    );
  }

  skippAndShowMovies(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MoviesListPage()),
    );
  }
}
