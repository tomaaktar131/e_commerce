import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  ///<========= Product Details page ==============> ///

  RxInt selectedIndex = 0.obs;

  final RxString selectedSize = ''.obs;
  final RxnInt selectedSizeIndex = RxnInt();

  void selectSize(index, product) {
    // If the same size is tapped again, deselect it.
    if (selectedSizeIndex.value == index) {
      selectedSizeIndex.value = null;
      selectedSize.value = '';
    } else {
      selectedSizeIndex.value = index;
      selectedSize.value = product["size"][index];
    }
  }

  RxMap<String, dynamic> selectedProduct = <String, dynamic>{}.obs;
  setSelectedProduct(Map<String, dynamic> product) {
    selectedProduct.value = product;
  }

  RxBool isExpanded = false.obs;

  ///<===============home page=================>///
  RxList<Map<String, dynamic>> brands = [
    {"name": "Adidas", "icon": "assets/icons/brand_logo/adidas.svg"},
    {"name": "Nike", "icon": "assets/icons/brand_logo/nike.svg"},
    {"name": "Fila", "icon": "assets/icons/brand_logo/fila.svg"},
    {"name": "Adidas", "icon": "assets/icons/brand_logo/adidas.svg"},
    {"name": "Nike", "icon": "assets/icons/brand_logo/nike.svg"},
    {"name": "Fila", "icon": "assets/icons/brand_logo/fila.svg"},
  ].obs;
  RxList<Map<String, dynamic>> products = [
    {
      "productTitle": "Stylish Comfortable Tracksuit",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "451",
      "description": '''Stylish Comfortable Tracksuit

Product: 1 T-Shirt + 1 Trouser
Fabric: Imported Sweat blazer & Chine PP
Size:- M, L, XL

Trouser Measurements:
M=Waist-32, Length-37
L=Waist-35, Length-38
XL=Waist-36, Length-39

T-Shirt Measurements:
M=Chest-36, Length-27
L=Chest-38, Length-28
XL=Chest-40, Length-29 ''',
      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "quantity": 1,
      "category": "Tracksuit",
      "brand": "Adidas",
    },
    {
      "productTitle": "Trendy Premium Winter Hoodie",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "521",
      "description": '''Trendy Premium Winter Hoodie


      Fabric: Cotton
      Gsm: 300
      Export quality sewing
      Fashionable & Elegant Design
      Made in: Bangladesh

      Size: M,L,XL
      M - Long-27, Chest-38
      L - Length-28, Chest-40
      XL- Chest – Long-29, Chest-42''',

      "imagePath_1": "assets/images/product/Winter Hoodie_1.jpg",
      "imagePath_2": "assets/images/product/Winter Hoodie_2.jpg",
      "imagePath_3": "assets/images/product/Winter Hoodie_3.jpg",
      "imagePath_4": "assets/images/product/Winter Hoodie_4.jpg",
      "quantity": 1,

      "category": "Hoodie",
      "brand": "Nike",
    },
    {
      "productTitle": "Superhit Exclusive Cotton Katua",
      "size": ["M", "L", "XL", "2XL"],
      "price": "150",
      "description": '''Superhit Exclusive Cotton Katua

১০০% বাস্তব ছবি এক্সক্লুসিভ কটন কাতুয়া,
Fabric: Cotton 
Size measurement:
M - Length 27- Chest 38 🥀
L - Length 28- Chest 40 🥀
XL - Length 29 - Chest 42🥀
XXL- length 30-Chest 44 🥀''',
      "imagePath_1": "assets/images/product/Cotton Katua 1.jpg",
      "imagePath_2": "assets/images/product/Cotton Katua 2.jpg",
      "imagePath_3": "assets/images/product/Cotton Katua 3.jpg",
      "imagePath_4": "assets/images/product/Cotton Katua 4.jpg",
      "quantity": 1,
      "category": "Kurta",
      "brand": "Fila",
    },
    {
      "productTitle": "Unique Design Cotton T-Shirt",
      "size": ["M", "L", "XL", "2XL"],
      "price": "199",
      "description": '''Unique Design Cotton T-Shirt
্টাইলিশ, আরামদায়ক আর ডেইলি আউটিং এর জন্য পারফেক্ট। এই Unique Design T-Shirt আপনার ডে-টু-ডে লাইফে আনবে এক নতুন মাত্রা।
👕 Fabric: 100% Cotton – হালকা, সফট আর বাতাস চলাচল করে এমন  কাপড়, যা গরমে আরামে পরা যায়।
⚖ GSM: 150 (প্রায়) – পারফেক্ট লাইটওয়েট, ডেইলি ইউজের জন্য বেস্ট।
🎨 Print: হাই কোয়ালিটি DTF প্রিন্ট – যা দীর্ঘদিন টিকে থাকে, রঙ ফিকে হয় না।
Available Colors: Black | Navy Blue | Grey | White
Size: M, L, XL, XXL''',
      "imagePath_1": "assets/images/product/Cotton T-Shirt 1.jpg",
      "imagePath_2": "assets/images/product/Cotton T-Shirt 2.jpg",
      "imagePath_3": "assets/images/product/Cotton T-Shirt 3.jpg",
      "imagePath_4": "assets/images/product/Cotton T-Shirt 4.jpg",
      "quantity": 1,
      "category": "T-Shirt",
      "brand": "Adidas",
    },
    {
      "productTitle": "Stylish Comfortable Tracksuit",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "451",
      "description": '''Stylish Comfortable Tracksuit

Product: 1 T-Shirt + 1 Trouser
Fabric: Imported Sweat blazer & Chine PP
Size:- M, L, XL

Trouser Measurements:
M=Waist-32, Length-37
L=Waist-35, Length-38
XL=Waist-36, Length-39

T-Shirt Measurements:
M=Chest-36, Length-27
L=Chest-38, Length-28
XL=Chest-40, Length-29 ''',
      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "quantity": 1,
      "category": "Tracksuit",
      "brand": "Nike",
    },
    {
      "productTitle": "Trendy Premium Winter Hoodie",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "521",
      "description": '''Trendy Premium Winter Hoodie


      Fabric: Cotton
      Gsm: 300
      Export quality sewing
      Fashionable & Elegant Design
      Made in: Bangladesh

      Size: M,L,XL
      M - Long-27, Chest-38
      L - Length-28, Chest-40
      XL- Chest – Long-29, Chest-42''',

      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "quantity": 1,
      "category": "Fila",
    },
    {
      "productTitle": "Superhit Exclusive Cotton Katua",
      "size": ["M", "L", "XL", "2XL"],
      "price": "150",
      "description": '''Superhit Exclusive Cotton Katua

১০০% বাস্তব ছবি এক্সক্লুসিভ কটন কাতুয়া,
Fabric: Cotton 
Size measurement:
M - Length 27- Chest 38 🥀
L - Length 28- Chest 40 🥀
XL - Length 29 - Chest 42🥀
XXL- length 30-Chest 44 🥀''',
      "imagePath_1": "assets/images/product/Cotton Katua 1.jpg",
      "imagePath_2": "assets/images/product/Cotton Katua 2.jpg",
      "imagePath_3": "assets/images/product/Cotton Katua 3.jpg",
      "imagePath_4": "assets/images/product/Cotton Katua 4.jpg",
      "quantity": 1,
      "category": "Katua",
      "brand": "Adidas",
    },
    {
      "productTitle": "Unique Design Cotton T-Shirt",
      "size": ["M", "L", "XL", "2XL"],
      "price": "199",
      "description": '''Unique Design Cotton T-Shirt
্টাইলিশ, আরামদায়ক আর ডেইলি আউটিং এর জন্য পারফেক্ট। এই Unique Design T-Shirt আপনার ডে-টু-ডে লাইফে আনবে এক নতুন মাত্রা।
👕 Fabric: 100% Cotton – হালকা, সফট আর বাতাস চলাচল করে এমন  কাপড়, যা গরমে আরামে পরা যায়।
⚖ GSM: 150 (প্রায়) – পারফেক্ট লাইটওয়েট, ডেইলি ইউজের জন্য বেস্ট।
🎨 Print: হাই কোয়ালিটি DTF প্রিন্ট – যা দীর্ঘদিন টিকে থাকে, রঙ ফিকে হয় না।
Available Colors: Black | Navy Blue | Grey | White
Size: M, L, XL, XXL''',
      "imagePath_1": "assets/images/product/Cotton T-Shirt 1.jpg",
      "imagePath_2": "assets/images/product/Cotton T-Shirt 2.jpg",
      "imagePath_3": "assets/images/product/Cotton T-Shirt 3.jpg",
      "imagePath_4": "assets/images/product/Cotton T-Shirt 4.jpg",
      "quantity": 1,
      "category": "T-Shirt",
      "brand": "Nike",
    },
    {
      "productTitle": "Stylish Comfortable Tracksuit",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "451",
      "description": '''Stylish Comfortable Tracksuit

Product: 1 T-Shirt + 1 Trouser
Fabric: Imported Sweat blazer & Chine PP
Size:- M, L, XL

Trouser Measurements:
M=Waist-32, Length-37
L=Waist-35, Length-38
XL=Waist-36, Length-39

T-Shirt Measurements:
M=Chest-36, Length-27
L=Chest-38, Length-28
XL=Chest-40, Length-29 ''',
      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "quantity": 1,
      "category": "Tracksuit",
      "brand": "Adidas",
    },
    {
      "productTitle": "Trendy Premium Winter Hoodie",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "521",
      "description": '''Trendy Premium Winter Hoodie


      Fabric: Cotton
      Gsm: 300
      Export quality sewing
      Fashionable & Elegant Design
      Made in: Bangladesh

      Size: M,L,XL
      M - Long-27, Chest-38
      L - Length-28, Chest-40
      XL- Chest – Long-29, Chest-42''',

      "imagePath_1": "assets/images/product/Winter Hoodie_1.jpg",
      "imagePath_2": "assets/images/product/Winter Hoodie_2.jpg",
      "imagePath_3": "assets/images/product/Winter Hoodie_3.jpg",
      "imagePath_4": "assets/images/product/Winter Hoodie_4.jpg",
      "quantity": 1,

      "category": "Hoodie",
      "brand": "Nike",
    },
    {
      "productTitle": "Superhit Exclusive Cotton Katua",
      "size": ["M", "L", "XL", "2XL"],
      "price": "150",
      "description": '''Superhit Exclusive Cotton Katua

১০০% বাস্তব ছবি এক্সক্লুসিভ কটন কাতুয়া,
Fabric: Cotton 
Size measurement:
M - Length 27- Chest 38 🥀
L - Length 28- Chest 40 🥀
XL - Length 29 - Chest 42🥀
XXL- length 30-Chest 44 🥀''',
      "imagePath_1": "assets/images/product/Cotton Katua 1.jpg",
      "imagePath_2": "assets/images/product/Cotton Katua 2.jpg",
      "imagePath_3": "assets/images/product/Cotton Katua 3.jpg",
      "imagePath_4": "assets/images/product/Cotton Katua 4.jpg",
      "quantity": 1,
      "category": "Kurta",
      "brand": "Fila",
    },
    {
      "productTitle": "Unique Design Cotton T-Shirt",
      "size": ["M", "L", "XL", "2XL"],
      "price": "199",
      "description": '''Unique Design Cotton T-Shirt
্টাইলিশ, আরামদায়ক আর ডেইলি আউটিং এর জন্য পারফেক্ট। এই Unique Design T-Shirt আপনার ডে-টু-ডে লাইফে আনবে এক নতুন মাত্রা।
👕 Fabric: 100% Cotton – হালকা, সফট আর বাতাস চলাচল করে এমন  কাপড়, যা গরমে আরামে পরা যায়।
⚖ GSM: 150 (প্রায়) – পারফেক্ট লাইটওয়েট, ডেইলি ইউজের জন্য বেস্ট।
🎨 Print: হাই কোয়ালিটি DTF প্রিন্ট – যা দীর্ঘদিন টিকে থাকে, রঙ ফিকে হয় না।
Available Colors: Black | Navy Blue | Grey | White
Size: M, L, XL, XXL''',
      "imagePath_1": "assets/images/product/Cotton T-Shirt 1.jpg",
      "imagePath_2": "assets/images/product/Cotton T-Shirt 2.jpg",
      "imagePath_3": "assets/images/product/Cotton T-Shirt 3.jpg",
      "imagePath_4": "assets/images/product/Cotton T-Shirt 4.jpg",
      "quantity": 1,
      "category": "T-Shirt",
      "brand": "Adidas",
    },
    {
      "productTitle": "Stylish Comfortable Tracksuit",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "451",
      "description": '''Stylish Comfortable Tracksuit

Product: 1 T-Shirt + 1 Trouser
Fabric: Imported Sweat blazer & Chine PP
Size:- M, L, XL

Trouser Measurements:
M=Waist-32, Length-37
L=Waist-35, Length-38
XL=Waist-36, Length-39

T-Shirt Measurements:
M=Chest-36, Length-27
L=Chest-38, Length-28
XL=Chest-40, Length-29 ''',
      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "quantity": 1,
      "category": "Tracksuit",
      "brand": "Nike",
    },
    {
      "productTitle": "Trendy Premium Winter Hoodie",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "521",
      "description": '''Trendy Premium Winter Hoodie


      Fabric: Cotton
      Gsm: 300
      Export quality sewing
      Fashionable & Elegant Design
      Made in: Bangladesh

      Size: M,L,XL
      M - Long-27, Chest-38
      L - Length-28, Chest-40
      XL- Chest – Long-29, Chest-42''',

      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "quantity": 1,
      "category": "Fila",
    },
    {
      "productTitle": "Superhit Exclusive Cotton Katua",
      "size": ["M", "L", "XL", "2XL"],
      "price": "150",
      "description": '''Superhit Exclusive Cotton Katua

১০০% বাস্তব ছবি এক্সক্লুসিভ কটন কাতুয়া,
Fabric: Cotton 
Size measurement:
M - Length 27- Chest 38 🥀
L - Length 28- Chest 40 🥀
XL - Length 29 - Chest 42🥀
XXL- length 30-Chest 44 🥀''',
      "imagePath_1": "assets/images/product/Cotton Katua 1.jpg",
      "imagePath_2": "assets/images/product/Cotton Katua 2.jpg",
      "imagePath_3": "assets/images/product/Cotton Katua 3.jpg",
      "imagePath_4": "assets/images/product/Cotton Katua 4.jpg",
      "quantity": 1,
      "category": "Katua",
      "brand": "Adidas",
    },
    {
      "productTitle": "Unique Design Cotton T-Shirt",
      "size": ["M", "L", "XL", "2XL"],
      "price": "199",
      "description": '''Unique Design Cotton T-Shirt
্টাইলিশ, আরামদায়ক আর ডেইলি আউটিং এর জন্য পারফেক্ট। এই Unique Design T-Shirt আপনার ডে-টু-ডে লাইফে আনবে এক নতুন মাত্রা।
👕 Fabric: 100% Cotton – হালকা, সফট আর বাতাস চলাচল করে এমন  কাপড়, যা গরমে আরামে পরা যায়।
⚖ GSM: 150 (প্রায়) – পারফেক্ট লাইটওয়েট, ডেইলি ইউজের জন্য বেস্ট।
🎨 Print: হাই কোয়ালিটি DTF প্রিন্ট – যা দীর্ঘদিন টিকে থাকে, রঙ ফিকে হয় না।
Available Colors: Black | Navy Blue | Grey | White
Size: M, L, XL, XXL''',
      "imagePath_1": "assets/images/product/Cotton T-Shirt 1.jpg",
      "imagePath_2": "assets/images/product/Cotton T-Shirt 2.jpg",
      "imagePath_3": "assets/images/product/Cotton T-Shirt 3.jpg",
      "imagePath_4": "assets/images/product/Cotton T-Shirt 4.jpg",
      "quantity": 1,
      "category": "T-Shirt",
      "brand": "Nike",
    },
    {
      "productTitle": "Stylish Comfortable Tracksuit",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "451",
      "description": '''Stylish Comfortable Tracksuit

Product: 1 T-Shirt + 1 Trouser
Fabric: Imported Sweat blazer & Chine PP
Size:- M, L, XL

Trouser Measurements:
M=Waist-32, Length-37
L=Waist-35, Length-38
XL=Waist-36, Length-39

T-Shirt Measurements:
M=Chest-36, Length-27
L=Chest-38, Length-28
XL=Chest-40, Length-29 ''',
      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "quantity": 1,
      "category": "Tracksuit",
      "brand": "Adidas",
    },
    {
      "productTitle": "Trendy Premium Winter Hoodie",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "521",
      "description": '''Trendy Premium Winter Hoodie


      Fabric: Cotton
      Gsm: 300
      Export quality sewing
      Fashionable & Elegant Design
      Made in: Bangladesh

      Size: M,L,XL
      M - Long-27, Chest-38
      L - Length-28, Chest-40
      XL- Chest – Long-29, Chest-42''',

      "imagePath_1": "assets/images/product/Winter Hoodie_1.jpg",
      "imagePath_2": "assets/images/product/Winter Hoodie_2.jpg",
      "imagePath_3": "assets/images/product/Winter Hoodie_3.jpg",
      "imagePath_4": "assets/images/product/Winter Hoodie_4.jpg",
      "quantity": 1,

      "category": "Hoodie",
      "brand": "Nike",
    },
    {
      "productTitle": "Superhit Exclusive Cotton Katua",
      "size": ["M", "L", "XL", "2XL"],
      "price": "150",
      "description": '''Superhit Exclusive Cotton Katua

১০০% বাস্তব ছবি এক্সক্লুসিভ কটন কাতুয়া,
Fabric: Cotton 
Size measurement:
M - Length 27- Chest 38 🥀
L - Length 28- Chest 40 🥀
XL - Length 29 - Chest 42🥀
XXL- length 30-Chest 44 🥀''',
      "imagePath_1": "assets/images/product/Cotton Katua 1.jpg",
      "imagePath_2": "assets/images/product/Cotton Katua 2.jpg",
      "imagePath_3": "assets/images/product/Cotton Katua 3.jpg",
      "imagePath_4": "assets/images/product/Cotton Katua 4.jpg",
      "quantity": 1,
      "category": "Kurta",
      "brand": "Fila",
    },
    {
      "productTitle": "Unique Design Cotton T-Shirt",
      "size": ["M", "L", "XL", "2XL"],
      "price": "199",
      "description": '''Unique Design Cotton T-Shirt
্টাইলিশ, আরামদায়ক আর ডেইলি আউটিং এর জন্য পারফেক্ট। এই Unique Design T-Shirt আপনার ডে-টু-ডে লাইফে আনবে এক নতুন মাত্রা।
👕 Fabric: 100% Cotton – হালকা, সফট আর বাতাস চলাচল করে এমন  কাপড়, যা গরমে আরামে পরা যায়।
⚖ GSM: 150 (প্রায়) – পারফেক্ট লাইটওয়েট, ডেইলি ইউজের জন্য বেস্ট।
🎨 Print: হাই কোয়ালিটি DTF প্রিন্ট – যা দীর্ঘদিন টিকে থাকে, রঙ ফিকে হয় না।
Available Colors: Black | Navy Blue | Grey | White
Size: M, L, XL, XXL''',
      "imagePath_1": "assets/images/product/Cotton T-Shirt 1.jpg",
      "imagePath_2": "assets/images/product/Cotton T-Shirt 2.jpg",
      "imagePath_3": "assets/images/product/Cotton T-Shirt 3.jpg",
      "imagePath_4": "assets/images/product/Cotton T-Shirt 4.jpg",
      "quantity": 1,
      "category": "T-Shirt",
      "brand": "Adidas",
    },
    {
      "productTitle": "Stylish Comfortable Tracksuit",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "451",
      "description": '''Stylish Comfortable Tracksuit

Product: 1 T-Shirt + 1 Trouser
Fabric: Imported Sweat blazer & Chine PP
Size:- M, L, XL

Trouser Measurements:
M=Waist-32, Length-37
L=Waist-35, Length-38
XL=Waist-36, Length-39

T-Shirt Measurements:
M=Chest-36, Length-27
L=Chest-38, Length-28
XL=Chest-40, Length-29 ''',
      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "quantity": 1,
      "category": "Tracksuit",
      "brand": "Nike",
    },
    {
      "productTitle": "Trendy Premium Winter Hoodie",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "521",
      "description": '''Trendy Premium Winter Hoodie


      Fabric: Cotton
      Gsm: 300
      Export quality sewing
      Fashionable & Elegant Design
      Made in: Bangladesh

      Size: M,L,XL
      M - Long-27, Chest-38
      L - Length-28, Chest-40
      XL- Chest – Long-29, Chest-42''',

      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "quantity": 1,
      "category": "Fila",
    },
    {
      "productTitle": "Superhit Exclusive Cotton Katua",
      "size": ["M", "L", "XL", "2XL"],
      "price": "150",
      "description": '''Superhit Exclusive Cotton Katua

১০০% বাস্তব ছবি এক্সক্লুসিভ কটন কাতুয়া,
Fabric: Cotton 
Size measurement:
M - Length 27- Chest 38 🥀
L - Length 28- Chest 40 🥀
XL - Length 29 - Chest 42🥀
XXL- length 30-Chest 44 🥀''',
      "imagePath_1": "assets/images/product/Cotton Katua 1.jpg",
      "imagePath_2": "assets/images/product/Cotton Katua 2.jpg",
      "imagePath_3": "assets/images/product/Cotton Katua 3.jpg",
      "imagePath_4": "assets/images/product/Cotton Katua 4.jpg",
      "quantity": 1,
      "category": "Katua",
      "brand": "Adidas",
    },
    {
      "productTitle": "Unique Design Cotton T-Shirt",
      "size": ["M", "L", "XL", "2XL"],
      "price": "199",
      "description": '''Unique Design Cotton T-Shirt
্টাইলিশ, আরামদায়ক আর ডেইলি আউটিং এর জন্য পারফেক্ট। এই Unique Design T-Shirt আপনার ডে-টু-ডে লাইফে আনবে এক নতুন মাত্রা।
👕 Fabric: 100% Cotton – হালকা, সফট আর বাতাস চলাচল করে এমন  কাপড়, যা গরমে আরামে পরা যায়।
⚖ GSM: 150 (প্রায়) – পারফেক্ট লাইটওয়েট, ডেইলি ইউজের জন্য বেস্ট।
🎨 Print: হাই কোয়ালিটি DTF প্রিন্ট – যা দীর্ঘদিন টিকে থাকে, রঙ ফিকে হয় না।
Available Colors: Black | Navy Blue | Grey | White
Size: M, L, XL, XXL''',
      "imagePath_1": "assets/images/product/Cotton T-Shirt 1.jpg",
      "imagePath_2": "assets/images/product/Cotton T-Shirt 2.jpg",
      "imagePath_3": "assets/images/product/Cotton T-Shirt 3.jpg",
      "imagePath_4": "assets/images/product/Cotton T-Shirt 4.jpg",
      "quantity": 1,
      "category": "T-Shirt",
      "brand": "Nike",
    },
    {
      "productTitle": "Stylish Comfortable Tracksuit",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "451",
      "description": '''Stylish Comfortable Tracksuit

Product: 1 T-Shirt + 1 Trouser
Fabric: Imported Sweat blazer & Chine PP
Size:- M, L, XL

Trouser Measurements:
M=Waist-32, Length-37
L=Waist-35, Length-38
XL=Waist-36, Length-39

T-Shirt Measurements:
M=Chest-36, Length-27
L=Chest-38, Length-28
XL=Chest-40, Length-29 ''',
      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "quantity": 1,
      "category": "Tracksuit",
      "brand": "Adidas",
    },
    {
      "productTitle": "Trendy Premium Winter Hoodie",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "521",
      "description": '''Trendy Premium Winter Hoodie


      Fabric: Cotton
      Gsm: 300
      Export quality sewing
      Fashionable & Elegant Design
      Made in: Bangladesh

      Size: M,L,XL
      M - Long-27, Chest-38
      L - Length-28, Chest-40
      XL- Chest – Long-29, Chest-42''',

      "imagePath_1": "assets/images/product/Winter Hoodie_1.jpg",
      "imagePath_2": "assets/images/product/Winter Hoodie_2.jpg",
      "imagePath_3": "assets/images/product/Winter Hoodie_3.jpg",
      "imagePath_4": "assets/images/product/Winter Hoodie_4.jpg",
      "quantity": 1,

      "category": "Hoodie",
      "brand": "Nike",
    },
    {
      "productTitle": "Superhit Exclusive Cotton Katua",
      "size": ["M", "L", "XL", "2XL"],
      "price": "150",
      "description": '''Superhit Exclusive Cotton Katua

১০০% বাস্তব ছবি এক্সক্লুসিভ কটন কাতুয়া,
Fabric: Cotton 
Size measurement:
M - Length 27- Chest 38 🥀
L - Length 28- Chest 40 🥀
XL - Length 29 - Chest 42🥀
XXL- length 30-Chest 44 🥀''',
      "imagePath_1": "assets/images/product/Cotton Katua 1.jpg",
      "imagePath_2": "assets/images/product/Cotton Katua 2.jpg",
      "imagePath_3": "assets/images/product/Cotton Katua 3.jpg",
      "imagePath_4": "assets/images/product/Cotton Katua 4.jpg",
      "quantity": 1,
      "category": "Kurta",
      "brand": "Fila",
    },
    {
      "productTitle": "Unique Design Cotton T-Shirt",
      "size": ["M", "L", "XL", "2XL"],
      "price": "199",
      "description": '''Unique Design Cotton T-Shirt
্টাইলিশ, আরামদায়ক আর ডেইলি আউটিং এর জন্য পারফেক্ট। এই Unique Design T-Shirt আপনার ডে-টু-ডে লাইফে আনবে এক নতুন মাত্রা।
👕 Fabric: 100% Cotton – হালকা, সফট আর বাতাস চলাচল করে এমন  কাপড়, যা গরমে আরামে পরা যায়।
⚖ GSM: 150 (প্রায়) – পারফেক্ট লাইটওয়েট, ডেইলি ইউজের জন্য বেস্ট।
🎨 Print: হাই কোয়ালিটি DTF প্রিন্ট – যা দীর্ঘদিন টিকে থাকে, রঙ ফিকে হয় না।
Available Colors: Black | Navy Blue | Grey | White
Size: M, L, XL, XXL''',
      "imagePath_1": "assets/images/product/Cotton T-Shirt 1.jpg",
      "imagePath_2": "assets/images/product/Cotton T-Shirt 2.jpg",
      "imagePath_3": "assets/images/product/Cotton T-Shirt 3.jpg",
      "imagePath_4": "assets/images/product/Cotton T-Shirt 4.jpg",
      "quantity": 1,
      "category": "T-Shirt",
      "brand": "Adidas",
    },
    {
      "productTitle": "Stylish Comfortable Tracksuit",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "451",
      "description": '''Stylish Comfortable Tracksuit

Product: 1 T-Shirt + 1 Trouser
Fabric: Imported Sweat blazer & Chine PP
Size:- M, L, XL

Trouser Measurements:
M=Waist-32, Length-37
L=Waist-35, Length-38
XL=Waist-36, Length-39

T-Shirt Measurements:
M=Chest-36, Length-27
L=Chest-38, Length-28
XL=Chest-40, Length-29 ''',
      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "quantity": 1,
      "category": "Tracksuit",
      "brand": "Nike",
    },
    {
      "productTitle": "Trendy Premium Winter Hoodie",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "521",
      "description": '''Trendy Premium Winter Hoodie


      Fabric: Cotton
      Gsm: 300
      Export quality sewing
      Fashionable & Elegant Design
      Made in: Bangladesh

      Size: M,L,XL
      M - Long-27, Chest-38
      L - Length-28, Chest-40
      XL- Chest – Long-29, Chest-42''',

      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "quantity": 1,
      "category": "Fila",
    },
    {
      "productTitle": "Superhit Exclusive Cotton Katua",
      "size": ["M", "L", "XL", "2XL"],
      "price": "150",
      "description": '''Superhit Exclusive Cotton Katua

১০০% বাস্তব ছবি এক্সক্লুসিভ কটন কাতুয়া,
Fabric: Cotton 
Size measurement:
M - Length 27- Chest 38 🥀
L - Length 28- Chest 40 🥀
XL - Length 29 - Chest 42🥀
XXL- length 30-Chest 44 🥀''',
      "imagePath_1": "assets/images/product/Cotton Katua 1.jpg",
      "imagePath_2": "assets/images/product/Cotton Katua 2.jpg",
      "imagePath_3": "assets/images/product/Cotton Katua 3.jpg",
      "imagePath_4": "assets/images/product/Cotton Katua 4.jpg",
      "quantity": 1,
      "category": "Katua",
      "brand": "Adidas",
    },
    {
      "productTitle": "Unique Design Cotton T-Shirt",
      "size": ["M", "L", "XL", "2XL"],
      "price": "199",
      "description": '''Unique Design Cotton T-Shirt
্টাইলিশ, আরামদায়ক আর ডেইলি আউটিং এর জন্য পারফেক্ট। এই Unique Design T-Shirt আপনার ডে-টু-ডে লাইফে আনবে এক নতুন মাত্রা।
👕 Fabric: 100% Cotton – হালকা, সফট আর বাতাস চলাচল করে এমন  কাপড়, যা গরমে আরামে পরা যায়।
⚖ GSM: 150 (প্রায়) – পারফেক্ট লাইটওয়েট, ডেইলি ইউজের জন্য বেস্ট।
🎨 Print: হাই কোয়ালিটি DTF প্রিন্ট – যা দীর্ঘদিন টিকে থাকে, রঙ ফিকে হয় না।
Available Colors: Black | Navy Blue | Grey | White
Size: M, L, XL, XXL''',
      "imagePath_1": "assets/images/product/Cotton T-Shirt 1.jpg",
      "imagePath_2": "assets/images/product/Cotton T-Shirt 2.jpg",
      "imagePath_3": "assets/images/product/Cotton T-Shirt 3.jpg",
      "imagePath_4": "assets/images/product/Cotton T-Shirt 4.jpg",
      "quantity": 1,
      "category": "T-Shirt",
      "brand": "Nike",
    },
    {
      "productTitle": "Stylish Comfortable Tracksuit",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "451",
      "description": '''Stylish Comfortable Tracksuit

Product: 1 T-Shirt + 1 Trouser
Fabric: Imported Sweat blazer & Chine PP
Size:- M, L, XL

Trouser Measurements:
M=Waist-32, Length-37
L=Waist-35, Length-38
XL=Waist-36, Length-39

T-Shirt Measurements:
M=Chest-36, Length-27
L=Chest-38, Length-28
XL=Chest-40, Length-29 ''',
      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "quantity": 1,
      "category": "Tracksuit",
      "brand": "Adidas",
    },
    {
      "productTitle": "Trendy Premium Winter Hoodie",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "521",
      "description": '''Trendy Premium Winter Hoodie


      Fabric: Cotton
      Gsm: 300
      Export quality sewing
      Fashionable & Elegant Design
      Made in: Bangladesh

      Size: M,L,XL
      M - Long-27, Chest-38
      L - Length-28, Chest-40
      XL- Chest – Long-29, Chest-42''',

      "imagePath_1": "assets/images/product/Winter Hoodie_1.jpg",
      "imagePath_2": "assets/images/product/Winter Hoodie_2.jpg",
      "imagePath_3": "assets/images/product/Winter Hoodie_3.jpg",
      "imagePath_4": "assets/images/product/Winter Hoodie_4.jpg",
      "quantity": 1,

      "category": "Hoodie",
      "brand": "Nike",
    },
    {
      "productTitle": "Superhit Exclusive Cotton Katua",
      "size": ["M", "L", "XL", "2XL"],
      "price": "150",
      "description": '''Superhit Exclusive Cotton Katua

১০০% বাস্তব ছবি এক্সক্লুসিভ কটন কাতুয়া,
Fabric: Cotton 
Size measurement:
M - Length 27- Chest 38 🥀
L - Length 28- Chest 40 🥀
XL - Length 29 - Chest 42🥀
XXL- length 30-Chest 44 🥀''',
      "imagePath_1": "assets/images/product/Cotton Katua 1.jpg",
      "imagePath_2": "assets/images/product/Cotton Katua 2.jpg",
      "imagePath_3": "assets/images/product/Cotton Katua 3.jpg",
      "imagePath_4": "assets/images/product/Cotton Katua 4.jpg",
      "quantity": 1,
      "category": "Kurta",
      "brand": "Fila",
    },
    {
      "productTitle": "Unique Design Cotton T-Shirt",
      "size": ["M", "L", "XL", "2XL"],
      "price": "199",
      "description": '''Unique Design Cotton T-Shirt
্টাইলিশ, আরামদায়ক আর ডেইলি আউটিং এর জন্য পারফেক্ট। এই Unique Design T-Shirt আপনার ডে-টু-ডে লাইফে আনবে এক নতুন মাত্রা।
👕 Fabric: 100% Cotton – হালকা, সফট আর বাতাস চলাচল করে এমন  কাপড়, যা গরমে আরামে পরা যায়।
⚖ GSM: 150 (প্রায়) – পারফেক্ট লাইটওয়েট, ডেইলি ইউজের জন্য বেস্ট।
🎨 Print: হাই কোয়ালিটি DTF প্রিন্ট – যা দীর্ঘদিন টিকে থাকে, রঙ ফিকে হয় না।
Available Colors: Black | Navy Blue | Grey | White
Size: M, L, XL, XXL''',
      "imagePath_1": "assets/images/product/Cotton T-Shirt 1.jpg",
      "imagePath_2": "assets/images/product/Cotton T-Shirt 2.jpg",
      "imagePath_3": "assets/images/product/Cotton T-Shirt 3.jpg",
      "imagePath_4": "assets/images/product/Cotton T-Shirt 4.jpg",
      "quantity": 1,
      "category": "T-Shirt",
      "brand": "Adidas",
    },
    {
      "productTitle": "Stylish Comfortable Tracksuit",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "451",
      "description": '''Stylish Comfortable Tracksuit

Product: 1 T-Shirt + 1 Trouser
Fabric: Imported Sweat blazer & Chine PP
Size:- M, L, XL

Trouser Measurements:
M=Waist-32, Length-37
L=Waist-35, Length-38
XL=Waist-36, Length-39

T-Shirt Measurements:
M=Chest-36, Length-27
L=Chest-38, Length-28
XL=Chest-40, Length-29 ''',
      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "quantity": 1,
      "category": "Tracksuit",
      "brand": "Nike",
    },
    {
      "productTitle": "Trendy Premium Winter Hoodie",
      "size": ["S", "M", "L", "XL", "2XL"],
      "price": "521",
      "description": '''Trendy Premium Winter Hoodie


      Fabric: Cotton
      Gsm: 300
      Export quality sewing
      Fashionable & Elegant Design
      Made in: Bangladesh

      Size: M,L,XL
      M - Long-27, Chest-38
      L - Length-28, Chest-40
      XL- Chest – Long-29, Chest-42''',

      "imagePath_1": "assets/images/product/Tracksuit_1.jpg",
      "imagePath_2": "assets/images/product/Tracksuit_2.jpg",
      "imagePath_3": "assets/images/product/Tracksuit_3.jpg",
      "imagePath_4": "assets/images/product/Tracksuit_4.jpg",
      "quantity": 1,
      "category": "Fila",
    },
    {
      "productTitle": "Superhit Exclusive Cotton Katua",
      "size": ["M", "L", "XL", "2XL"],
      "price": "150",
      "description": '''Superhit Exclusive Cotton Katua

১০০% বাস্তব ছবি এক্সক্লুসিভ কটন কাতুয়া,
Fabric: Cotton 
Size measurement:
M - Length 27- Chest 38 🥀
L - Length 28- Chest 40 🥀
XL - Length 29 - Chest 42🥀
XXL- length 30-Chest 44 🥀''',
      "imagePath_1": "assets/images/product/Cotton Katua 1.jpg",
      "imagePath_2": "assets/images/product/Cotton Katua 2.jpg",
      "imagePath_3": "assets/images/product/Cotton Katua 3.jpg",
      "imagePath_4": "assets/images/product/Cotton Katua 4.jpg",
      "quantity": 1,
      "category": "Katua",
      "brand": "Adidas",
    },
    {
      "productTitle": "Unique Design Cotton T-Shirt",
      "size": ["M", "L", "XL", "2XL"],
      "price": "199",
      "description": '''Unique Design Cotton T-Shirt
্টাইলিশ, আরামদায়ক আর ডেইলি আউটিং এর জন্য পারফেক্ট। এই Unique Design T-Shirt আপনার ডে-টু-ডে লাইফে আনবে এক নতুন মাত্রা।
👕 Fabric: 100% Cotton – হালকা, সফট আর বাতাস চলাচল করে এমন  কাপড়, যা গরমে আরামে পরা যায়।
⚖ GSM: 150 (প্রায়) – পারফেক্ট লাইটওয়েট, ডেইলি ইউজের জন্য বেস্ট।
🎨 Print: হাই কোয়ালিটি DTF প্রিন্ট – যা দীর্ঘদিন টিকে থাকে, রঙ ফিকে হয় না।
Available Colors: Black | Navy Blue | Grey | White
Size: M, L, XL, XXL''',
      "imagePath_1": "assets/images/product/Cotton T-Shirt 1.jpg",
      "imagePath_2": "assets/images/product/Cotton T-Shirt 2.jpg",
      "imagePath_3": "assets/images/product/Cotton T-Shirt 3.jpg",
      "imagePath_4": "assets/images/product/Cotton T-Shirt 4.jpg",
      "quantity": 1,
      "category": "T-Shirt",
      "brand": "Nike",
    },
  ].obs;

  RxList favouriteProducts = [].obs;

  RxBool isClicked = false.obs;
  final searchController = TextEditingController();

  void toggleFavourite(product) {
    if (favouriteProducts.contains(product)) {
      favouriteProducts.remove(product);
    } else {
      favouriteProducts.add(product);
    }
  }

  ///<================review page =================>///
  final RxList<Map<String, dynamic>> reviews = <Map<String, dynamic>>[
    {
      "name": "Jenny Wilson",
      "date": "13 Sep, 2020",
      "rating": 5,
      "review":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...",
      "image": "assets/images/person_1.png",
    },
    {
      "name": "Jenny Wilson",
      "date": "13 Sep, 2020",
      "rating": 3.5,
      "review":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...",
      "image": "assets/images/person_2.png",
    },
    {
      "name": "Jenny Wilson",
      "date": "13 Sep, 2020",
      "rating": 5,
      "review":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...",
      "image": "assets/images/person_3.png",
    },
    {
      "name": "Jenny Wilson",
      "date": "13 Sep, 2020",
      "rating": 4.8,
      "review":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...",
      "image": "assets/images/person_1.png",
    },
    {
      "name": "Jenny Wilson",
      "date": "13 Sep, 2020",
      "rating": 4.8,
      "review":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...",
      "image": "assets/images/person_2.png",
    },
  ].obs;
   averageRating() {
    if (reviews.isEmpty) {
      return 0.0;
    }
    final sum = reviews.map((r) => r['rating'] as num).reduce((a, b) => a + b);
    final average = sum / reviews.length;
    return double.parse(average.toStringAsFixed(1));
  }

  ///<================Add review page =================>///
  final TextEditingController nameController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  RxDouble rating = 2.5.obs;
}
