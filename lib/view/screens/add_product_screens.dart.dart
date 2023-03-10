import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../provider/add/add_product_provider.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AddProductProvider(),
        builder: (context, child) {
          if (context.watch<AddProductProvider>().isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                leading:const Icon(Icons.menu),
                title: const Text("Mahsulot Add Page"),
              ),
              body: Column(
              children: [
                const Text("Mahsulotingizni qo'shing"),
                TextFormField(
                  controller:
                      context.watch<AddProductProvider>().productNameController,
                  decoration: const InputDecoration(hintText: "Mahsulot nomi"),
                ),
                TextFormField(
                  controller:
                      context.watch<AddProductProvider>().productDescController,
                  decoration:
                      const InputDecoration(hintText: "Mahsulot haqida"),
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<AddProductProvider>().writeData();
                    },
                    child: const Text("Mahsulotni yuklash"))
              ],
            )
,
            );
          }
        });
  }
}
