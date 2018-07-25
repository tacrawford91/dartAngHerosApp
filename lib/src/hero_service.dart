import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'hero.dart';



class HeroService {
  static const _heroesUrl = 'api/heroes'; // URL to web API
  final Client _http;
  static final _headers = {'Content-Type': 'application/json'};

  HeroService(this._http);

  //get all heroes
  Future<List<Hero>> getAll() async  {
    try {
      //make call to api
      final response = await _http.get(_heroesUrl);
      //once recieved, extract data
      final heroes = (_extractData(response) as List)
            .map((json) => Hero.fromJson(json))
            .toList();
      return heroes;
    } catch (e) {
      throw _handleError(e);
    }
  }

  //get single hero
  Future<Hero> get(int id) async {
    try {
      final response = await _http.get('$_heroesUrl/$id');
      return Hero.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  //update Hero
  Future<Hero> update(Hero hero) async {
    try {
      final url = '$_heroesUrl/${hero.id}';
      final response = await _http.put(url, headers: _headers, body: json.encode(hero));
      return Hero.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  //create new Hero
  Future<Hero> create(String name) async {
    try {
      final response = await _http.post(_heroesUrl,
          headers: _headers, body: json.encode({'name': name}));
      return Hero.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  //delete hero method //
  Future<void> delete(int id) async {
    try {
      final url = '$_heroesUrl/$id';
      await _http.delete(url, headers: _headers);
    } catch (e) {
      throw _handleError(e);
    }
  }

  //data extractor helper function
  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

  //handle error function
  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }

}