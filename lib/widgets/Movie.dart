
/*
This class defines a model for a Movie. This class is constructed by the Collection class.
*/


class Movie {
  String prodID;
  String title;
  String desc;
  String rating;
  String genre;
  String producers;
  String studio;
  String releaseYear;
  bool savedForLater = false;

  Movie(String prodID,String title,String desc,String rating,String genre, String producers,String studio,String releaseYear) {
    this.prodID = prodID;
    this.title= title;
    this.desc= desc;
    this.rating= rating;
    this.genre= genre;
    this.producers= producers;
    this.studio=  studio;
    this.releaseYear= releaseYear;
  }

  //setter
  void saveForLater() {
    savedForLater = true;
  }

  //getter
  bool isSavedForLater() {
    return this.savedForLater;
  }
  //getter
  String getTitle() {
    return this.title;
  }




}// © 2019 Rocket Software, Inc. or its affiliates. All Rights Reserved
