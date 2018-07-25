import 'package:angular/angular.dart';
import 'dart:async';
import 'package:angular_router/angular_router.dart';
//components
import 'hero.dart';

import 'route_paths.dart' as paths;

//services
import 'hero_service.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list_component.css'],
  directives: [coreDirectives,],
  providers: [ClassProvider(HeroService)],
  pipes: [commonPipes],
)
class HeroListComponent implements OnInit {
  //define vars ( _means private)
  final title = 'Tour of Heroes';
  List<Hero> heroes;
  Hero selected;
  //define methods?
  final HeroService _heroService;
  final Router _router;

  //call constructor to setup service
  HeroListComponent(this._heroService, this._router);

  //select method
  void onSelect(Hero hero) => selected = hero;
  void ngOnInit() => _getHeroes();
  String _heroUrl(int id) =>
      paths.hero.toUrl(parameters: {paths.idParam: id.toString()});
  // get Heroes to List
  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }
  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_heroUrl(selected.id));

  //Save hero input and create hero by calling service
  Future<void> add(String name) async {
    name = name.trim();
    if (name.isEmpty) return null;
    heroes.add(await _heroService.create(name));
    selected = null;
  }
  //delete Hero
  Future<void> delete(Hero hero) async {
    await _heroService.delete(hero.id);
    heroes.remove(hero);
    if (selected == hero) selected = null;
  }


}
