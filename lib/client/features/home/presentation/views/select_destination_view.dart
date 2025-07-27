import 'package:flutter/material.dart';
import 'package:go_car/client/features/home/presentation/views/widgets/select_destination_body.dart';

class SelectDestinationView extends StatelessWidget {
  const SelectDestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Address'), centerTitle: true),
      body: const SelectDestinationBody(),
    );
  }
}
