import 'package:flutter/material.dart';
import 'package:thaiapp/data/data.dart';

class JobDescription extends StatelessWidget {
  const JobDescription({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: RadialGradient(
            colors: [Colors.white, Colors.grey],
            center: Alignment.center,
            radius: deviceWidth * 0.4),
      ),
      width: deviceWidth * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Job Description",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 18,
                height: 1.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
