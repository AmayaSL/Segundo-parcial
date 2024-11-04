import 'package:flutter/material.dart';
import 'package:parcial/entity/rickandmorty_entity.dart';
import 'package:parcial/helpers/getRickAndMorty.dart';
import 'package:parcial/presentation/widgets/drawer.dart';

class RickAndMortyScreen extends StatelessWidget {
  static const name = "rickandmorty_screen";
  const RickAndMortyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final petition = GetRickAndMorty();
    return Scaffold(
      appBar: AppBar(
        title: Text("RickAndMorty"),
      ),
      drawer: Menu(),
      body: FutureBuilder(
        future: petition.getPL(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListRickAndMorty(rickandmorty: snapshot.requireData);
        },
      ),
    );
  }
}

class ListRickAndMorty extends StatelessWidget {
  const ListRickAndMorty({
    super.key,
    required this.rickandmorty,
  });

  final List<RickAndMortyEntity> rickandmorty;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rickandmorty.length,
      itemBuilder: (context, index) {
        return Card(
          color: Color.fromARGB(255, 169, 212, 243), // Azul pastel suave
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    rickandmorty[index].nombre.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Text(
                    rickandmorty[index].estado.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Text(
                    rickandmorty[index].especie.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Text(
                    rickandmorty[index].genero.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(rickandmorty[index].img ?? ''),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ));
      },
    );
  }
}
