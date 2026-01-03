// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TaskProvider)
const taskProviderProvider = TaskProviderProvider._();

final class TaskProviderProvider
    extends $NotifierProvider<TaskProvider, List<Task>> {
  const TaskProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskProviderHash();

  @$internal
  @override
  TaskProvider create() => TaskProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Task> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Task>>(value),
    );
  }
}

String _$taskProviderHash() => r'192402e942114536ae72b657dc6baa62cd6d8002';

abstract class _$TaskProvider extends $Notifier<List<Task>> {
  List<Task> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Task>, List<Task>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Task>, List<Task>>,
              List<Task>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
