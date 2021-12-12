import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/fraction_bloc/detail_fraction_bloc/detail_fraction_cubit.dart';
import 'package:star_wars_front/domain/models/fractions.dart';
import 'package:star_wars_front/presentation/components/detail_top_bar.dart';

import 'widgets/detail_fraction_body.dart';

class DetailFraction extends StatelessWidget {
  final Fraction fraction;

  const DetailFraction({Key? key, required this.fraction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailFractionCubit, DetailFractionState>(
      builder: (context, state) {
        if (state is DetailStateNothing) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DetailStateLoaded) {
          return Scaffold(
            body: Column(
              children: [
                DetailTopBar(
                    title: state.responseFraction.fraction.displayTitle),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: DetailFractionBody(
                        fraction: state.responseFraction.fraction),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
      },
    );
  }
}
