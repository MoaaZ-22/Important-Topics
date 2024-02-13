import 'package:animation/modules/bloc_package/blocs/search_bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWithBlocConcurrencyView extends StatelessWidget {
  const SearchWithBlocConcurrencyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: Scaffold(
        body: ListView(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 16),
          children: [
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return TextField(
                  controller: context.read<SearchBloc>().searchController,
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    suffixIcon: Icon(Icons.search),
                  ),
                );
              },
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: CircularProgressIndicator(
                      color: Colors.blueAccent,
                    ),
                  ));
                } else if (state is SearchSuccess) {
                  // if it empty
                  if (state.results.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Center(child: Text('No results')),
                    );
                  }
                  return ListView.builder(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      shrinkWrap: true,
                      itemCount: state.results.length,
                      itemBuilder: (context, index) => Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              child: Text(state.results[index]),
                            ),
                          ));
                } else if (state is SearchFailure) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(child: Text('Error: ${state.error}')),
                  );
                }
                return const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(child: Text('Start searching...')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
