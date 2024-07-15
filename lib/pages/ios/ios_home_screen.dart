// import 'package:ecommerce_application/model/dataofchats.dart';
// import 'package:ecommerce_application/provider/cart_model.dart';
// import 'package:ecommerce_application/provider/plateform_provider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
//
// class IosHomePage extends StatefulWidget {
//   const IosHomePage({super.key});
//
//   @override
//   State<IosHomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<IosHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       child: Stack(
//         children: [
//           SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 48),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 24.0),
//                   child: Text('Good morning,'),
//                 ),
//                 const SizedBox(height: 4),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 24.0),
//                   child: Text(
//                     "Let's order fresh items for you",
//                     style: TextStyle(
//                       fontSize: 36,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 const SizedBox(height: 24),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 24.0),
//                   child: Text(
//                     "Fresh Items",
//                     style: TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Consumer<CartModel>(
//                     builder: (context, value, child) {
//                       return CupertinoScrollbar(
//                         child: GridView.builder(
//                           padding: const EdgeInsets.all(12),
//                           itemCount: value.shopItems.length,
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             childAspectRatio: 1 / 1.2,
//                           ),
//                           scrollDirection: Axis.vertical,
//                           itemBuilder: (context, index) {
//                             return GroceryItemTile(
//                               itemName: value.shopItems[index][0],
//                               itemPrice: value.shopItems[index][1],
//                               imagePath: value.shopItems[index][2],
//                               color: value.shopItems[index][3][200],
//                               onPressed: () {
//                                 Provider.of<CartModel>(context, listen: false)
//                                     .addItemToCart(index);
//                                 showCupertinoDialog(
//                                   context: context,
//                                   builder: (context) => CupertinoAlertDialog(
//                                     title: Text("${value.shopItems[index][0]}"),
//                                     content: const Text(
//                                       "Added to cart successfully",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     actions: [
//                                       CupertinoDialogAction(
//                                         isDefaultAction: true,
//                                         child: const Text("OK"),
//                                         onPressed: () {
//                                           Navigator.of(context).pop();
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             right: 16,
//             bottom: 16,
//             child: CupertinoButton(
//               color: CupertinoColors.activeGreen,
//               padding: const EdgeInsets.all(16),
//               child: const Icon(CupertinoIcons.bag),
//               onPressed: () {
//                 Navigator.pushNamed(context, "cartPage");
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
