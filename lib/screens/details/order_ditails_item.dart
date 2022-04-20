import 'package:flutter/material.dart';
import 'package:qatar_driver_app/model/Order.dart';

class OrderDeiItem extends StatelessWidget {
  Order data;
  OrderDeiItem(this.data);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data.mosqueName!,
              style: const TextStyle(
                  color: Color(0xff0D2784),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      '${data.countCartoons}',
                      style: const TextStyle(
                          color: Color(0xff0D2784),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${int.parse(data.countCartoons)*20}',
                      style: const TextStyle(
                          color: Color(0xff0D2784),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const Text(
                    "عدد الكراتين",
                    style: TextStyle(
                        color: Color(0xff0D2784),
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "عدد الزجاج",
                    style: TextStyle(
                        color: Color(0xff0D2784),
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.status!,
                    style: const TextStyle(
                        color: Color(0xff00DAFD),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  )
                ],
              ),
              Center(
                child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      "assets/product.png",
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
