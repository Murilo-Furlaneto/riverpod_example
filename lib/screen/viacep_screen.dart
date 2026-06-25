import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/provider/via_cep_provider.dart';

class ViacepScreen extends ConsumerWidget {
  const ViacepScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(viaCepProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'CEP',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (cep) {
                if (cep.trim().isNotEmpty) {
                  ref
                      .read(viaCepProvider.notifier)
                      .search(cep.trim());
                }
              },
            ),

            const SizedBox(height: 24),

            Expanded(
              child: state.when(
                data: (address) {
                  if (address == null) {
                    return const Center(
                      child: Text(
                        'Digite um CEP para consultar',
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CEP: ${address.zipCode}'),
                        Text('Logradouro: ${address.street}'),
                        Text('Complemento: ${address.complement}'),
                        Text('Bairro: ${address.neighborhood}'),
                        Text('Cidade: ${address.city}'),
                        Text('Estado: ${address.state}'),
                        Text('IBGE: ${address.ibgeCode}'),
                        Text('GIA: ${address.giaCode}'),
                        Text('DDD: ${address.areaCode}'),
                        Text('SIAFI: ${address.siafiCode}'),
                      ],
                    ),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stackTrace) => Center(
                  child: Text('Erro: $error'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}