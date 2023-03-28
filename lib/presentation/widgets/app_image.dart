import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppImage extends StatelessWidget {
  final String? url;
  final double borderRound;
  final bool isFullRounded;

  const AppImage({
    super.key,
    required this.url,
    required this.borderRound,
    required this.isFullRounded,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: isFullRounded
          ? BorderRadius.all(Radius.circular(borderRound))
          : BorderRadius.only(
              bottomLeft: Radius.circular(borderRound),
              topLeft: Radius.circular(borderRound),
            ),
      child: CachedNetworkImage(
        imageUrl: url ??
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstock.adobe.com%2Fsearch%2Fimages%3Fk%3Dno%2Bimage%2Bavailable&psig=AOvVaw2obKAQ2UpQYX0TzM_q2qgZ&ust=1680037803773000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCPjpmtWC_f0CFQAAAAAdAAAAABAI',
        errorWidget: (_, __, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
      ),
    );
  }
}
