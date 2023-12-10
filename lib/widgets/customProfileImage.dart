import 'package:flutter/material.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).cardColor,
        border: Border.all(
            color: Theme.of(context).colorScheme.background, width: 3),
        image: const DecorationImage(
          image: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScbrrOgLfx3xyrV6qAmKyrEimNekZcwCGKiwotVfQ&s"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
