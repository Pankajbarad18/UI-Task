// ignore_for_file: file_names

import 'dart:convert';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:task_app/Components/Box.dart';
import 'package:task_app/Components/BoxTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data = [];
  var data2 = [];
  var data3 = [];
  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  Future<void> fetchdata() async {
    final String response =
        await rootBundle.loadString("lib/Json/program_detail.json");
    final item = jsonDecode(response);
    setState(() {
      data = item["prog"];
      data2 = item["event"];
      data3 = item["lesson"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Spacer(),
              Container(
                margin: const EdgeInsets.only(top: 3, left: 5, bottom: 3),
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 3, left: 11, bottom: 3),
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey)),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 3, left: 11, bottom: 3, right: 5),
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey)),
              )
            ]),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.blue[50]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 3,
                            width: 25,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade800),
                                shape: BoxShape.rectangle,
                                color: Colors.grey.shade800),
                          ),
                          const Gap(5),
                          Container(
                            height: 3,
                            width: 15,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade800),
                                shape: BoxShape.rectangle,
                                color: Colors.grey.shade800),
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.chat_bubble,
                            size: 30,
                          ),
                          Gap(15),
                          Icon(
                            Icons.notifications_on_rounded,
                            size: 30,
                          )
                        ],
                      )
                    ],
                  ),
                  const Gap(25),
                  const Text(
                    "Hello, Priya!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "What do you wanna learn today?",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoxTile(
                          icon: FluentSystemIcons
                              .ic_fluent_book_formula_database_filled,
                          text: "Programs"),
                      BoxTile(
                          icon: FluentSystemIcons.ic_fluent_help_circle_filled,
                          text: "Get help")
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoxTile(
                          icon: FluentSystemIcons.ic_fluent_book_number_filled,
                          text: "Learn"),
                      BoxTile(
                          icon: FluentSystemIcons
                              .ic_fluent_match_app_layout_filled,
                          text: "DD Tracker")
                    ],
                  ),
                ],
              ),
            ),
            BoxDetail(
              Title: "Programs For You",
              data: data,
              widgetb: const Text(""),
            ),
            BoxDetail(
              Title: "Event and Experience",
              widgetb: SizedBox(
                width: 80,
                height: 30,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        backgroundColor: Colors.white),
                    onPressed: () {},
                    child: const Text(
                      "Book",
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
              data: data2,
            ),
            BoxDetail(
              Title: "Programs For You",
              widgetb:
                  const Icon(FluentSystemIcons.ic_fluent_lock_shield_regular),
              data: data3,
            ),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_book_number_filled),
                  label: "Learn"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_surface_hub_filled),
                  label: "Hub"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_chat_filled),
                  label: "Chat"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ]),
      ),
    );
  }
}
