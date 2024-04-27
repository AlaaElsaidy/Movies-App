import 'package:flutter/material.dart';
import 'package:movies/features/Home/data/models/movieDetailsModel.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var details=ModalRoute.of(context)!.settings.arguments as MovieDetailsModel;
    print(details);
    return Scaffold(
          appBar: AppBar(
            title: Text(details?.originalTitle?? "", style: Theme
                .of(context)
                .textTheme
                .bodyLarge,),
          ),
        );

  }
}
