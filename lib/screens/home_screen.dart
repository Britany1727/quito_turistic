import 'package:flutter/material.dart';
import '../models/lugar.dart';
import '../widgets/lugares_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  static const List<Lugar> _allLugares = [
    Lugar(
      image: 'images/san_francisco.jpg',
      name: 'Iglesia San Francisco',
      location: 'Centro de Quito, Ecuador',
      telefono: '+593022289124',
      mapsUrl: 'https://maps.google.com/?q=Iglesia+San+Francisco+Quito',
      description:
          'Iglesia de San Francisco es una iglesia católica ubicada en el centro '
          'histórico de Quito. Es uno de los conjuntos arquitectónicos más importantes '
          'de la ciudad y un símbolo de su rica historia colonial.',
    ),
    Lugar(
      image: 'images/mitad-del-mundo.jpg',
      name: 'Mitad del Mundo',
      location: 'San Antonio de Pichincha, Ecuador',
      telefono: '+593022394806',
      mapsUrl: 'https://maps.google.com/?q=Ciudad+Mitad+del+Mundo+Quito',
      description:
          'La Ciudad Mitad del Mundo es un complejo turístico ubicado a 26 km al norte '
          'de Quito. Marca el lugar por donde pasa la línea equinoccial, '
          "latitud 0°0'0\", que divide al planeta en dos hemisferios.",
    ),
    Lugar(
      image: 'images/teleferico.jpg',
      name: 'Teleférico de Quito',
      location: 'Volcán Pichincha, Ecuador',
      telefono: '+593022350021',
      mapsUrl: 'https://maps.google.com/?q=Teleferico+Quito',
      description:
          'El Teleférico de Quito es uno de los más altos del mundo, '
          'llegando hasta los 4,050 metros de altitud en las faldas del volcán '
          'Pichincha. Ofrece una vista panorámica espectacular de la ciudad.',
    ),
    Lugar(
      image: 'images/la_carolina.jpg',
      name: 'Parque La Carolina',
      location: 'Norte de Quito, Ecuador',
      telefono: '+593022250865',
      mapsUrl: 'https://maps.google.com/?q=Parque+La+Carolina+Quito',
      description:
          'El Parque La Carolina es el parque urbano más grande de Quito con '
          '64 hectáreas. Cuenta con canchas deportivas, ciclovías, jardín botánico '
          'y el Vivarium, siendo un pulmón verde en el corazón de la ciudad.',
    ),
    Lugar(
      image: 'images/Basilica_del_Voto_Nacional.jpg',
      name: 'Basílica del Voto Nacional',
      location: 'Centro Histórico, Quito',
      telefono: '+593022285745',
      mapsUrl: 'https://maps.google.com/?q=Basilica+del+Voto+Nacional+Quito',
      description:
          'La Basílica del Voto Nacional es la iglesia neogótica más grande '
          'de América Latina. Su construcción inició en 1892 y aún continúa. '
          'Desde sus torres se puede contemplar todo el centro histórico de Quito.',
    ),
    Lugar(
      image: 'images/panecillo.jpg',
      name: 'El Panecillo',
      location: 'Centro de Quito, Ecuador',
      telefono: '+593022280960',
      mapsUrl: 'https://maps.google.com/?q=El+Panecillo+Quito',
      description:
          'El Panecillo es una colina de 200 metros de altura en el corazón '
          'de Quito coronada por una enorme estatua de la Virgen de Quito. '
          'Ofrece la mejor vista panorámica de la ciudad y sus alrededores.',
    ),
    Lugar(
      image: 'images/Capilla_del_hombre.jpg',
      name: 'Capilla del Hombre',
      location: 'Bellavista, Quito, Ecuador',
      telefono: '+593022446455',
      mapsUrl: 'https://maps.google.com/?q=Capilla+del+Hombre+Quito',
      description:
          'La Capilla del Hombre es un museo de arte contemporáneo diseñado '
          'por el maestro Oswaldo Guayasamín. Alberga su obra más importante '
          'y es un homenaje a la historia y el sufrimiento del pueblo latinoamericano.',
    ),
    Lugar(
      image: 'images/El_ejido.jpg',
      name: 'Parque El Ejido',
      location: 'Centro-Norte de Quito, Ecuador',
      telefono: '+593022570786',
      mapsUrl: 'https://maps.google.com/?q=Parque+El+Ejido+Quito',
      description:
          'El Parque El Ejido es un parque tradicional de Quito conocido por '
          'sus exposiciones de arte al aire libre los fines de semana, '
          'donde artistas locales venden pinturas y artesanías.',
    ),
    Lugar(
      image: 'images/LaRonda.jpg',
      name: 'La Ronda',
      location: 'Centro Histórico, Quito, Ecuador',
      telefono: '+593022951026',
      mapsUrl: 'https://maps.google.com/?q=La+Ronda+Quito',
      description:
          'La Ronda es una calle empedrada del centro histórico de Quito, '
          'llena de talleres artesanales, galerías de arte, bares y restaurantes '
          'tradicionales. Es el lugar ideal para disfrutar de la noche quiteña.',
    ),
    Lugar(
      image: 'images/Museo_Nacional.JPG',
      name: 'Museo Nacional del Ecuador',
      location: 'Centro Cultural Itchimbía, Quito',
      telefono: '+593022223258',
      mapsUrl: 'https://maps.google.com/?q=Museo+Nacional+Ecuador+Quito',
      description:
          'El Museo Nacional del Ecuador alberga una extensa colección de '
          'arte y objetos arqueológicos que recorren la historia del Ecuador '
          'desde la época precolombina hasta la actualidad.',
    ),
  ];

  List<Lugar> get _filteredLugares {
    if (_searchQuery.isEmpty) return _allLugares;
    final query = _searchQuery.toLowerCase();
    return _allLugares.where((l) =>
      l.name.toLowerCase().contains(query) ||
      l.location.toLowerCase().contains(query),
    ).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final filtered = _filteredLugares;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quito Turístico',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 9, 56, 95), Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                hintText: 'Buscar lugares turísticos...',
                prefixIcon: Icon(Icons.search_rounded, color: Colors.grey[500]),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Row(
              children: [
                Text(
                  '${filtered.length} lugar${filtered.length != 1 ? 'es' : ''} encontrado${filtered.length != 1 ? 's' : ''}',
                  style: TextStyle(fontSize: 13, color: Colors.grey[500], fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                if (_searchQuery.isNotEmpty)
                  TextButton(
                    onPressed: () {
                      _searchController.clear();
                      setState(() => _searchQuery = '');
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(0, 0), tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    child: Text('Limpiar', style: TextStyle(fontSize: 13, color: colorScheme.primary)),
                  ),
              ],
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search_off_rounded, size: 64, color: Colors.grey[300]),
                        const SizedBox(height: 16),
                        Text('No se encontraron lugares', style: TextStyle(fontSize: 16, color: Colors.grey[500])),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) => LugaresCard(lugar: filtered[index]),
                  ),
          ),
        ],
      ),
    );
  }
}
