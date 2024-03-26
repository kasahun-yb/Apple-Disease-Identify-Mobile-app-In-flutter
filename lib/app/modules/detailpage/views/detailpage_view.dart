import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailpage_controller.dart';

class DetailpageView extends GetView<DetailpageController> {
  const DetailpageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailpageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailpageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
