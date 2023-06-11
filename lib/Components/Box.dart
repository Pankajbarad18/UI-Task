// ignore_for_file: non_constant_identifier_names, file_names
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BoxDetail extends StatefulWidget {
  final String Title;
  final List data;
  final Widget widgetb;

  const BoxDetail({
    super.key,
    required this.Title,
    required this.data,
    required this.widgetb,
  });

  @override
  State<BoxDetail> createState() => _BoxDetailState();
}

class _BoxDetailState extends State<BoxDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.Title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Row(
                children: [
                  Text(
                    "View all",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.grey,
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 400,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.data.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.only(right: 20, top: 20, bottom: 20),
                    width: 300,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 1)
                        ]),
                    child: Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * .5,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            image: DecorationImage(
                                image: AssetImage(widget.data[index]['img']),
                                fit: BoxFit.cover)),
                      ),
                      const Gap(16),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.data[index]['Title'],
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            const Gap(8),
                            Text(
                              widget.data[index]['desc'],
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const Gap(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.data[index]['small'],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                widget.widgetb
                              ],
                            ),
                          ],
                        ),
                      )
                    ]),
                  );
                })),
          )
        ],
      ),
    );
  }
}
