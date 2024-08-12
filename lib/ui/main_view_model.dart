import 'package:flutter/cupertino.dart';
import 'package:flutter_study/data/model/mask_store.dart';
import 'package:flutter_study/data/repository/location_repository.dart';
import 'package:flutter_study/data/repository/store_repository.dart';

class MainViewModel with ChangeNotifier {
  final StoreRepository _storeRepository;
  final LocationRepository _locationRepository;

  MainViewModel({
    required StoreRepository storeRepository,
    required LocationRepository locationRepository,
  })  : _storeRepository = storeRepository,
        _locationRepository = locationRepository {
    fetchStores();
  }


  //status

  List<MaskStore> _stores =[];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // List 는 아래와 같이 외부조작 불가능하게 만듦
  List<MaskStore> get stores => List.unmodifiable(_stores);

  void fetchStores() async {
    _isLoading = true;
    notifyListeners();

    //상점정보 가져오기
    final stores =  await _storeRepository.getStores();
    final location = await _locationRepository.getLocation();
    
    for(var store in stores) {
      store.distance = _locationRepository.distanceBetween(store.latitude, store.longitude, location.latitude, location.longitude);
    }

    stores.sort((a,b) => a.distance.compareTo(b.distance));
    _stores = stores;
    _isLoading = false;
    notifyListeners();
  }
}