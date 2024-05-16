import 'package:flutter/material.dart';

import '../base/common/utils/colors.dart';

class CreateOrder extends StatefulWidget {
  const CreateOrder({super.key});

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(''),
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: InkWell(
              child: Image.asset('assets/ic_back_arrow.png',
                  height: 12, width: 12)),
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
