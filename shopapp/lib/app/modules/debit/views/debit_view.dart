import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/debit_controller.dart';

class DebitView extends GetView<DebitController> {
  const DebitView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DebitView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DebitView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
