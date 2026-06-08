import 'package:flutter/material.dart';

class LugaresCard extends StatefulWidget {
  final String name;
  final String location;
  final String description;
  final String image;

  const LugaresCard({
    super.key,
    required this.description,
    required this.image,
    required this.location,
    required this.name,
  });

  @override
  State<LugaresCard> createState() => _LugaresCardState();
}

class _LugaresCardState extends State<LugaresCard> {
  bool _isFavorited = false;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 252, 219, 230),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Imagen ──────────────────────────────────────────
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              widget.image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 12),

          // ── Nombre + estrella ────────────────────────────────
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  _isFavorited ? Icons.star : Icons.star_border,
                  color: Colors.red[500],
                ),
                onPressed: _toggleFavorite,
              ),
              const SizedBox(width: 4),
              Text('$_favoriteCount'),
            ],
          ),

          const SizedBox(height: 4),

          // ── Ubicación ────────────────────────────────────────
          Text(
            widget.location,
            style: TextStyle(color: Colors.grey[600]),
          ),

          const SizedBox(height: 12),

          // ── Botones ──────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _ActionButton(color: primaryColor, icon: Icons.call,    label: 'CALL'),
              _ActionButton(color: primaryColor, icon: Icons.near_me, label: 'ROUTE'),
              _ActionButton(color: primaryColor, icon: Icons.share,   label: 'SHARE'),
            ],
          ),

          const SizedBox(height: 12),

          // ── Descripción ──────────────────────────────────────
          Text(
            widget.description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

// Widget auxiliar para los botones (reemplaza ButtonWithText)
class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ],
    );
  }
}