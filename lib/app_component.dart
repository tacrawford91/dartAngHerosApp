import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';


import 'src/routes.dart';
import 'src/hero_service.dart';
//import 'src/hero_list_component.dart';

@Component(
  selector: 'my-app',
  template: '''
    <h1>{{title}}</h1>
    <nav>
      <a [routerLink]="routes.heroes.toUrl()"
        routerLinkActive="active">Heroes</a>
    </nav>
    <router-outlet [routes]="routes.all"></router-outlet>
  ''',
  directives: [routerDirectives],
  providers: [
      ClassProvider(HeroService),
      ClassProvider(Routes)
  ],
)
class AppComponent {
  final Routes routes;
  final title = 'Tour of Heroes';

  AppComponent(this.routes);
}