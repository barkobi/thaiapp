import 'package:flutter/material.dart';

class ThaiDrawer extends StatefulWidget {
  const ThaiDrawer({super.key});

  @override
  State<ThaiDrawer> createState() => _ThaiDrawerState();
}

class _ThaiDrawerState extends State<ThaiDrawer> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isHover = true),
      onExit: (event) => setState(() => isHover = false),
      child: AnimatedContainer(
        curve: Curves.easeIn,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        duration: const Duration(milliseconds: 200),
        color: isHover
            ? const Color.fromRGBO(51, 51, 51, 1)
            : const Color.fromRGBO(51, 51, 51, 0.5),
        width: MediaQuery.of(context).size.width * (isHover ? 0.2 : 0.05),
        height: double.infinity,
        child: const Column(
          children: [
            FittedBox(
              fit: BoxFit.cover,
              child: Text(
                "Chats",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
