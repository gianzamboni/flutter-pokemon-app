import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orientation.g.dart';

@riverpod
class OrientationNotifier extends _$OrientationNotifier {
  @override
  Axis build() {
    return Axis.vertical;
  }

  void toggleOrientation() {
    state = state == Axis.horizontal ? Axis.vertical : Axis.horizontal;
  }
}
