import 'package:flutter/material.dart';
import 'package:godkillerapp/lab02_start.dart';
import 'package:godkillerapp/features/menu/presentation/widgets/harga.dart';

class Card2 extends StatelessWidget {
  final MenuItem item;
  final int qty;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const Card2({
    super.key,
    required this.item,
    required this.qty,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if (item.promo) const SizedBox(width: 6),
                      if (item.promo)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .tertiaryContainer,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'PROMO',
                            style: TextStyle(
                              fontSize: 10,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Harga(price: item.price),
                ],
              ),
            ),
            IconButton(
              onPressed: qty == 0 ? null : onDecrement,
              icon: const Icon(Icons.remove_circle_outline),
            ),
            SizedBox(
              width: 28,
              child: Text(
                '$qty',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              onPressed: qty >= 99 ? null : onIncrement,
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ),
    );
  }
}