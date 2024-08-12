
import '../model/mask_store.dart';

abstract interface class StoreRepository {
  Future<List<MaskStore>> getStores();
}