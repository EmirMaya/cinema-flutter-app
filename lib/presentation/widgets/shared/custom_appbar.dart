import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
        child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
             child: SizedBox(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Row(
                        children: [
                          Icon(Icons.movie_outlined, color: colors.primary),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Cinemapedia',
                            style: titleStyle,
                          ),
                        ],
                 ),
          ),

          const Spacer(), // para distribuir espacio

          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.search)),
        ],
      )),
    ));
  }
}
