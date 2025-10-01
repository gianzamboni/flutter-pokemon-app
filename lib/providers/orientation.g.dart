// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orientation.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrientationNotifier)
const orientationProvider = OrientationNotifierProvider._();

final class OrientationNotifierProvider
    extends $NotifierProvider<OrientationNotifier, Axis> {
  const OrientationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orientationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orientationNotifierHash();

  @$internal
  @override
  OrientationNotifier create() => OrientationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Axis value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Axis>(value),
    );
  }
}

String _$orientationNotifierHash() =>
    r'ed291e3fa3826ebd911836c43125831e0a700bd4';

abstract class _$OrientationNotifier extends $Notifier<Axis> {
  Axis build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Axis, Axis>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Axis, Axis>,
              Axis,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
