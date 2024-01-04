import 'package:flutter/material.dart';

class FindCityWidget extends StatefulWidget {
  const FindCityWidget({super.key});

  @override
  State<FindCityWidget> createState() => _FindCityWidgetState();
}

class _FindCityWidgetState extends State<FindCityWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15, right: 15, left: 15, bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter city/station name",
                        prefixIcon: GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.arrow_back),
                        ),
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.mic,
                          color: Colors.purple,
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
