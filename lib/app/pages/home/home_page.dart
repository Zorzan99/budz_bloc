import 'package:budz_bloc/app/core/ui/helpers/size_extensions.dart';
import 'package:budz_bloc/app/core/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Container(),
          Button(
            label: 'Teste',
            onPressed: () {},
          ),
          TextFormField(),
          Row(
            children: [
              Container(
                width: context.percentWidth(.5),
                height: 200,
                color: Colors.black,
              ),
              Container(
                width: context.percentWidth(.5),
                height: 200,
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
