import 'package:exchange_currency_app/ui/exchange_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExchangeViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('환율 조회'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  if (_controller.text.isNotEmpty) {
                    viewModel.fetchConversionRates(_controller.text);
                  }
                },
                child: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: viewModel.shownList.length,
                itemBuilder: (context, int index) {
                  return Row(
                    children: [
                      Text(
                        viewModel.shownList[index].toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(width: 5),
                      Text(viewModel.valueList[index].toString()),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
