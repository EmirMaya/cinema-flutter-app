import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:flutter/material.dart';

class MoviesHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MoviesHorizontalListview(
      {super.key,
      required this.movies,
      this.title,
      this.subtitle,
      this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (title != null || subtitle != null)
            _Title(
              title: title,
              subtitle: subtitle,
            ),
          Expanded(
            child: ListView.builder(
                itemCount: movies.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return _Slide(movie: movies[index]);
                }),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {

    final textStyle = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              movie.posterPath,
              width: 150,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  );
                }
                return FadeIn(child: child);
              },
            ),
          ),
        ),

        const SizedBox(height: 5,),

        //* Title
        SizedBox(
          width: 150,
          child: Text(
            movie.title,
            maxLines: 2,
            style: textStyle.titleSmall,
          ),
        ),

        //* Raiting  
        SizedBox(
          width: 150,
          child: Row(
            children: [
              Icon(Icons.star_half_outlined, color: Colors.yellow.shade700,),
              const SizedBox(width: 3,),
              Text('${movie.voteAverage}', style: textStyle.bodyMedium?.copyWith(color: Colors.yellow.shade900),),
              const Spacer(),
              Text(HumanFormats.number(movie.popularity), style: textStyle.bodySmall?.copyWith(color: Colors.grey.shade800)),
   
            ],
          ),
        )
      ]),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Title({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStyle,
            ),
          const Spacer(),
          if (subtitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subtitle!),
            )
        ],
      ),
    );
  }
}
