import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_ex_provider.g.dart';

@riverpod
class CounterEx extends _$CounterEx{
  @override
  double build() {
    return 0.0;
    }

  void sum(double value){
    state +=  value;
  }

}