import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_flutter/app/modules/dashboard/controllers/dashboard_controller.dart';

class ProductCardWidget extends StatelessWidget {
  final int index;

  ProductCardWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.find();
    var product = controller.shopModel.value.data![index];

    return GestureDetector(
      onTap: () {
        Get.toNamed('/shop-details', arguments: index);
      },
      child: Container(
        width: 170,
        margin: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Set your desired border radius
            ),
            color: Get.theme.primaryColor.withOpacity(0.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 90.0, // Set the desired height for the image
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(
                      'https://1.bp.blogspot.com/-MTrPFhVmemA/XqEfdiMdLdI/AAAAAAAADTo/eDdAFcyPBrsjT3dnPoYsCew6eZQ0qNPOQCEwYBhgL/s1600/KIA%2BLAUNDRY%2BBENGKULU%2B%25282%2529.jpg',
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
                        product.name ?? '',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        product.description ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Get.theme.textTheme.labelSmall,
                      ),
                      const SizedBox(height: 2.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("${product.rate}",
                                  style: Get.theme.textTheme.labelSmall
                                      ?.copyWith(
                                          color: Get.theme.highlightColor)),
                              Icon(
                                Icons.star,
                                color: Get.theme.highlightColor,
                                size: 15,
                              )
                            ],
                          ),
                          Text("\Rp.${product.price}",
                              style: Get.theme.textTheme.labelSmall
                                  ?.copyWith(color: Get.theme.highlightColor)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
