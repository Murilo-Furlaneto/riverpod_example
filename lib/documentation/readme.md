### 1. Provider (o mais simples – só lê, não muda)  
É como um **placar fixo no parque** que todo mundo pode olhar, mas ninguém mexe.

```dart
final nomeDoParqueProvider = Provider<String>((ref) => "Parque do Grok");
```

Uso na tela:  
```dart
Text(ref.watch(nomeDoParqueProvider)) // vai aparecer "Parque do Grok"
```
É só para coisas que **nunca mudam** ou que outra pessoa muda por você.

### 2. StateProvider (o botãozinho que muda um número ou texto simples)  
É como um **contador de balões** que as crianças apertam.

```dart
final baloesProvider = StateProvider<int>((ref) => 0);
```

Na tela:  
```dart
// Mostra quantos balões
Text('${ref.watch(baloesProvider)} balões 🎈')

// Botão para adicionar balão
ElevatedButton(
  onPressed: () => ref.read(baloesProvider.notifier).state++,
  child: Text('Inflar mais um balão!')
)
```
Perfeito para contadores, interruptores (true/false), texto simples.

### 3. ChangeNotifierProvider (o brinquedo antigo que ainda funciona)  
É como um **carrinho de sorvete que toca musiquinha** e avisa quando chega.

```dart
class SorveteCarrinho extends ChangeNotifier {
  int sorvetes = 10;

  void vender() {
    sorvetes--;
    notifyListeners(); // avisa todo mundo: "Ei, mudou!"
  }
}

final sorveteProvider = ChangeNotifierProvider((ref) => SorveteCarrinho());
```

Uso:  
```dart
Text('Sorvetes restantes: ${ref.watch(sorveteProvider).sorvetes}')

ElevatedButton(
  onPressed: () => ref.read(sorveteProvider).vender(),
  child: Text('Comprar sorvete!')
)
```
Funciona, mas é o jeito “mais antigo”. Hoje quase ninguém usa mais.

### 4. StateNotifier + StateNotifierProvider (o mais poderoso dos antigos)  
É como um **controle de montanha-russa** com várias coisas: velocidade, pessoas dentro, se está ligado…

```dart
class MontanhaRussa extends StateNotifier<int> {
  MontanhaRussa() : super(0); // começa com 0 pessoas

  void entraPessoa() => state++;
  void saiPessoa() => state--;
}

final montanhaRussaProvider = StateNotifierProvider<MontanhaRussa, int>((ref) => MontanhaRussa());
```

Uso:  
```dart
Text('Pessoas na fila: ${ref.watch(montanhaRussaProvider)}')

ElevatedButton(
  onPressed: () => ref.read(montanhaRussaProvider.notifier).entraPessoa(),
  child: Text('Entrar na fila!')
)
```
Muito bom, mas tem que escrever bastante código.

### 5. Notifier + NotifierProvider (o novo jeito legal – Riverpod 2.0+)  
É quase igual ao de cima, mas mais bonitinho e moderno.

```dart
@riverpod
class Contador extends _$Contador {
  @override
  int build() => 0; // valor inicial

  void increment() => state++;
  void decrement() => state--;
}
```

Uso na tela (fica super limpo):  
```dart
Text('Contador: ${ref.watch(contadorProvider)}')

ElevatedButton(
  onPressed: () => ref.read(contadorProvider.notifier).increment(),
  child: Text('+1')
)
```

### 6. AsyncNotifier + AsyncNotifierProvider (para coisas que demoram: internet, banco de dados)  
É como **esperar o algodão-doce ficar pronto**.

```dart
@riverpod
class AlgodaoDoce extends _$AlgodaoDoce {
  @override
  Future<String> build() async {
    await Future.delayed(Duration(seconds: 2));
    return "Algodão-doce rosa pronto! 🍭";
  }
}
```

Na tela:  
```dart
ref.watch(algodaoDoceProvider).when(
  data: (texto) => Text(texto),
  loading: () => CircularProgressIndicator(),
  error: (e, s) => Text('Deu ruim!'),
)
```

### Resumo para criança (tabela mágica)

| Nome                          | Quando usar?                                | Parece com…                       |
|-------------------------------|--------------------------------------------|---------------------------------|
| Provider                      | Coisa que nunca muda                       | Placar fixo                     |
| StateProvider                 | Contador, interruptor, texto simples      | Botão de +1 de balão             |
| ChangeNotifierProvider        | Código antigo (quase ninguém usa mais)    | Carrinho de sorvete barulhento  |
| StateNotifierProvider         | Controle mais complexo (jeito antigo)     | Montanha-russa com várias regras|
| NotifierProvider (+ @riverpod) | Jeito moderno e bonito de mudar coisas    | Controle mágico novo             |
| AsyncNotifierProvider          | Coisas que vêm da internet ou demoram     | Esperar algodão-doce ficar pronto|

### 7. `.family` (providers com parâmetros)

O `.family` permite criar providers parametrizados. Cada argumento identifica uma instância de estado, por exemplo, os dados de um usuário específico.

#### Com Riverpod Generator

Se você usa `riverpod_annotation` e `build_runner`, não precisa declarar `.family` manualmente. Basta adicionar parâmetros à função ou ao método `build`; o gerador cria a família automaticamente:

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usuario_provider.g.dart';

@riverpod
Future<Usuario> buscarUsuario(Ref ref, int userId) async {
  final repository = ref.watch(usuarioRepositoryProvider);
  return repository.getById(userId);
}
```

#### Sem geração de código

Na sintaxe clássica, adicione `.family` ao tipo do provider e informe o tipo do valor retornado e o tipo do parâmetro:

```dart
final buscarUsuarioProvider =
    FutureProvider.family<Usuario, int>((ref, userId) async {
  final repository = ref.watch(usuarioRepositoryProvider);
  return repository.getById(userId);
});
```

#### Consumindo na UI

Use o provider como uma função e passe o argumento para `ref.watch` ou `ref.read`:

```dart
class PerfilScreen extends ConsumerWidget {
  final int userId;

  const PerfilScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usuarioAsync = ref.watch(buscarUsuarioProvider(userId));

    return usuarioAsync.when(
      data: (usuario) => Text('Olá, ${usuario.nome}'),
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Erro: $err'),
    );
  }
}
```

