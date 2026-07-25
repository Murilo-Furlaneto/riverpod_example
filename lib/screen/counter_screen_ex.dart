import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/provider/counter_ex_provider.dart';

class CounterScreenEx extends ConsumerWidget {

   CounterScreenEx({ super.key });

  final TextEditingController _controller = TextEditingController();

   @override
   Widget build(BuildContext context, WidgetRef ref) {
    final counterEx = ref.watch(counterExProvider);

       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
             
               children: [
                 TextField(
                  controller: _controller,
                 decoration: InputDecoration(
                  hintText: 'Digite um número',
                 ),
                   
                 ),
                 SizedBox(height: 30,),
                 Text("Resultado: $counterEx"),
               ],
             ),
           ),

           floatingActionButton: FloatingActionButton(onPressed: (){
            ref.read(counterExProvider.notifier).sum(double.parse(_controller.text));
           },
           child: Icon(Icons.add),),
       );
  }
}