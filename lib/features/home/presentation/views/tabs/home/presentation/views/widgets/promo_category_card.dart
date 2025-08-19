import 'package:flutter/material.dart';
import 'package:talabat/core/utils/assets_manager.dart';

class PromoCategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  const PromoCategoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
  onTap: onTap,
  child: ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Assets.assetsImagesBackColorContainer,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Image.asset(image ,)),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    ),
  ),
);

  }
}
