// import 'package:flutter/material.dart';

// class FavCard extends StatefulWidget {
//   @override
//   _FavCardState createState() => _FavCardState();
// }

// class _FavCardState extends State<FavCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10.0),
//         child: Stack(
//           children: <Widget>[
//             Container(
//               height: 200.0,
//               width: 380.0,
//               // color: Colors.red,
//               child: Image.network(
//                 "https://bhansagharapi.herokuapp.com/uploads/${product.image}",
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Positioned(
//               left: 20.0,
//               child: Container(
//                 width: 40.0,
//                 height: 45.0,
//                 decoration: BoxDecoration(
//                     color: Colors.yellow[700],
//                     shape: BoxShape.rectangle,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(20.0),
//                       bottomRight: Radius.circular(20.0),
//                     )),
//                 child: IconButton(
//                     icon: Icon(product.isFavourite
//                         ? Icons.favorite
//                         : Icons.favorite_border),
//                     onPressed: () {
//                       // if (_formkey.currentState.validate()) {
//                       // FavService()
//                       //     .addToFavourite(product.id)
//                       //     .then((value) {
//                       //   if (value.statusCode == 200) {
//                       //     product.toggleFavouriteStatus();
//                       //   } else if (value.statusCode == 400) {
//                       //     print("eereafsdfasdfadsf");
//                       //     print(value.data['error']);
//                       //   }
//                       // });
//                     }),
//               ),
//             ),
//             Positioned(
//               left: 0.0,
//               bottom: 0.0,
//               child: Container(
//                 height: 60.0,
//                 width: 380.0,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       colors: [Colors.black, Colors.black38],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 10.0,
//               bottom: 10.0,
//               right: 10.0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         product.title,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Row(
//                         children: <Widget>[
//                           Icon(
//                             Icons.star,
//                             color: Theme.of(context).primaryColor,
//                             size: 16.0,
//                           ),
//                           Icon(
//                             Icons.star,
//                             color: Theme.of(context).primaryColor,
//                             size: 16.0,
//                           ),
//                           Icon(
//                             Icons.star,
//                             color: Theme.of(context).primaryColor,
//                             size: 16.0,
//                           ),
//                           Icon(
//                             Icons.star,
//                             color: Theme.of(context).primaryColor,
//                             size: 16.0,
//                           ),
//                           Icon(
//                             Icons.star,
//                             color: Theme.of(context).primaryColor,
//                             size: 16.0,
//                           ),
//                           SizedBox(width: 10.0),
//                           Text(
//                             '(' + product.rating.toString() + 'Reviews)',
//                             style: TextStyle(
//                               color: Colors.grey,
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                   Column(
//                     children: <Widget>[
//                       Text(
//                         'Rs. ${product.price.toString()}',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.yellowAccent,
//                           fontSize: 18.0,
//                         ),
//                       ),
//                       Text(
//                         'Min Order',
//                         style: TextStyle(
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
