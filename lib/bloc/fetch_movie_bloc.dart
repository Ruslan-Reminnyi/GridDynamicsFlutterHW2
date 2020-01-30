import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_movi_demo/data/movie.dart';
import 'package:flutter_movi_demo/networking/repository.dart';
import 'package:rxdart/subjects.dart';
import 'base_bloc.dart';

class MovieBloc extends Bloc {
  final _repo = Repo.instance;
  int page = 1;

  final _movieListStream = BehaviorSubject<List<Movie>>();

  MovieBloc() {
    _movieListStream.add([]);
  }

  Stream<List<Movie>> get movieStream => _movieListStream.stream;

  void fetchMovie() async {
    var resp = await _repo.fetchMovie(page++);
    _movieListStream.value.addAll(resp.movies);
    _movieListStream.sink.add(resp.movies);
  }

  @override
  void dispose() {
    _movieListStream.close();
  }
}