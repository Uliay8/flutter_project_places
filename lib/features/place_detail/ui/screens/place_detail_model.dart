import 'package:flutter/foundation.dart';

class PlaceDetailModel implements IPlaceDetailModel {
  final _state = ValueNotifier<String>('Loading');

  @override
  void dispose() {
    _state.dispose();
  }

  @override
  Future<void> loadDetail() async {
    _state.value = 'Loaded';
  }

  @override
  ValueListenable<String> get stateListenable => _state;
}

abstract class IPlaceDetailModel {
  ValueListenable<String> get stateListenable;
  void dispose();
  Future<void> loadDetail();
}
