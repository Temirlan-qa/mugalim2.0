// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:mugalim/core/const/const_color.dart';
// import 'package:mugalim/core/const/text_style_const.dart';
//
// class GridWidget extends StatefulWidget {
//   List list;
//   List select_list;
//   GridWidget({
//     Key? key,
//     required this.list,
//     required this.select_list,
//   }) : super(key: key);
//
//   @override
//   State<GridWidget> createState() => _GridWidgetState();
// }
//
// class _GridWidgetState extends State<GridWidget> {
//   List array = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         shrinkWrap: true,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             childAspectRatio:
//                 (MediaQuery.of(context).size.width - 40) / 2 / 120,
//             crossAxisCount: 2,
//             crossAxisSpacing: 4,
//             mainAxisSpacing: 4),
//         itemCount: widget.list.length,
//         itemBuilder: (BuildContext ctx, index) {
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 if (!array.contains(index)) {
//                   array.clear();
//                   array.add(index);
//                 } else if (array.contains(index)) {
//                   array.clear();
//                 }
//               });
//             },
//             child: Container(
//               // height: 120,
//               // width: (MediaQuery.of(context).size.width -40 )/2,
//               margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
//               padding: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: const BorderRadius.all(Radius.circular(12)),
//                 border: Border.all(
//                     color: array.contains(index)
//                         ? ColorStyles.primaryBorderColor
//                         : ColorStyles.neutralsPageBackgroundColor,
//                     width: 2,),
//               ),
//
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '${widget.list[index]}',
//                     style: TextStyles.mediumStyle.copyWith(
//                         fontSize: 16,
//                         color: Colors.white),
//                   ),
//                   const Spacer(),
//                   array.contains(index)
//                       ? Container(
//                           height: 24,
//                           width: 24,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: ColorStyles.primaryBorderColor,
//                           ),
//                           child: const Icon(
//                             Icons.done,
//                             size: 16,
//                             color: Colors.white,
//                           ),
//                         )
//                       : Container(
//                           height: 24,
//                           width: 24,
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.white,
//                           ),
//                         ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
