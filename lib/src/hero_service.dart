import 'package:angular/angular.dart';
import 'dart:async';

import 'hero.dart';
import 'mock_heroes.dart';

class HeroService {
  Future<List<Hero>> getAll() async => mockHeroes;

  //below shows the future behavior if pulling data from slow server.
  Future<List<Hero>> getAllSlowly() {
    return Future.delayed(Duration(seconds: 2), getAll);
  }
}