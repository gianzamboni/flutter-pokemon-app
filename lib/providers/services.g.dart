// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(services)
const servicesProvider = ServicesProvider._();

final class ServicesProvider
    extends $FunctionalProvider<ServiceManager, ServiceManager, ServiceManager>
    with $Provider<ServiceManager> {
  const ServicesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'servicesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$servicesHash();

  @$internal
  @override
  $ProviderElement<ServiceManager> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ServiceManager create(Ref ref) {
    return services(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ServiceManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ServiceManager>(value),
    );
  }
}

String _$servicesHash() => r'fcec3f6bc33c0fd18f7df348dde8bdb8a1e69bf1';
