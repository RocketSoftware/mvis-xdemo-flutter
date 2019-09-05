/*
This class defines a collection of Movie objects. 
*/

import 'Movie.dart';

class Collection {
  Collection.fromJSON(Map<String, dynamic> json) {
    var prodList = json['Products'];

    for (var i = 0; i < prodList.length; i++) {
      var newMovie = new Movie(
          prodList[i]['id'],
          prodList[i]['title'],
          prodList[i]['desc'],
          prodList[i]['rating'],
          prodList[i]['genre'],
          prodList[i]['producers'],
          prodList[i]['studio'],
          prodList[i]['theaterdate']);

      this.movies.add(newMovie);
    }
  }

  /*
  Returns underlying data structure. This is a security risk, however since the Colletion is wrapped in a future class
  in the application, this becomes necessary to expose data set.
  */
  List<Movie> getMovies() {
    return this.movies;
  }

  /*
  Returns list of movies that have been tagged as saved.
  */
  List<Movie> getSavedMovies() {
    List<Movie> temp = new List<Movie>();
    for (var i = 0; i < movies.length; i++) {
      if (movies[i].savedForLater) {
        temp.add(movies[i]);
      }
    }
    return temp;
  }

  /*
  Returns a set of all studios found in the collection in the form of a list.
  */
  List<String> getStudioFilters() {
    List<String> studios = new List<String>();
    movies.forEach((el) {
      if (el.studio != "") {
        studios.add(el.studio);
      }
    });
    return studios.toSet().toList();
  }

  /*
  Returns a set of all release years found in the collection in the form of a list.
  */
  List<String> getYearFilters() {
    List<String> years = new List<String>();
    List<int> temp = new List<int>();
    movies.forEach((el) {
      if (el.releaseYear != "") {
        temp.add(int.parse(el.releaseYear.substring(el.releaseYear.length-4,el.releaseYear.length)));
      }
    });
    temp.sort();
    temp.forEach((f) {
      years.add(f.toString());
    });
    return years.toSet().toList();
  }

  // ----------------Fields-----------------

  List<Movie> movies = new List();
}
// © 2019 Rocket Software, Inc. or its affiliates. All Rights Reserved
