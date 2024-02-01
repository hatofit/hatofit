part of 'navigation_cubit.dart';

@unfreezed
class NavigationState with _$NavigationState {
  factory NavigationState({
    bool? isBleOn,
    List<DiscoveredDevice>? devices,
  }) = _NavigationState;
}
