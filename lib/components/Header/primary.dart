import 'package:calendall_pptu/util/custom_colors.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final bool hasReturnIcon;

  const Header({ super.key, this.hasReturnIcon = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.purplePrimary,
      toolbarHeight: 90,
      automaticallyImplyLeading: hasReturnIcon,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
