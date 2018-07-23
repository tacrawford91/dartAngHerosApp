import 'package:angular/angular.dart';
import 'dart:async';

//components
import 'hero.dart';
import 'mock_heroes.dart';
import 'hero_component.dart';

//services
import 'hero_service.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list_component.css'],
  directives: [coreDirectives, HeroComponent],
  providers: [ClassProvider(HeroService)],
)
class HeroListComponent implements OnInit {
  final title = 'Tour of Heroes';
  List<Hero> heroes;
  Hero selected;
  final HeroService _heroService;
  HeroListComponent(this._heroService);

  void onSelect(Hero hero) => selected = hero;

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }

  void ngOnInit() => _getHeroes();
}
