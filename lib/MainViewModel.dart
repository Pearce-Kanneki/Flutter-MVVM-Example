
import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm/SampleData.dart';

class MainViewModel extends ValueNotifier<SampleData> {
  MainViewModel() : super(SampleData());

  bool _dispose = false;

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }

  @override
  void notifyListeners() {
    if(!_dispose) {
      super.notifyListeners();
    }

  }

  void getData() {
    value.index = 1;
    value.title = "title";
    value.message = "Value: ${value.index}";
    notifyListeners();
  }
}