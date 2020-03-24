import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:museu_vivo/app/modules/shared/models/item.dart';
import 'package:museu_vivo/app/modules/shared/repositories/user_repository.dart';
import 'package:museu_vivo/app/modules/shared/services/item_service.dart';


import 'package:rxdart/rxdart.dart';

class ItemRepository extends BlocBase {
  final ItemService _itemService;
  final UserRepository userRepository;

  BehaviorSubject<List<Item>> _itemController = BehaviorSubject<List<Item>>();

  Observable<List<Item>> get itens => _itemController.stream;

  ItemRepository(this._itemService, this.userRepository);

  fetchItens() {
    userRepository.user.listen((user) async {
      final Response itensReponse = await _itemService.fetchItens(user.id);

      _itemController.sink.add(List<Item>.from(
        itensReponse.data.map((item) => Item.fromJson(item)),
      ));
    });
  }

  fetchPurchasedItens() {
    userRepository.user.listen((user) async {
      final Response itensReponse = await _itemService.fetchPurchasedItens(user.id);

      _itemController.sink.add(List<Item>.from(
        itensReponse.data.map((item) => Item.fromJson(item)),
      ));
    });
  }

    @override
  void dispose() {
    _itemController.close();
    super.dispose();
  }
}