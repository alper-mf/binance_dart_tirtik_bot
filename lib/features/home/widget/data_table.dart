import 'package:flutter/material.dart';

import '../../../app/models/exchange_info.dart';

class MyDataTable extends StatelessWidget {
  final List<AssetSymbol> assetsList;
  const MyDataTable({super.key, required this.assetsList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: DataTable(
      columnSpacing: 20,
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Asset',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'USDT',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'BUSD',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'PC',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: List.generate(assetsList.length, (index) {
        final item = assetsList[index];
        return DataRow(
          cells: <DataCell>[
            DataCell(Text(item.baseAsset!)),
            DataCell(Text(item.usdtPrice ?? '---')),
            DataCell(Text(item.busdPrice ?? '---')),
            DataCell(Text(item.percentChange != null ? item.percentChange!.toStringAsFixed(1) : '---')),
          ],
        );
      }),
    ));
  }
}
