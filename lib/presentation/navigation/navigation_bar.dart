import 'package:flutter/material.dart';
import 'package:star_wars_front/presentation/navigation/widgets/navigation_menu_item/navigation_menu_item.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NavigationMenuItem> navigationMenuItem = [
       const NavigationMenuItem(
        icon: Icon(
          Icons.person_outlined,
          color: Colors.redAccent,
        ),
        nameItem: 'Профиль',
         navigationPath: '/profile',
      ),
      const NavigationMenuItem(
        icon: Icon(
          Icons.language_outlined,
          color: Color(0xFF1e91ea),
          size: 30,
        ),
        nameItem: 'Вселенная',
        navigationPath: '/news',
      ),
      const NavigationMenuItem(
        icon: Icon(
          Icons.live_tv_outlined,
          color: Color(0xFFe65121),
          size: 30,
        ),
        nameItem: 'Фильмы',
        navigationPath: '/film',
      ),
      const NavigationMenuItem(
        icon: Icon(
          Icons.sports_esports_outlined,
          color: Color(0xFF419b5b),
          size: 30,
        ),
        nameItem: 'Игры',
        navigationPath: '/game',
      ),
      const NavigationMenuItem(
        icon: Icon(
          Icons.admin_panel_settings_outlined,
          color: Color(0xFF9e59da),
          size: 30,
        ),
        nameItem: 'Персонажи',
        navigationPath: '/hero',
      ),
      const NavigationMenuItem(
        icon: Icon(
          Icons.view_in_ar_outlined,
          color: Color(0xFFdcb030),
          size: 30,
        ),
        nameItem: 'Фракции',
        navigationPath: '/fraction',
      ),
    ];

    return Container(
      padding: const EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
        color: Color(0xFF313131),
        border: Border(right: BorderSide(color: Colors.white)),
      ),
      child: Column(
        children: [
          ...navigationMenuItem
        ],
      ),
    );
  }
}
