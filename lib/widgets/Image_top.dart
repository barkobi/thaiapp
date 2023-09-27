import 'package:flutter/material.dart';
import 'package:thaiapp/widgets/above_image.dart';

class ImageTopShader extends StatelessWidget {
  const ImageTopShader(
      {super.key,
      required this.jobImage,
      required this.rank,
      required this.jobName});
  final String jobImage;
  final double rank;
  final String jobName;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [Colors.transparent, Colors.black],
              stops: [0.4, 1.0],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              child: Image.asset(
                'assets/restaurant.jpg',
                alignment: Alignment.bottomCenter,
                width: deviceWidth,
                height: deviceHeight * 0.35,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        AboveImageTexts(
          jobImage: jobImage,
          rank: rank,
          jobName: jobName,
        ),
      ],
    );
  }
}
