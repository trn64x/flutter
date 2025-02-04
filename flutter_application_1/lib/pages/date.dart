import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'dart:async';

class Date extends StatefulWidget {
  const Date({super.key});

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  Timer? _timer;
  late Map<String, dynamic> _data;
  late Map<String, dynamic> _dataMoja;

  @override
  void initState() {
    super.initState();
    _data = dataMajusi();
    _dataMoja = dataMoja();
    Timer.periodic(const Duration(seconds: 1), (timer) {
    if(!mounted) return;
      setState(() {
        _data = dataMajusi();
        _dataMoja = dataMoja();
      });
    });
  }
  @override 
  void dispose(){
    _timer?.cancel();
    super.dispose();
  }
  Map<String, dynamic> dataMajusi() {
    return calculateTimeRemaining("2027-03-01");
  }

  Map<String, dynamic> dataMoja() {
    return calculateTimeRemaining("2027-03-06");
  }

  Map<String, dynamic> calculateTimeRemaining(String targetDate) {
    Jiffy now = Jiffy.now();
    Jiffy target = Jiffy.parse(targetDate);

    int years = target.diff(now, unit: Unit.year).toInt();
    Jiffy temp = now.add(years: years);

    int months = target.diff(temp, unit: Unit.month).toInt();
    temp = temp.add(months: months);

    int days = target.diff(temp, unit: Unit.day).toInt();
    temp = temp.add(days: days);

    int hours = target.diff(temp, unit: Unit.hour).toInt();
    int minutes = target.diff(temp, unit: Unit.minute).toInt();
    temp = temp.add(minutes: minutes);
    int seconds = target.diff(temp, unit: Unit.second).toInt();
    temp = temp.add(seconds:seconds);

    return {
      "lat": years,
      "miesiące": months,
      "dni": days,
      "godzin": hours,
      "minut": minutes % 60,
      "sekund": seconds,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nasze Osiemnastki 🎉"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(199, 199, 199, 1),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "🎂 Osiemnastka Żonki 🎂",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              displayCountdown(_data),
              const Divider(thickness: 2, height: 30),
              const Text(
                "🎂 Osiemnastka Pookiego 🎂",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              displayCountdown(_dataMoja),
            ],
          ),
        ),
      ),
    );
  }

  Widget displayCountdown(Map<String, dynamic> data) {
    return Column(
      children: data.entries
          .map(
            (entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                "${entry.key}: ${entry.value}",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          )
          .toList(),
    );
  }
}