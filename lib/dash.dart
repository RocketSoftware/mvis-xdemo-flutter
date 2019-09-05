import 'dart:core';
import 'dart:core' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xdemo_mobile_example/helper.dart';
import 'package:xdemo_mobile_example/widgets/FilterTile.dart';
import 'package:xdemo_mobile_example/widgets/Search.dart';
import 'package:xdemo_mobile_example/widgets/filterBarTile.dart';

import 'dart:async';
import 'widgets/Movie.dart';
import 'widgets/Collection.dart';
import 'Info.dart';
import 'widgets/filterBarTile.dart';
import 'futures/futures.dart';
import 'widgets/Search.dart';

/*
This is the main page of the application. This screen renders the data coming from MVIS, the filter options and filter bar, and the search
bar. This acts as the main function and controller for the application and is the location for all callback functions used in other
widgets.
*/
class DashBoardLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'MVoovies',
    //   home: Table(),
    // );
    return new WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MaterialApp(
        title: 'MVoovies',
        home: Table(),
      ),
    );
  }
}
/*
This is a statefulwidget. Stateful widgets are dynamic in nature and can be rebuilt on command.
Initial constructor. Defines model for stateful widget, in this case the actual table of Movie data.
*/
class Table extends StatefulWidget {

  @override
  TableState createState() => TableState();
}
//Constructor for actual stateful Table widget
class TableState extends State<Table> {
  bool tableDisplayAll = true;
  Future<Collection> movies = fetchCollection();
  List<Movie> allMovies;
  List<Movie> saveMovies;
  List<Movie> superSaveMovies = new List();
  bool firstLoadStatus = true;
  bool init = true;
  double filterBarHeight = 70;

  ////Options for filter
  List<String> ratings = ["G", "PG", "PG13", "R", "NR"];
  List<String> genres = [
    'Romantic Comedy',
    'Action',
    'Thriller',
    "Horror",
    'Comedy',
    'Drama',
    'Sci-Fi',
    'Music Video',
    'Martial Arts',
    'Animation',
    'Fantasy'
  ];
  List<String> studios;
  List<String> years;

  List<String> myFilters = <String>[];
  List<FilterTile> genreFilters = <FilterTile>[];
  List<FilterTile> ratingFilters = <FilterTile>[];
  List<FilterTile> studioFilters = <FilterTile>[];
  List<FilterTile> yearFilters = <FilterTile>[];

  TextEditingController controller = TextEditingController();
  List<FilterTile> currentFilters = new List<FilterTile>();
  List<String> currentFilterStr = new List<String>();
  String searchFilter;

  //Sets variables and states on initial render
  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        searchFilter = controller.text.toLowerCase();
        print("state reload");
      });
    });
  }

  //Managing state and data when widget is being disposed of and rebuilt
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Search search = new Search();

  TableState() {
    fillFilters(this.genres, "genre", this.genreFilters);
    fillFilters(this.ratings, "rating", this.ratingFilters);
  }

  //Callback function for updating active filters and rendering these filters on the filter bar.
  _updateMyFilters(String filter) {
    Helper.updateCurrentFilters(filter);
    myFilters = Helper.createCurrentFilterList();
    currentFilterStr = []..addAll(myFilters);
    setState(() {
      if (myFilters.isEmpty) {
        movies = fetchCollection();
        Helper.nullifyAll();
      } else {
        movies = fetchFilteredCollection(Helper.createFilterQuery());
      }
    });
  }

  //Callback function for updating table rows by fetching filtered data from MVIS
  _updateTableState(String qry) {
    currentFilterStr.add(qry);
    print("current Filter Str");
    print("**---------------------");
    currentFilterStr.forEach((f) {
      print(f);
    });
    print("**---------------------\n");

    Helper.updateFilters(currentFilterStr);
    // print(Helper.createFilterQuery());
    myFilters = Helper.createCurrentFilterList();

    print("myFilters add");
    print("****---------------------");
    myFilters.forEach((f) {
      print(f);
    });
    print("****---------------------");

    setState(() {
      movies = fetchFilteredCollection(Helper.createFilterQuery());
      Navigator.pop(context);
    });
  }

  /*
  Populates filter options in the filter drop down menu.
  */
  void fillFilters(
      List<String> options, String type, List<FilterTile> filterList) {
    options.forEach((f) {
      filterList.add(new FilterTile(
          filter: f,
          uniKey: UniqueKey(),
          type: type,
          qryFilter: "$type = '$f'",
          parentAction: _updateTableState));
    });
  }

  /*
  Function that implements logic for the search bar
  */
  void filterSearchResults(String query) {
    List<Movie> dummySearchList = List<Movie>();
    dummySearchList.addAll(this.allMovies);
    if (query.isNotEmpty) {
      List<Movie> dummyListData = List<Movie>();
      dummySearchList.forEach((item) {
        if (item.title.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        this.allMovies.clear();
        this.allMovies.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {});
    }
  }

  //Renders look,content, and feel of the data table.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //This section renders the appbar on the top of the screen
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        title: Text("MVoovies"),
      ),
      //This section builds and renders the data table with movie data
      body: Column(
        children: <Widget>[
          tableDisplayAll
              ? new Search(filter: searchFilter, controller: controller)
              : new Container(),
          tableDisplayAll
              ? Container(
                  height: myFilters.isEmpty ? 0 : filterBarHeight,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: myFilters.isEmpty
                      ? Container()
                      : Container(
                          height: 200.0,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: myFilters.length,
                            itemBuilder: (context, index) {
                              return new FilterBarTile(
                                filter: myFilters[index],
                                parentAction: _updateMyFilters,
                                index: index,
                              );
                            },
                          ),
                        ),
                )
              : new Container(),
          Expanded(
            // height: 60,
            child: Center(
                child: tableDisplayAll
                    ? FutureBuilder<Collection>(
                        future: this.movies,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            this.allMovies = snapshot.data.getMovies();
                            this.saveMovies = snapshot.data.getSavedMovies();
                            if (init) {
                              fillFilters(snapshot.data.getStudioFilters(),
                                  "studio", this.studioFilters);
                              fillFilters(snapshot.data.getYearFilters(),
                                  "theaterdate", this.yearFilters);
                              init = false;
                            }

                            for (var i = 0; i < saveMovies.length; i++) {
                              if (!this
                                  .superSaveMovies
                                  .contains(this.saveMovies[i])) {
                                this.superSaveMovies.add(this.saveMovies[i]);
                              }
                            }

                            return ListView.builder(
                              itemCount: snapshot.data.movies.length,
                              itemBuilder: (context, index) {
                                return searchFilter == null ||
                                        searchFilter == ""
                                    ? Card(
                                        child: ListTile(
                                        title: Text(
                                          snapshot.data.movies[index].title
                                              .toString(),
                                          textAlign: TextAlign.left,
                                        ),
                                        trailing: snapshot.data.movies[index]
                                                .rating.isNotEmpty
                                            ? Text(
                                                snapshot
                                                    .data.movies[index].rating
                                                    .toString(),
                                                textAlign: TextAlign.right)
                                            : Text(
                                                "NR",
                                                textAlign: TextAlign.right,
                                              ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    InfoScreen(snapshot
                                                        .data.movies[index])),
                                          );
                                        },
                                      ))
                                    : snapshot.data.movies[index]
                                            .getTitle()
                                            .toLowerCase()
                                            .contains(searchFilter)
                                        ? new Card(
                                            child: ListTile(
                                            title: Text(
                                              snapshot.data.movies[index].title
                                                  .toString(),
                                              textAlign: TextAlign.left,
                                            ),
                                            trailing: snapshot
                                                    .data
                                                    .movies[index]
                                                    .rating
                                                    .isNotEmpty
                                                ? Text(
                                                    snapshot.data.movies[index]
                                                        .rating
                                                        .toString(),
                                                    textAlign: TextAlign.right)
                                                : Text(
                                                    "NR",
                                                    textAlign: TextAlign.right,
                                                  ),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        InfoScreen(snapshot.data
                                                            .movies[index])),
                                              );
                                            },
                                          ))
                                        : new Container();
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                height: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.mood_bad,
                                    ),
                                    Text(
                                      "Sorry, we couldn't find any movies that fit your criteria!",
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          return CircularProgressIndicator();
                        })
                    : this.superSaveMovies.isEmpty
                        ? Text(
                            "No Movies Saved Yet",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : ListView.builder(
                            itemCount: this.superSaveMovies.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: GestureDetector(
                                  onDoubleTap: () {
                                    superSaveMovies[index].saveForLater();
                                    final snackBar = SnackBar(
                                        content: Text("Saved for Later"));
                                    Scaffold.of(context).showSnackBar(snackBar);
                                    print("double tapped");
                                  },
                                  child: ListTile(
                                    title: Text(superSaveMovies[index].title),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => InfoScreen(
                                                superSaveMovies[index])),
                                      );
                                    },
                                  ),
                                ),
                              );
                            })),
          ),
        ],
      ),
      //This section renders the swipable side menu including all filters and filter options
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100,
              child: DrawerHeader(
                child: Text(
                  "Filters",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Montserrat',
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            ExpansionTile(
              title: Text("Rating"),
              children: this.ratingFilters,
            ),
            ExpansionTile(
              title: Text("Genre"),
              children: this.genreFilters,
            ),
            ExpansionTile(
              title: Text("Studio"),
              children: this.studioFilters,
            ),
            // ExpansionTile(
            //   title: Text("Release Year"),
            //   children: this.yearFilters,
            // ),
          ],
        ),
      ),
      //This section renders the bottom navigation bar
      bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  color: tableDisplayAll ? Colors.lightBlue : Colors.blue,
                  width: 100,
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      tableDisplayAll = true;
                      setState(() {});
                    },
                    color: tableDisplayAll ? Colors.amber[600] : Colors.black,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  color: tableDisplayAll ? Colors.blue : Colors.lightBlue,
                  width: 100,
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.star),
                    onPressed: () {
                      tableDisplayAll = false;

                      setState(() {});
                      print("star got pressed");
                    },
                    color: tableDisplayAll ? Colors.black : Colors.amber[600],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
// © 2019 Rocket Software, Inc. or its affiliates. All Rights Reserved
