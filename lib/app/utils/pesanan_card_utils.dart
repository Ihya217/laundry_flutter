import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:laundry_flutter/app/modules/pesanan/controllers/pesanan_controller.dart';

class PesananCardWidget extends StatelessWidget {
  final int index;

  PesananCardWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    final PesananController controller = Get.find();

    var pesanan = controller.pesananModel.value.data![index];

    return GestureDetector(
      onTap: () {
        Get.toNamed('/pesanan-details', arguments: index);
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Get.theme.primaryColor.withOpacity(0.2),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 90.0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.network(
                      'https://media.karousell.com/media/photos/products/2023/11/12/baju_koko_hitam_1699748685_a6913b8c.jpg',
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            toBeginningOfSentenceCase(
                                pesanan.description ?? ''),
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            'Status :',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Get.theme.textTheme.labelSmall,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${pesanan.status}",
                                    style: Get.theme.textTheme.labelSmall
                                        ?.copyWith(
                                      color: _getStatusColor(pesanan.status),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Rp.${NumberFormat("#,##0", "id_ID").format(pesanan.total)}",
                                style: Get.theme.textTheme.labelSmall?.copyWith(
                                  color: Get.theme.highlightColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case "Queue":
        return Get.theme.highlightColor; // Warna kuning untuk status Queue
      case "Washing":
        return Colors.pink.shade200; // Warna pink untuk status Washing
      case "Done":
        return Colors.green.shade200; // Warna hijau untuk status Done
      case "Process":
        return Colors
            .lightBlue.shade200; // Warna biru muda untuk status Process
      default:
        return Get.theme.highlightColor; // Warna default jika tidak ada cocokan
    }
  }
}
