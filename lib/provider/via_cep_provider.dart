import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/model/viacep_model.dart';
import 'package:riverpod_example/provider/providers.dart';

part 'via_cep_provider.g.dart';

@riverpod
class ViaCep extends _$ViaCep {

  @override
  FutureOr<ViaCepModel?> build() {
    return null;
  }

  Future<void> search(String cep) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () => ref.watch(viaCepRepositoryProvider).getAddress(cep),
    );
  }
}