import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      home: const MovieHomePage(),
    );
  }
}

class MovieHomePage extends StatelessWidget {
  const MovieHomePage({super.key});

  final List<String> nowPlaying = const [
    'https://image.tmdb.org/t/p/w500/pvRyjaBh2mDCuAod7Wn07mTrZps.jpg',
    'https://image.tmdb.org/t/p/w500/7RyHsO4yDXtBv1zUU3mTpHeQ0d5.jpg',
    'https://image.tmdb.org/t/p/w500/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg'
  ];

  final List<String> trending = const [
    'https://image.tmdb.org/t/p/w500/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg',
    'https://image.tmdb.org/t/p/w500/d4KNaTrltq6bpkFS01pYtyXa09m.jpg',
    'https://image.tmdb.org/t/p/w500/w2PMyoyLU22YvrGK3smVM9fW1jj.jpg'
  ];

  final List<String> popular = const [
    'https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg',
    'https://image.tmdb.org/t/p/w500/2CAL2433ZeIihfX1Hb2139CX0pW.jpg',
    'https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg'
  ];

  final List<String> topRated = const [
    'https://image.tmdb.org/t/p/w500/5KCVkau1HEl7ZzfPsKAPM0sMiKc.jpg',
    'https://image.tmdb.org/t/p/w500/hA5oCgvgCxj5MEWcLpjXXTwEANF.jpg',
    'https://image.tmdb.org/t/p/w500/2TeJfUZMGolfDdW6DKhfIWqvq8y.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danz Movie'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NOW PLAYING
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Now Playing',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: nowPlaying.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url, fit: BoxFit.cover, width: 1000),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            buildMovieSection('Trending', trending),
            buildMovieSection('Popular', popular),
            buildMovieSection('Top Rated', topRated),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.redAccent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget buildMovieSection(String title, List<String> images) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const Text('More', style: TextStyle(color: Colors.redAccent)),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(images[index], fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
