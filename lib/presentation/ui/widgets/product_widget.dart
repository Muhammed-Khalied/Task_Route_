// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:task_route_final/config/number_formatter.dart';
import 'package:task_route_final/domain/entities/product.dart';

class ProductWidget extends StatefulWidget {
  Product product;

  ProductWidget({super.key, required this.product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isWishlistedHeart = false;
  bool isWishlistedAdd = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color.fromARGB(255, 166, 196, 221),
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Stack(
            children: [
              Wrap(children: [
                Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 80,
                        child: CachedNetworkImage(
                            imageUrl: widget.product.images?[0] ?? '',
                            fit: BoxFit.fitWidth,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator()),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.product.title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  widget.product.description ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "EGP ${formatNumber(widget.product.discountPercentage ?? widget.product.price!)}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                    const SizedBox(width: 16),
                    Visibility(
                      visible: widget.product.discountPercentage != null,
                      child: Text(
                        "${formatNumber(widget.product.price!)} EGP",
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w300,
                            fontSize: 10),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Review (${formatNumber(widget.product.rating!)})",
                      style: const TextStyle(fontSize: 11),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ]),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: const Color.fromARGB(255, 178, 203, 224))),
                  child: IconButton(
                    color: const Color.fromRGBO(0, 65, 130, 1),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      isWishlistedHeart = !isWishlistedHeart;
                      setState(() {});
                    },
                    icon: isWishlistedHeart == true
                        ? const Icon(Icons.favorite_rounded)
                        : const Icon(
                            Icons.favorite_border_rounded,
                          ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.transparent)),
                  child: IconButton(
                    color: const Color.fromRGBO(0, 65, 130, 1),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      isWishlistedAdd = !isWishlistedAdd;
                      setState(() {});
                    },
                    icon: isWishlistedAdd == true
                        ? const Icon(Icons.add_box_rounded)
                        : const Icon(
                            Icons.add_box_outlined,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
