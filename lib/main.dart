import 'package:flutter/material.dart';
import 'widgets/lugares_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Quito Turístico';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 237, 164, 250)),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Quito Turístico',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,                  // ← centra el título correctamente
          backgroundColor: const Color.fromARGB(255, 231, 179, 253),
        ),
        body: const LugaresList(),
      ),
    );
  }
}

// Modelo simple de datos
class Lugar {
  final String name;
  final String location;
  final String description;
  final String image;

  const Lugar({
    required this.name,
    required this.location,
    required this.description,
    required this.image,
  });
}

class LugaresList extends StatelessWidget {
  const LugaresList({super.key});

  static const List<Lugar> _lugares = [
    Lugar(
      image: 'images/san_francisco.jpg',
      name: 'Iglesia San Francisco',
      location: 'Centro de Quito, Ecuador',
      description:
          'Iglesia de San Francisco es una iglesia católica ubicada en el centro '
          'histórico de Quito. Es uno de los conjuntos arquitectónicos más importantes '
          'de la ciudad y un símbolo de su rica historia colonial.',
    ),
    Lugar(
      image: 'images/mitad-del-mundo.jpg',
      name: 'Mitad del Mundo',
      location: 'San Antonio de Pichincha, Ecuador',
      description:
          'La Ciudad Mitad del Mundo es un complejo turístico ubicado a 26 km al norte '
          'de Quito. Marca el lugar por donde pasa la línea equinoccial, '
          "latitud 0°0'0\", que divide al planeta en dos hemisferios.",
    ),
    Lugar(
      image: 'images/teleferico.jpg',
      name: 'Teleférico de Quito',
      location: 'Volcán Pichincha, Ecuador',
      description:
          'El Teleférico de Quito es uno de los más altos del mundo, '
          'llegando hasta los 4,050 metros de altitud en las faldas del volcán '
          'Pichincha. Ofrece una vista panorámica espectacular de la ciudad.',
    ),
    Lugar(
      image: 'images/la_carolina.jpg',
      name: 'Parque La Carolina',
      location: 'Norte de Quito, Ecuador',
      description:
          'El Parque La Carolina es el parque urbano más grande de Quito con '
          '64 hectáreas. Cuenta con canchas deportivas, ciclovías, jardín botánico '
          'y el Vivarium, siendo un pulmón verde en el corazón de la ciudad.',
    ),
    Lugar(
      image: 'images/Basilica_del_Voto_Nacional.jpg',
      name: 'Basílica del Voto Nacional',
      location: 'Centro Histórico, Quito',
      description:
          'La Basílica del Voto Nacional es la iglesia neogótica más grande '
          'de América Latina. Su construcción inició en 1892 y aún continúa. '
          'Desde sus torres se puede contemplar todo el centro histórico de Quito.',
    ),
    Lugar(
      image: 'images/panecillo.jpg',
      name: 'El Panecillo',
      location: 'Centro de Quito, Ecuador',
      description:
          'El Panecillo es una colina de 200 metros de altura en el corazón '
          'de Quito coronada por una enorme estatua de la Virgen de Quito. '
          'Ofrece la mejor vista panorámica de la ciudad y sus alrededores.',
    ),
    Lugar(
      image: 'images/Capilla_del_hombre.jpg',
      name: 'Capilla del Hombre',
      location: 'Bellavista, Quito, Ecuador',
      description:
          'La Capilla del Hombre es un museo de arte contemporáneo diseñado '
          'por el maestro Oswaldo Guayasamín. Alberga su obra más importante '
          'y es un homenaje a la historia y el sufrimiento del pueblo latinoamericano.',
    ),
    Lugar(
      image: 'images/El_ejido.jpg',
      name: 'Parque El Ejido',
      location: 'Centro-Norte de Quito, Ecuador',
      description:
          'El Parque El Ejido es un parque tradicional de Quito conocido por '
          'sus exposiciones de arte al aire libre los fines de semana, '
          'donde artistas locales venden pinturas y artesanías.',
    ),
    Lugar(
      image: 'images/LaRonda.jpg',
      name: 'La Ronda',
      location: 'Centro Histórico, Quito, Ecuador',
      description:
          'La Ronda es una calle empedrada del centro histórico de Quito, '
          'llena de talleres artesanales, galerías de arte, bares y restaurantes '
          'tradicionales. Es el lugar ideal para disfrutar de la noche quiteña.',
    ),
    Lugar(
      image: 'images/Museo_Nacional.JPG',
      name: 'Museo Nacional del Ecuador',
      location: 'Centro Cultural Itchimbía, Quito',
      description:
          'El Museo Nacional del Ecuador alberga una extensa colección de '
          'arte y objetos arqueológicos que recorren la historia del Ecuador '
          'desde la época precolombina hasta la actualidad.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _lugares.length,
      itemBuilder: (context, index) {
        final lugar = _lugares[index];
        return LugaresCard(
          image: lugar.image,
          name: lugar.name,
          location: lugar.location,
          description: lugar.description,
        );
      },
    );
  }
}