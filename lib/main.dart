import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POC Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calendar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final DateTime today;
  late final DateTime lastDayOfMonth;
  late final DateTime firstDayOfMonth;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final _animationController = AnimationController;

  setupDays() {
    today = DateTime.now();

    lastDayOfMonth = (today.month < 12)
        ? DateTime(today.year, today.month + 1, 0)
        : DateTime(today.year + 1, 1, 0);
    firstDayOfMonth = DateTime(today.year, today.month, 1);
  }

  @override
  void initState() {
    super.initState();
    setupDays();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1D39),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xff35EBF1),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.person,
                              size: 24,
                              color: Color(0xff35EBF1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Olá,',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              'João Silva',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.notifications,
                    size: 32,
                    color: Color(0xff35EBF1),
                  )
                ],
              ),
              TableCalendar(
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    focusedDay = selectedDay;
                  });
                },
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                daysOfWeekVisible: false,
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                ),
                availableCalendarFormats: const <CalendarFormat, String>{
                  CalendarFormat.month: ''
                },
                focusedDay: _focusedDay,
                currentDay: today,
                firstDay: firstDayOfMonth,
                lastDay: lastDayOfMonth,
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Colors.white),
                  weekendStyle: TextStyle(color: Colors.white),
                ),
                calendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  defaultTextStyle: const TextStyle(color: Colors.white),
                  weekendTextStyle: const TextStyle(color: Colors.white),
                  disabledTextStyle: const TextStyle(color: Colors.white),
                  outsideTextStyle: const TextStyle(color: Colors.white),
                  rangeEndTextStyle: const TextStyle(color: Colors.white),
                  withinRangeTextStyle: const TextStyle(color: Colors.white),
                  rangeStartTextStyle: const TextStyle(color: Colors.white),
                  todayTextStyle: const TextStyle(color: Colors.white),
                  holidayTextStyle: const TextStyle(color: Colors.white),
                  selectedTextStyle: const TextStyle(color: Colors.white),
                  defaultDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff5B81BC),
                  ),
                  todayDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff35EBF1),
                  ),
                  holidayDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff5B81BC),
                  ),
                  weekendDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff5B81BC),
                  ),
                  disabledDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff1C1D39),
                  ),
                  selectedDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff35EBF1),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text(
                    'Resultados do dia: ${_focusedDay.day}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 250,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      //color: const Color(0xff5B81BC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Glicose',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Não informado',
                                    style: TextStyle(
                                      color: Color(0xff35EBF1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const LinearProgressIndicator(
                                value: 0.0,
                                minHeight: 8,
                                color: Color(0xff35EBF1),
                                backgroundColor: Color(0xff2F418D),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const Text(
                                'O seu valor recomendado é abaixo ou igual a 100mg/dL',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Pressão Arterial',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      Text(
                                        '120/80 mmHg',
                                        style: TextStyle(
                                          color: Color(0xffF1D435),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'acima do normal',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const LinearProgressIndicator(
                                value: 0.6,
                                minHeight: 8,
                                color: Color(0xffF1D435),
                                backgroundColor: Color(0xff2F418D),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const Text(
                                'O seu valor recomendado é menor ou igual a 120/80 mmHg',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Frequência Cardíaca',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      Text(
                                        '108 bpm',
                                        style: TextStyle(
                                          color: Color(0xffF15935),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'preocupante',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const LinearProgressIndicator(
                                value: 0.7,
                                minHeight: 8,
                                color: Color(0xffF15935),
                                backgroundColor: Color(0xff2F418D),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const Text(
                                'O seu valor recomendado é entre 55 bpm e 74 bpm',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Temperatura',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      Text(
                                        '37˙',
                                        style: TextStyle(
                                          color: Color(0xff35EBF1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'acima do normal',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const LinearProgressIndicator(
                                value: 0.7,
                                minHeight: 8,
                                color: Color(0xff35EBF1),
                                backgroundColor: Color(0xff2F418D),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const Text(
                                'O seu valor recomendado é entre 35.5˙ a 37.4',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
