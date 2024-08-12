import 'package:flutter/material.dart';
import 'package:flutter_study/ui/component/store_item.dart';
import 'package:flutter_study/ui/main_view_model.dart';
import 'package:provider/provider.dart';

import '../data/model/mask_store.dart';

class MainScreen extends StatelessWidget {
  // view model 받기
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고 있는 곳: ${viewModel.stores.length}'),
      ),
      body: ListView(
              children:
              viewModel.stores.map((store) => StoreItem(store:store)).toList(),
            ),
    );
  }
}
