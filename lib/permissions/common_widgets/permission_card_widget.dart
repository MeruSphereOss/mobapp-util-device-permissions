import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

SizedBox width5Space = const SizedBox(width: 10 / 2);
SizedBox widthSpace = const SizedBox(width: 10);

IconData permissionStatusIcon(PermissionStatus permissionStatus) {
  if (permissionStatus.isGranted) {
    return Icons.done;
  } else {
    return Icons.close;
  }
}

Color permissionStatusColor(PermissionStatus permissionStatus) {
  if (permissionStatus.isGranted) {
    return const Color(0xFF3EB290);
  } else {
    return const Color(0xFFFF5887);
  }
}

Widget permissionCardWithImage({
  required String permissionName,
  IconData? permissionIcon,
  IconData? permissionStatusIcon,
  String? permissionStatus,
  String? imagePath,
  Color? color,
  Color? permissionNameColor,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8 * 1),
          margin: const EdgeInsets.symmetric(
            vertical: 6 * 0.4,
            horizontal: 6 * 1,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 6,
              )
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(
                    0xfff0f0f0), // You can change the background color as needed
                radius: 20, // Adjust the radius based on your preference
                child: Icon(
                  permissionIcon,
                  size: 24,
                  color:
                      Colors.black, // You can change the icon color as needed
                ),
              ),
              widthSpace,
              width5Space,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      permissionName,
                      style: TextStyle(
                          color: permissionNameColor ?? Color(0xff16558F),
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    Text(
                      "$permissionStatus",
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                child: Icon(
                  permissionStatusIcon,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 14,
        ),
      ],
    ),
  );
}
