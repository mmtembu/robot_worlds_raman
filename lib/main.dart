import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:robot_worlds_raman/button.dart';
import 'package:robot_worlds_raman/pixel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  // HomePageWidget({Key key, String title}) : super(key: key);
  final title = "Flutter Demo Home Page";

  const HomePage({Key? key, required title}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePage> {
  // MediaQueryData queryData = = MediaQuery.of(context);
  int numberOfSquares = 300;
  int playerPosition = 143;
  List<int> barriers = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    30,
    45,
    60,
    75,
    90,
    105,
    120,
    135,
    150,
    165,
    180,
    195,
    210,
    225,
    240,
    255,
    270,
    285,
    286,
    287,
    288,
    289,
    290,
    291,
    292,
    293,
    294,
    295,
    296,
    297,
    298,
    299,
    29,
    44,
    59,
    74,
    89,
    104,
    119,
    134,
    149,
    164,
    179,
    194,
    209,
    224,
    239,
    254,
    269,
    284,
    299
  ];

  void moveRight() {
    setState(() {
      if (!(playerPosition % 15 == 14) &&
          !barriers.contains(playerPosition + 1)) {
        playerPosition += 1;
      }
    });
  }

  void moveLeft() {
    setState(() {
      if (!(playerPosition % 15 == 0) &&
          !barriers.contains(playerPosition - 1)) {
        playerPosition -= 1;
      }
    });
  }

  void moveUp() {
    setState(() {
      if (playerPosition - 15 >= 0 && !barriers.contains(playerPosition - 15)) {
        playerPosition -= 15;
      }
    });
  }

  void moveDown() {
    setState(() {
      if (playerPosition + 15 < numberOfSquares &&
          !barriers.contains(playerPosition + 15)) {
        playerPosition += 15;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    print("show me these pixels ${mediaQuery.size.height}");
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: numberOfSquares,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 15),
                    itemBuilder: (BuildContext context, int index) {
                      if (playerPosition == index) {
                        print("show me the index: ${index}");
                        return MyPixel(
                          color: Colors.white,
                          // child: Text(index.toString())
                        );
                      } else if (barriers.contains(index)) {
                        return MyPixel(color: Colors.black);
                      } else {
                        return MyPixel(
                          color: Colors.grey,
                          // child: Text(index.toString())
                        );
                      }
                    }),
              )),
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(),
                    MyButton(
                        function: moveUp,
                        color: Colors.grey,
                        child: const Icon(
                          Icons.arrow_drop_up,
                          size: 70,
                        )),
                    MyButton()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                        function: moveLeft,
                        color: Colors.grey,
                        child: const Icon(
                          Icons.arrow_left,
                          size: 70,
                        )),
                    MyButton(),
                    MyButton(
                        function: moveRight,
                        color: Colors.grey,
                        child: const Icon(
                          Icons.arrow_right,
                          size: 70,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(),
                    MyButton(
                        function: moveDown,
                        color: Colors.grey,
                        child: const Icon(
                          Icons.arrow_drop_down,
                          size: 70,
                        )),
                    MyButton()
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

// class _HomePageWidgetState extends State<HomePage> {
//   bool _loadingButton1 = false;
//   bool _loadingButton2 = false;
//   bool _loadingButton3 = false;
//   bool _loadingButton4 = false;
//   bool _loadingButton5 = false;
//   bool _loadingButton6 = false;
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: PreferredSize(
//         preferredSize:
//             Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
//         child: AppBar(
//           backgroundColor: const Color(0xFF0D2F79),
//           automaticallyImplyLeading: true,
//           flexibleSpace: const Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(80, 55, 0, 0),
//             child: Text(
//               'Something world',
//               style: TextStyle(
//                 fontFamily: 'Noto Serif',
//                 color: Colors.white,
//                 fontSize: 25,
//               ),
//             ),
//           ),
//           actions: [],
//           elevation: 4,
//         ),
//       ),
//       backgroundColor: Color(0xFF040404),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Align(
//               alignment: AlignmentDirectional(0, 0),
//               child: Image.asset(
//                 'assets/images/robot_worlds.jpg',
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height * 1,
//                 fit: BoxFit.fill,
//               ),
//             ),
//             Align(
//               alignment: AlignmentDirectional(0, 1),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   color: Color(0x7FFFFFFF),
//                 ),
//                 child: Stack(
//                   children: [
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Expanded(
//                             child: Align(
//                               alignment: AlignmentDirectional(-0.45, 0.45),
//                               child: IconButton(
//                                 onPressed: () {
//                                   print('Button pressed ...');
//                                 },
//                                 icon: FaIcon(
//                                   FontAwesomeIcons.solidArrowAltCircleLeft,
//                                   color: Color(0xFF153DA4),
//                                   size: 60,
//                                 ),
//                                 // options: FFButtonOptions(
//                                 //   width: 80,
//                                 //   height: 80,
//                                 //   color: Color(0x003474E0),
//                                 //   elevation: 5,
//                                 //   borderSide: BorderSide(
//                                 //     color: Colors.transparent,
//                                 //     width: 1,
//                                 //   ),
//                                 //   borderRadius: 100,
//                                 // ),
//                                 // loading: _loadingButton1,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
//                             child: IconButton(
//                               onPressed: () {
//                                 print('Button pressed ...');
//                               },
//                               // text: 'Top',
//                               icon: FaIcon(
//                                 FontAwesomeIcons.solidArrowAltCircleUp,
//                                 color: Color(0xFF153DA4),
//                                 size: 60,
//                               ),
//                               // options: FFButtonOptions(
//                               //   width: 80,
//                               //   height: 80,
//                               //   color: Color(0x003474E0),
//                               //   textStyle: FlutterFlowTheme.subtitle2.override(
//                               //     fontFamily: 'Poppins',
//                               //     color: Colors.white,
//                               //   ),
//                               //   elevation: 5,
//                               //   borderSide: BorderSide(
//                               //     color: Colors.transparent,
//                               //     width: 1,
//                               //   ),
//                               //   borderRadius: 100,
//                               // ),
//                               // loading: _loadingButton2,
//                             ),
//                           ),
//                           Expanded(
//                             child: Align(
//                               alignment: const AlignmentDirectional(0.45, 0.45),
//                               child: IconButton(
//                                 onPressed: () {
//                                   print('Button pressed ...');
//                                 },
//                                 // text: 'Right',
//                                 icon: const FaIcon(
//                                   FontAwesomeIcons.solidArrowAltCircleRight,
//                                   color: Color(0xFF153DA4),
//                                   size: 60,
//                                 ),
//                                 // options: FFButtonOptions(
//                                 //   width: 80,
//                                 //   height: 80,
//                                 //   color: Color(0x003474E0),
//                                 //   textStyle: TextStyle(
//                                 //       FlutterFlowTheme.subtitle2.override(
//                                 //     fontFamily: 'Poppins',
//                                 //     color: Colors.white,
//                                 //   ),
//                                 //   elevation: 5,
//                                 //   borderSide: BorderSide(
//                                 //     color: Colors.transparent,
//                                 //     width: 1,
//                                 //   ),
//                                 //   borderRadius: 100,
//                                 // ),
//                                 // loading: _loadingButton3,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 10, 0, 10, 0),
//                             child: TextButton(
//                               onPressed: () {
//                                 print('Button pressed ...');
//                               },
//                               child: const Text('Mine'),
//                               // options: FFButtonOptions(
//                               //   width: 100,
//                               //   height: 40,
//                               //   color: Color(0xFF153DA4),
//                               //   textStyle: FlutterFlowTheme.subtitle2.override(
//                               //     fontFamily: 'Poppins',
//                               //     color: Colors.white,
//                               //   ),
//                               //   elevation: 5,
//                               //   borderSide: BorderSide(
//                               //     color: Colors.transparent,
//                               //     width: 1,
//                               //   ),
//                               //   borderRadius: 12,
//                               // ),
//                               // loading: _loadingButton4,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 10, 0, 10, 0),
//                             child: TextButton(
//                               onPressed: () {
//                                 print('Button pressed ...');
//                               },
//                               child: const Text('Fire'),
//                               // options: FFButtonOptions(
//                               //   width: 100,
//                               //   height: 40,
//                               //   color: Color(0xFF153DA4),
//                               //   textStyle: FlutterFlowTheme.subtitle2.override(
//                               //     fontFamily: 'Poppins',
//                               //     color: Colors.white,
//                               //   ),
//                               //   elevation: 5,
//                               //   borderSide: BorderSide(
//                               //     color: Colors.transparent,
//                               //     width: 1,
//                               //   ),
//                               //   borderRadius: 12,
//                               // ),
//                               // loading: _loadingButton5,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 10, 0, 10, 0),
//                             child: TextButton(
//                               onPressed: () {
//                                 print('Button pressed ...');
//                               },
//                               child: const Text('Repair'),
//                               // options: FFButtonOptions(
//                               //   width: 100,
//                               //   height: 40,
//                               //   color: Color(0xFF153DA4),
//                               //   textStyle: FlutterFlowTheme.subtitle2.override(
//                               //     fontFamily: 'Poppins',
//                               //     color: Colors.white,
//                               //   ),
//                               //   elevation: 5,
//                               //   borderSide: BorderSide(
//                               //     color: Colors.transparent,
//                               //     width: 1,
//                               //   ),
//                               //   borderRadius: 12,
//                               // ),
//                               // loading: _loadingButton6,
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               alignment: const AlignmentDirectional(0, -1),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height * 0.58,
//                 decoration: BoxDecoration(
//                   color: const Color(0xCCEEEEEE),
//                   borderRadius: BorderRadius.circular(3),
//                 ),
//                 child: GridView(
//                   padding: EdgeInsets.zero,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                     childAspectRatio: 1,
//                   ),
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   children: [],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
