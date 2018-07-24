import 'package:angular/angular.dart';
import 'dart:async';

import 'hero.dart';
import 'mock_heroes.dart';

class HeroService {
  Future<List<Hero>> getAll() async => mockHeroes;


  Future<Hero> get(int id) async =>
      (await getAll()).firstWhere((hero) => hero.id == id);


  //below shows the future behavior if pulling data from slow server.
  Future<List<Hero>> getAllSlowly() {
    return Future.delayed(Duration(seconds: 2), getAll);
  }

}