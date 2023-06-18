import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_icons.dart';

class EyeSuffixIcon extends StatelessWidget {
  const EyeSuffixIcon({
    Key? key,
    required this.showPassword,
    required this.setShowPassword,
  }) : super(key: key);

  final bool showPassword;
  final void Function() setShowPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: TextButton(
        onPressed: setShowPassword,
        child: SvgPicture.asset(
          showPassword ? AppIcons.showEye : AppIcons.hideEye,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
