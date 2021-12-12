import 'package:flutter/material.dart';
import 'package:star_wars_front/presentation/components/item_icon/item_icon_button.dart';

class TopBar extends StatelessWidget {
  final String title;
  const TopBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
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
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
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
          Row(
            children: const [
              IconItemButton(
                icon: Icon(
                  Icons.home_outlined,
                  color: Color(0xFFB219A3),
                ),
                navigationPath: '/home',
              ),
              IconItemButton(
                icon: Icon(
                  Icons.person_outlined,
                  color: Color(0xFf30BDC6),
                ),
                navigationPath: '/profile',
              ),
              IconItemButton(
                icon: Icon(
                  Icons.language_outlined,
                  color: Color(0xFF1e91ea),
                ),
                navigationPath: '/news',
              ),
              IconItemButton(
                icon: Icon(
                  Icons.live_tv_outlined,
                  color: Color(0xFFe65121),
                ),
                navigationPath: '/film',
              ),
              IconItemButton(
                icon: Icon(
                  Icons.sports_esports_outlined,
                  color: Color(0xFF419b5b),
                ),
                navigationPath: '/game',
              ),
              IconItemButton(
                icon: Icon(
                  Icons.admin_panel_settings_outlined,
                  color: Color(0xFF9e59da),
                ),
                navigationPath: '/hero',
              ),
              IconItemButton(
                icon: Icon(
                  Icons.view_in_ar_outlined,
                  color: Color(0xFFdcb030),
                ),
                navigationPath: '/fraction',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
