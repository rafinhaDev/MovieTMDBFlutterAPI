import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    print(moviesProvider.ondisplayMovie);

    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en Cartelera'),
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(onPressed: () =>  showSearch(context: context, delegate: MovieSearchDelegate()), icon: Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //tarjetas
              CardSwiper(movies: moviesProvider.ondisplayMovie),

              

              Movie_Slider(
                movies: moviesProvider.pupularMovies,
                title: 'Más Populares',
                onNextPage: () => moviesProvider.getPopularMovies(), 
              ),
            ],
          ),
        ));
  }
}
