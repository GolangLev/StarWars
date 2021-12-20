import 'package:flutter/material.dart';
import 'package:star_wars_front/presentation/action/widgets/action_body.dart';
import 'package:star_wars_front/presentation/components/container.dart';
import 'package:star_wars_front/presentation/components/top_bar.dart';

class ActionRecords extends StatelessWidget {
  const ActionRecords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          TopBar(
            title: 'Действия',
          ),
          Expanded(
            child: ContentContainer(
              child: ActionBody(),
            ),
          ),
        ],
      ),
    );
  }
}
