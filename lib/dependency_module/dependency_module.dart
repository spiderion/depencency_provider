import 'package:flutter/foundation.dart';

import '../base_sub_module.dart';

///CRUCIAL IMPORTANCE THIS CLASS MUST BE INITIALIZED ONLY ONCE
///if you need any object use [DProvider] which has access to this [_subModules]
abstract class BaseDependencyModule {
  final List<ISubModule> _subModules = [];

  BaseDependencyModule() {
    _subModules.addAll(getSubModules());
    _subModules.forEach((subModule) => subModule.init(_subModules));
  }

  /// override this method to initialize you sub_modules
  @protected
  List<ISubModule> getSubModules();
}
