import 'package:flutter/foundation.dart';

import '../base_sub_module.dart';

///CRUCIAL IMPORTANCE THIS CLASS MUST BE INITIALIZED ONLY ONCE
///if you need any object use [DProvider] which has access to this [_subModules]
abstract class BaseDependencyModule {
  final List<ISubModule> _subModules = [];

  BaseDependencyModule() {
    _subModules.addAll(createSubmodules());
    _subModules.forEach((subModule) => subModule.init(_subModules));
  }

  /// override this method to initialize your sub_modules
  /// do not call this method from outside the subclass
  @protected
  List<ISubModule> createSubmodules();
}
