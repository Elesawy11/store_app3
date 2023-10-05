import 'package:flutter/material.dart';
import 'package:store_app3/models/product_model.dart';
import 'package:store_app3/widgets/custom_button.dart';
import 'package:store_app3/widgets/custom_text_filed.dart';
import 'package:store_app3/widgets/product_form.dart';

class UpdateView extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final ProductModel productModel;

  UpdateView({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            ProductForm(productModel: productModel),
            const SizedBox(
              height: 60,
            ),
            CustomTextField(
              controller: controller,
              hintText: 'title',
            ),
            const SizedBox(
              height: 30,
            ),
            // CustomTextField(
            //   controller: controller,
            //   hintText: 'price',

            // ),
            const SizedBox(
              height: 60,
            ),
            CustomButton(
              text: 'Submitted',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
