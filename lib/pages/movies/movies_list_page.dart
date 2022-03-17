import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/movies_list_bloc.dart';
import '../../widgets/build_card.dart';
import '../../widgets/build_loading.dart';

class MoviesListPage extends StatefulWidget {
  const MoviesListPage({Key? key}) : super(key: key);

  @override
  State<MoviesListPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  final MoviesListCubit _moviesListCubit = MoviesListCubit();

  late ScrollController _controller;

  @override
  void initState() {
    _moviesListCubit.getDataEvent();
    super.initState();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get some JSON'),
        backgroundColor: Colors.redAccent,
      ),

      /// Here You should convert the response (responseHelper.data) to your model and use that model at the UI
      body: BlocProvider<MoviesListCubit>(
        create: (BuildContext context) => _moviesListCubit,
        child: BlocBuilder<MoviesListCubit, MovieState>(
          builder: (context, state) {
            if (state is WeHaveDataState || state is GettingAnother20) {
              if (_moviesListCubit.responseHelper.hasError) {
                return SizedBox(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                              _moviesListCubit.responseHelper.errorMessage),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {
                              _moviesListCubit.getDataEvent();
                            },
                            child: const Text('Get the Data Again'),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return Column(
                children: [
                  Expanded(
                    child: BuildCard(
                      context: context,
                      model: _moviesListCubit.responseHelper.data,
                      controller: _controller,
                    ),
                  ),
                  if (state is GettingAnother20)
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 40),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              );
            } else if (state is GettingDataState) {
              return const BuildLoading();
            }

            return const Center();
            // return widget here based on BlocA's state
          },
        ),
      ),
    );
  }

  void _loadMore() async {
    if (_moviesListCubit.responseHelper.isLoading == false &&
        _controller.position.extentAfter < 300) {
      _moviesListCubit.getAnother20();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    _controller.dispose();
    super.dispose();
  }
}
