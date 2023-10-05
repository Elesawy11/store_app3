import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app3/models/product_model.dart';
import 'package:store_app3/widgets/product_form.dart';
import '../cubits/create_cubit/create_cubit.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller0 = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  // final TextEditingController _controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Data Example'),
      ),
      body: BlocBuilder<CreateCubit, CreateState>(
        builder: (context, state) {
          if (state is CreateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CreateFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          } else if (state is CreateSuccess) {
            return BuildFutureBuilder(
              productModel: state.productModel,
            );
          }
          return buildColumn();
        },
      ),
    );
  }

  Container buildColumn() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _controller0,
            decoration: const InputDecoration(hintText: 'Enter Title'),
          ),
          const SizedBox(
            height: 24,
          ),TextField(
            controller: _controller1,
            decoration: const InputDecoration(hintText: 'Enter Price'),
          ),
          const SizedBox(
            height: 24,
          ),TextField(
            controller: _controller2,
            decoration: const InputDecoration(hintText: 'Enter Category'),
          ),
          const SizedBox(
            height: 24,
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<CreateCubit>(context)
                  .creatProduct(title: _controller0.text,price: _controller1.text,category: _controller2.text);
            },
            child: const Text('Create Data'),
          ),
        ],
      ),
    );
  }
}

class BuildFutureBuilder extends StatelessWidget {
  const BuildFutureBuilder({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return ProductForm(productModel: productModel);
  }
}


