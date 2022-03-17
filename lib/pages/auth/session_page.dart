import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/pages/movies/movies_list_page.dart';
import '../../bloc/session_bloc.dart';
import '../../widgets/build_loading.dart';
import '../../widgets/generate_button.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({Key? key, required this.token}) : super(key: key);
  final String token;
  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  SessionCubit _sessionCubit = SessionCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session Page'),
        backgroundColor: Colors.redAccent,
      ),
      body: BlocProvider<SessionCubit>(
        create: (BuildContext context) => _sessionCubit,
        child: BlocBuilder<SessionCubit, SessionState>(
          builder: (context, state) {
            print('state: ${state.runtimeType}');
            if (state is InitSessionState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child:
                          const GenerateButton(text: 'Generate token Button'),
                      onTap: () {
                        _sessionCubit.getDataEvent(context);
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
