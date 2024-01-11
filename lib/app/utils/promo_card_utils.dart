import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_flutter/app/modules/dashboard/controllers/dashboard_controller.dart';

class PromoCardWidget extends StatelessWidget {
  final int index;

  PromoCardWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.find();
    var promo = controller.promoModel.value.data![index];

    return GestureDetector(
      onTap: () {
        Get.toNamed('/promo-details', arguments: index);
      },
      child: Container(
        width: 170.0,
        margin: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Set your desired border radius
          ),
          color: Get.theme.primaryColor.withOpacity(0.2),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90.0, // Set the desired height for the image
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: const Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.network(
                        'https://www.washworksct.com/media/1196/wash-works-hero-plus-award.jpg',
                        width: double.infinity,
                        height: double
                            .infinity, // Set height to double.infinity to take the height from the parent Container
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          promo.shop?.name ?? '',
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2.0),
                        Text(
                          promo.description ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\Rp.${promo.oldPrice}",
                              style: Get.theme.textTheme.labelSmall?.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey),
                            ),
                            Text(
                              "\Rp.${promo.newPrice}",
                              style: Get.theme.textTheme.labelSmall
                                  ?.copyWith(color: Get.theme.highlightColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 5.0,
                left: 4.0,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Text(
                    'Promo',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
