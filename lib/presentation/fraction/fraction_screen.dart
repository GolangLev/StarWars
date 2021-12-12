import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/fraction_bloc/list_fraction_bloc/fraction_cubit.dart';
import 'package:star_wars_front/presentation/components/container.dart';
import 'package:star_wars_front/presentation/components/top_bar.dart';

import 'list_fraction/list_fraction_items.dart';

class FractionScreenPage extends StatelessWidget {
  const FractionScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FractionCubit, FractionState>(builder: (context, state) {
      if (state is FractionStateNothing) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        );
      } else if (state is FractionStateLoaded) {
        return Scaffold(
          body: Column(
            children: [
              const TopBar(
                title: 'Фракции',
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: ContentContainer(
                  child: ListFractionItems(
                    fraction: state.fraction.fraction,
                  ),
                ),
              )),
            ],
          ),
        );
      } else {
        return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ));
      }
    });
  }
}
