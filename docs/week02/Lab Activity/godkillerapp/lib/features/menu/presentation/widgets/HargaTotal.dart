import 'package:flutter/material.dart';
import 'package:godkillerapp/features/menu/presentation/widgets/harga.dart';

class HargaTotal extends StatelessWidget {
  final int lineCount;
  final int total;
  final VoidCallback onSave;

  const HargaTotal({
    super.key,
    required this.lineCount,
    required this.total,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lineCount == 0
                      ? 'Belum ada pesanan'
                      : '$lineCount menu dipilih',
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 4),
                Harga(price: total),
              ],
            ),
          ),
          FilledButton(
            onPressed: total == 0 ? null : onSave,
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }
}