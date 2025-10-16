import 'package:flutter/material.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/core/constants/image_constants.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF8B0000),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                ImageConstants.ambili,
                height: 45,
                width: 45,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kannethaa Dooram",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Ranjin Raj, Vijay Yesudas",
                    style: TextStyle(color: Color(0xFFD3D3D3), fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(Icons.devices, color: Colors.white, size: 22),
            const SizedBox(width: 15),
            Icon(Icons.play_arrow_rounded, color: Colors.white, size: 30),
          ],
        ),
      ),
    );
  }
}
