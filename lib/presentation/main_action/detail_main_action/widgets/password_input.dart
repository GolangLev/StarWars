import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/decoration_bloc/decoration_bloc_cubit.dart';

class FormPasswordInput extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool isChecked;

  const FormPasswordInput(
      {Key? key,
      required this.label,
      this.controller,
      required this.isChecked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DecorationCubit, DecorationState>(
      builder: (context, state) {
        return TextField(
          controller: controller,
          style: _styleDropDownFormField(context),
          obscureText: !state.isVisibility,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            focusColor: Colors.blue,
            contentPadding:
                const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelText: label,
            labelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Color(0xFFDFE3E7),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Color(0xFFDFE3E7),
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                context.read<DecorationCubit>().togglePasswordVisibility();
              },
              icon: !state.isVisibility
                  ? const Icon(
                      Icons.visibility_outlined,
                      color: Color(0xFFA7ADB4),
                    )
                  : const Icon(
                      Icons.visibility_off_outlined,
                      color: Color(0xFFA7ADB4),
                    ),
            ),
          ),
        );
      },
    );
  }

  _styleDropDownFormField(BuildContext context) {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 16,
    );
  }
}
