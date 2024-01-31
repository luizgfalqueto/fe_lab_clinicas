import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/src/loader/lab_clinicas_loader.dart';
import 'package:fe_lab_clinicas_core/src/theme/lab_clinicas_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  const LabClinicasCoreConfig({
    super.key,
    this.binding,
    this.pages,
    this.pagesBuilders,
    this.module,
    required this.title,
  });

  final ApplicationBindings? binding;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pagesBuilders;
  final List<FlutterGetItModule>? module;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      debugMode: true,
      bindings: binding,
      pages: [...pages ?? [], ...pagesBuilders ?? []],
      modules: module,
      builder: (context, routes, flutterGetItNavObserver) {
        return AsyncStateBuilder(
          loader: LabClinicasLoader(),
          builder: (navigatorObserver) {
            return MaterialApp(
              theme: LabClinicasTheme.lighTheme,
              darkTheme: LabClinicasTheme.darkTheme,
              navigatorObservers: [
                flutterGetItNavObserver,
              ],
              routes: routes,
              title: title,
            );
          },
        );
        //
      },
    );
  }
}
