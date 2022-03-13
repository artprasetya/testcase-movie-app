import 'package:flutter/material.dart';
import 'package:majootestcase/models/movie.dart';

class HomeLoadedView extends StatelessWidget {
  final List<Result>? data;
  final VoidCallback onTapLogout;
  final Function(BuildContext, Result) onTap;

  const HomeLoadedView({
    Key? key,
    required this.data,
    required this.onTap,
    required this.onTapLogout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: onTapLogout,
          ),
        ],
      ),
      body: data != null
          ? ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return movieItemWidget(context, data![index]);
              },
            )
          : Container(),
    );
  }

  Widget movieItemWidget(BuildContext context, Result data) {
    return Material(
      child: InkWell(
        onTap: () => onTap(context, data),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(
                  "https://image.tmdb.org/t/p/w500/" + data.posterPath!,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 8),
                Text(
                  data.title != null ? data.title! : data.originalName!,
                  textDirection: TextDirection.ltr,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
