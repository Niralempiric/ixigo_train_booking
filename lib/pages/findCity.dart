import 'package:flutter/material.dart';
import 'package:ixigo_train_booking_dev_hardik/apis/apis.dart';

class FindCityWidget extends StatefulWidget {
  const FindCityWidget({super.key});

  @override
  State<FindCityWidget> createState() => _FindCityWidgetState();
}

class _FindCityWidgetState extends State<FindCityWidget> {
  TextEditingController textEditingController = TextEditingController();

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
                    controller: textEditingController,
                    onChanged: (val) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        hintText: "Enter city/station name",
                        prefixIcon: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.arrow_back),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: FutureBuilder(
                  future:
                      ApiClient().searchStationAPI(textEditingController.text),
                  builder: (BuildContext context, AsyncSnapshot snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshots.data != null) {
                      List<dynamic> data =
                          snapshots.data['body'][0]['stations'];
                      print("snapshots>>> $data");
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          final itemData = data[index];

                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop({
                                    'code': itemData['data']['code'].toString(),
                                    'name': itemData['data']['name'].toString()
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.yellow,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 15,
                                            left: 15,
                                            top: 5,
                                            bottom: 5),
                                        child: Text(
                                            itemData['data']['code'].toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18),),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        itemData['data']['name'].toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Divider(
                                color: Colors.grey.shade900,
                              ),
                            ],
                          );
                        },
                      );
                    }

                    return const Text('Error Getting Response');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
