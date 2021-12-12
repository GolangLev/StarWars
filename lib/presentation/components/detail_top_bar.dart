import 'package:flutter/material.dart';

class DetailTopBar extends StatelessWidget {
  final String title;
  const DetailTopBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(0),
            ),
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal),
          ),
        ],
      ),
    );
  }
}
