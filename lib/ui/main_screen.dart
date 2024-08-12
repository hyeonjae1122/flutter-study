import 'package:flutter/material.dart';
import 'package:flutter_study/ui/component/store_item.dart';
import 'package:flutter_study/ui/main_view_model.dart';

import '../data/model/mask_store.dart';

class MainScreen extends StatelessWidget {
  // view model 받기
  final MainViewModel viewModel;
  const MainScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고 있는 곳: 0곳'),
      ),
      body: ListenableBuilder(
          listenable: viewModel,
          builder: (BuildContext context, Widget? child){
            return ListView(
              children:
              viewModel.stores.map((store) => StoreItem(store:store)).toList(),
            );
          })
    );
  }
}
