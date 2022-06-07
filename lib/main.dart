import 'package:flutter/material.dart';
import 'package:flutter_mvvm/MainViewModel.dart';
import 'package:flutter_mvvm/SampleData.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainViewModel _viewModel = MainViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Flutter MVVM"),
        ),
        body: ChangeNotifierProvider(
          create: (_) => _viewModel,
          child: Consumer<MainViewModel>(
            builder: (context, MainViewModel viewModel, child){
              SampleData model = viewModel.value;
              return _bodyChild(model);
            },
          ),
        ));
  }
  
  Widget _messageBody(SampleData model) {
    return IndexedStack(
      alignment: Alignment.center,
      index: model.index,
      children: <Widget>[
        const CircularProgressIndicator(),
        Text(
          model.message ?? "Not Value",
          style: const TextStyle(fontSize: 36),
        ),
      ],
    );
  }

  Widget _bodyChild(SampleData model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _messageBody(model),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Center(
              child: ElevatedButton(
                onPressed: _viewModel.getData,
                child: const Text("Click"),
              )),
        )
      ],
    );
  }
}
