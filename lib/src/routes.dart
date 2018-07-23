import 'package:angular_router/angular_router.dart';

import 'route_paths.dart' as paths;

import 'hero_list_component.template.dart' as hlct;


class Routes {
  RoutePath get heroes => paths.heroes;

  final List<RouteDefinition> all = [
    RouteDefinition (
      path: paths.heroes.path,
      component: hlct.HeroListComponentNgFactory,
    ),
  ];
}