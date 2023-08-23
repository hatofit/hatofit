import 'package:flutter/cupertino.dart';

enum TabType { home, workout, history, profile }

extension TabItem on TabType {
  Icon get icon {
    switch (this) {
      case TabType.home:
        return const Icon(CupertinoIcons.home, size: 25);
      case TabType.workout:
        return const Icon(CupertinoIcons.sportscourt, size: 25);
      case TabType.history:
        return const Icon(CupertinoIcons.person, size: 25);
      case TabType.profile:
        return const Icon(CupertinoIcons.profile_circled, size: 25);
    }
  }

  String get title {
    switch (this) {
      case TabType.home:
        return "Home";
      case TabType.workout:
        return "Workout";
      case TabType.history:
        return "History";
      case TabType.profile:
        return "Profile";
    }
  }
}
