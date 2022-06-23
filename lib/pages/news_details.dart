import 'package:bloc_flutter/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsPage extends StatelessWidget {
  final Articles articles;
  NewsDetailsPage(this.articles);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(alignment: AlignmentDirectional.bottomStart, children: [
            ImageView(context),
            RoundedBox(),
            Positioned(bottom: 5, right: 40, child: LinkButton())
          ]),
          Padding(
              padding: EdgeInsets.only(top: 4, right: 15, left: 15, bottom: 15),
              child: Column(
                children: [
                  AuthorAndData(context),
                  Body(context),
                ],
              ))
        ],
      )),
    );
  }

  Widget ImageView(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: NetworkImage(articles.urlToImage!)),
      ),
    );
  }

  Widget RoundedBox() {
    return Container(
      height: 30,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 248, 248, 248),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(20))),
    );
  }

  Widget LinkButton() {
    return RawMaterialButton(
      onPressed: _launchURL,
      elevation: 2.0,
      fillColor: Colors.white,
      child: const Icon(
        Icons.open_in_browser,
        size: 35.0,
        color: Colors.blue,
      ),
      padding: const EdgeInsets.all(10.0),
      shape: const CircleBorder(),
    );
  }

  _launchURL() async {
    final Uri url = Uri.parse(articles.url ?? "");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication))
      throw 'Could not launch $url';
  }

  Widget AuthorAndData(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          articles.author ?? "No author",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          articles.publishedAt ?? "No published date",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }

  Widget Body(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 13),
          child: Text(
            articles.title ?? "No title",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Text(
            articles.content ?? "No description",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    );
  }
}
