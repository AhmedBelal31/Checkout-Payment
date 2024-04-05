// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// class HorizontalList extends StatelessWidget {
//   final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CarouselSlider.builder(
//           itemCount: items.length,
//           options: CarouselOptions(
//             aspectRatio: 16 / 9,
//             viewportFraction: 0.6,
//             initialPage: 0,
//             enableInfiniteScroll: false,
//             reverse: false,
//             autoPlay: false,
//             enlargeCenterPage: true,
//             scrollDirection: Axis.horizontal,
//           ),
//           itemBuilder: (BuildContext context, int index, int realIndex) {
//             return Container(
//               width: MediaQuery.of(context).size.width * 0.8,
//               margin: const EdgeInsets.symmetric(horizontal: 5.0),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Center(
//                 child: Text(
//                   items[index],
//                   style: const TextStyle(color: Colors.white, fontSize: 20.0),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   sortList([1, 2, 3, 4, 5]);
// }
//
// void swap( int index1, int index2) {
//   var temp = index1;
//   index1 = index2;
//   index2 = temp;
// }
//
// void sortList(List<int> list) {
//   //[1,0,2,3]
//   //[0,1 ,]
//
//   int minIndex = 0 ;
//   for (int i = 0; i < list.length-1; i++) {
//     for (int j = i+1; j < list.length+1 ; j++) {
//       if (list[i] <= list[j]) {
//         minIndex = i ;
//         swap(list[minIndex] , list[j]) ;
//       }
//       print(list);
//     }
//
//   }
//
// }

void main() {
  var myList = [5, 9, 3, 2, 1];
  sortList(myList);
  print(myList); // Prints: [1, 2, 3, 4, 5]
}

void swap(List<int> list, int index1, int index2) {
  var temp = list[index1];
  list[index1] = list[index2];
  list[index2] = temp;
}

void sortList(List<int> list) {
  for (int i = 0; i < list.length - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < list.length; j++) {
      if (list[j] < list[minIndex]) {
        minIndex = j;
      }
    }
    if (minIndex != i) {
      swap(list, i, minIndex);
    }
  }
}
