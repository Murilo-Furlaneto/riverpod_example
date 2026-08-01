import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/model/item.dart';

part 'shopping_provider.g.dart';

@riverpod
class Shopping extends _$Shopping{
  var  itemList = <Item>[];

  @override
  List<Item> build() {
    return itemList;
  }

  void addProduct(Item item){
    state = [...state, item];
  }

}