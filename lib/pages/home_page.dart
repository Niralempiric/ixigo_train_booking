import 'package:flutter/material.dart';
import 'package:ixigo_train_booking_dev_hardik/pages/findCity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  DateTime? selectedDate;

  var res1 = {'code': 'NDLS', 'name': 'New Delhi'};
  var res2 = {'code': 'PNBE', 'name': 'Patana Jn'};

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff3f3f1),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  'https://us.123rf.com/450wm/jemastock/jemastock1712/jemastock171214282/92428014-train-frowntview-symbol-icon-vector-illustration-graphic-design.jpg?ver=6',
                  width: 50,
                ),
                const Text('Trains'),
                const Divider(color: Colors.blue),
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      res1 = await Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const FindCityWidget()));
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.yellow,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "${res1['code']}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            "${res1['name']}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Divider(color: Colors.grey),
                                  const SizedBox(height: 5),
                                  GestureDetector(
                                    onTap: () async {
                                      res2 = await Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const FindCityWidget()));
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.yellow,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              res2['code']!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            res2['name']!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    _controller.forward(
                                        from:
                                            0.0); // Start the rotation animation
                                    setState(() {
                                      var res = res1;
                                      res1 = res2;
                                      res2 = res;
                                    });
                                  },
                                  child: RotationTransition(
                                    turns: Tween(begin: 0.0, end: 0.5)
                                        .animate(_controller),
                                    child: const Icon(
                                      Icons.swap_vert_circle_outlined,
                                      color: Colors.blue,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          Divider(color: Colors.grey.shade400),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: selectedDate ?? DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(DateTime.now().year + 1),
                                  );
                                  if (pickedDate != null &&
                                      pickedDate != selectedDate) {
                                    setState(() {
                                      selectedDate = pickedDate;
                                    });
                                  }
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.date_range),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Text(
                                        selectedDate != null
                                            ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                            : "Choose Date",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: selectedDate != null
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                    if (selectedDate != null)
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedDate = null;
                                          });
                                        },
                                        child: Icon(Icons.close, size: 15),
                                      ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1, color: Colors.blue)),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedDate = DateTime.now()
                                              .add(Duration(days: 1));
                                        });
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Tomorrow",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1, color: Colors.red)),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedDate = DateTime.now()
                                              .add(Duration(days: 2));
                                        });
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Day After",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Checkbox(value: true, onChanged: (val) {}),
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Full refund applicable on cancellation',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Hassle-free instant refund process",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const FindCityWidget()));
                                    },
                                    style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0),
                                    ),
                                    child: const Text("Search Trains >"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "IRCTC Authorised Partner",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          border:
                              Border.all(width: 1, color: Colors.blue.shade200),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.blue,
                            ),
                            Column(
                              children: [
                                Text("Running Status >"),
                                Text("Where's my train?"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          border:
                              Border.all(width: 1, color: Colors.blue.shade200),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.blue,
                            ),
                            Column(
                              children: [
                                Text("PNR Status >"),
                                Text("Where's my trip status?"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Card(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Image.network(
                                  'https://cdn-icons-png.flaticon.com/128/12734/12734938.png?ga=GA1.1.1466642782.1704347640&semt=ais',
                                  width: 30,
                                ),
                                const Text(
                                  "Train Package",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
