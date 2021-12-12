import 'package:flutter/material.dart';

import 'detail_main_action/main_action_info.dart';
import 'detail_main_action/tabs_main_action.dart';

class MainActionScreenPage extends StatelessWidget {
  const MainActionScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 1200,
          height: 700,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: const [
              Expanded(
                flex: 2,
                child: MainActionInfo(),
              ),
              SizedBox(width: 15),
              Expanded(
                flex: 1,
                child: MainActionScreenPageBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
