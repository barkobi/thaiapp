import 'package:flutter/material.dart';

class JobPageTitle extends StatelessWidget {
  const JobPageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: deviceHeight * 0.2,
          title: Stack(children: []),
        )
      ],
    );
  }
}
