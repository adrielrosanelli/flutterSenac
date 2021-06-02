import 'dart:developer';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final ScrollController controller = ScrollController();
  final List<String> teste = ['adriel', 'rosanelli', 'pedro', 'joel'];
  Home({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: Container(
      //     color: Colors.orange,
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
              onPressed: () {
                print('você foi pro perfil');
              },
              icon: Icon(Icons.person)),
        ],
      ),
      body: CustomScrollView(
          // scrollDirection: Axis.horizontal,
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate(
              [
                Column(
                    // scrollDirection: Axis.horizontal,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate: SliverChildListDelegate([]),
                          )
                        ],
                      )
                    ]

                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text('Encanador'),
                    // ),

                    ),
              ],
            )),
          ]),
    );
  }
}
// import 'dart:developer';

// import 'package:flutter/material.dart';

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       initialIndex: 0,
//       child: Scaffold(
//         // drawer: Drawer(
//         //   child: Container(
//         //     color: Colors.orange,
//         //   ),
//         // ),
//         appBar: AppBar(
//           backgroundColor: Colors.orange,
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   print('você foi pro perfil');
//                 },
//                 icon: Icon(Icons.person)),
//           ],
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 text: 'VAGAS',
//               ),
//               Tab(
//                 text: 'PROFISSIONAIS',
//               ),
//               // Tab(icon: Icon(Icons.directions_bike)),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             SingleChildScrollView(
//               child: Container(
//                 height: MediaQuery.of(context).size.height,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   // mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('Encanador'),
//                     ),
//                     Flexible(
//                       child: ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               clipBehavior: Clip.hardEdge,
//                               // height: 50,
//                               // width: 150,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   border: Border.all(color: Colors.black)),
//                               child: Column(
//                                 children: [
//                                   Expanded(
//                                     child: AspectRatio(
//                                       aspectRatio: 16 / 9,
//                                       child: Image.asset(
//                                         'assets/imagemNaoEncontrada.png',
//                                         errorBuilder:
//                                             (context, error, stackTrace) =>
//                                                 Image.asset(
//                                           'assets/imagemNaoEncontrada.png',
//                                           scale: 10,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Column(
//                                     children: [
//                                       Container(
//                                         height: 50,
//                                         width: 50,
//                                         color: Colors.brown[300],
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('Pedreiro'),
//                     ),
//                     Flexible(
//                       child: ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: [
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Flexible(
//                       child: ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: [
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Flexible(
//                       child: ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: [
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Flexible(
//                       child: ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: [
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Icon(Icons.directions_transit),
//             // Icon(Icons.directions_bike),
//           ],
//         ),
//       ),
//     );
//   }
// }
