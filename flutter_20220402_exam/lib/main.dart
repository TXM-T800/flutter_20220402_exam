import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodayTabContent extends StatelessWidget {
  const TodayTabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Today',
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ),
        ),
        const SizedBox(height: 16),
        const TodayCard(
          title: 'App of the Day',
          subtitle: 'Unlock new features!',
          buttonText: 'Get',
          imageUrl:
              'https://s3.eu-west-1.amazonaws.com/cdn.motorbikemag.es/wp-content/uploads/2020/09/BMW-M-1000-RR-2021-6.jpg',
        ),
        const TodayCard(
          title: 'Featured App',
          subtitle: 'Discover something new',
          buttonText: 'Download',
          imageUrl: 'https://co.pinterest.com/pin/791155859565816349/',
        ),
      ],
    );
  }
}

// no hice mucho como ve apenasentregare lo que tenia avanzando dentro del trabajo,ya se que no vale solo kiero demostrar mi esfuerzo
class TodayCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final String imageUrl;

  const TodayCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => TodayDetailsScreen(
                title: title,
                imageUrl: imageUrl,
              ),
            ),
          );
        },
        child: Hero(
          tag: title,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(title),
                  subtitle: Text(subtitle),
                ),
                CupertinoButton.filled(
                  onPressed: () {},
                  child: Text(buttonText),
                ),
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TodayDetailsScreen extends StatelessWidget {
  final String title;
  final String imageUrl;

  const TodayDetailsScreen({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: Center(
        child: Hero(
          tag: title,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
