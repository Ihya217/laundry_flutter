import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_flutter/app/modules/search_page/views/search_page_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.primaryColor,
        title: Text(
          'Laundry Nime',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Get.toNamed('/search-page');
            },
          ),
          // Tambahkan ikon atau widget lain di sini jika diperlukan
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getPromoFromApi();
          controller.getShopFromApi();
        },
        child: Icon(Icons.refresh),
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: 14.0), // Sesuaikan dengan margin yang diinginkan
                  child: Text(
                    'Promo Terbaru',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 180.0,
                  child: Obx(
                    () => controller.isLoading.value
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                controller.promoModel.value.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              var promo =
                                  controller.promoModel.value.data![index];
                              return Container(
                                width: 200.0,
                                margin: EdgeInsets.symmetric(horizontal: 4.0),
                                child: Card(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 90, // Set tinggi gambar
                                              child: Image.network(
                                                'https://images.tokopedia.net/img/cache/700/VqbcmM/2023/11/17/24af87b8-2c1a-4d2f-bf0b-281fb46d1912.png',
                                                width: double.infinity,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    promo.shop?.name ?? '',
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 2.0),
                                                  Text(
                                                    promo.description ?? '',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(height: 2.0),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "\Rp.${promo.oldPrice}",
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      Text(
                                                        "\Rp.${promo.newPrice}",
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
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
                                            padding: EdgeInsets.all(4.0),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Text(
                                              'Promo',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
                SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.only(
                      left: 14.0), // Sesuaikan dengan margin yang diinginkan
                  child: Text(
                    'Shop',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 180.0,
                  child: Obx(
                    () => controller.isLoading.value
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                controller.shopModel.value.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              var shop =
                                  controller.shopModel.value.data![index];
                              return Container(
                                width: 200.0,
                                margin: EdgeInsets.symmetric(horizontal: 4.0),
                                child: Card(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 90, // Set tinggi gambar
                                              child: Image.network(
                                                'https://static.bmdstatic.com/pk/product/medium/5b306c6f58eed.jpg',
                                                width: double.infinity,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    shop.name ?? '',
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 2.0),
                                                  Text(
                                                    shop.description ?? '',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(height: 2.0),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "\Rp.${shop.price}",
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
