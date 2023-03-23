import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: bmi(),
    debugShowCheckedModeBanner: false,
  ));
}

class bmi extends StatefulWidget {
  const bmi({Key? key}) : super(key: key);

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  String t2 = "cm";
  String t3 = "Feet";
  String grpvalue = "meter";

  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();

  double ans = 0;
  String ans1 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: weight,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: 'weight',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: height,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: 'Height',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            children: [
              Spacer(),
              Radio(
                onChanged: (value) {
                  setState(() {
                    grpvalue = value as String;
                  });
                },
                groupValue: grpvalue,
                value: t2,
              ),
              Text(t2),
              Spacer(),
              Radio(
                onChanged: (value) {
                  setState(() {
                    grpvalue = value as String;
                  });
                },
                groupValue: grpvalue,
                value: t3,
              ),
              Text(t3),
              Spacer(),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                double w = num.parse(weight.text).toDouble();
                double h = num.parse(height.text).toDouble();

                if (grpvalue == t2) {
                  h = h / 100;
                  ans = w / (h * h);
                }
                if (grpvalue == t3) {
                  h = h / 3.281;
                  ans = w / (h * h);
                }
                print(ans);
                setState(() {
                  if (ans < 16) {
                    ans1 = "underweight";
                  } else if (ans > 16 && ans < 35) {
                    ans1 = "normal";
                  } else if (ans > 35) {
                    ans1 = "overweight";
                  }
                });
              },
              child: Text("submit")),
          InkWell(
            child: Container(
              height: 100,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.red,
              child: Text("Result=${ans1}"),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
