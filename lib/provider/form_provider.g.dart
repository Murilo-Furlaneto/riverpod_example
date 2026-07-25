// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FormController)
const formControllerProvider = FormControllerProvider._();

final class FormControllerProvider
    extends $NotifierProvider<FormController, bool> {
  const FormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'formControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$formControllerHash();

  @$internal
  @override
  FormController create() => FormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$formControllerHash() => r'12f0f4b9631d06ed1299803b8bbbda7a631e18a9';

abstract class _$FormController extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
