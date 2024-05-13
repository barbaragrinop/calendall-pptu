import 'package:frontend/components/LogoText/logo.dart';
import 'package:frontend/util/custom_colors.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final bool hasReturnIcon;

  const Header({super.key, this.hasReturnIcon = true});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: CustomColors.blueMedium,
        automaticallyImplyLeading: hasReturnIcon,
        bottom: PreferredSize(
          preferredSize: Size.copy(preferredSize),
          child: Container(
            margin: const EdgeInsets.only(bottom: 0.0),
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: CustomColors.blueSecondary,
                  width: 9.0,
                ),
              ),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [LogoText(color: LogoTextColor.white02)]
            ),
          ),
        ),
        leading: hasReturnIcon
            ? IconButton(
                icon: const Icon(Icons.arrow_back,
                    color: CustomColors.blueSecondary),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110.0);
}
