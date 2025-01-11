import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:t2305m_mcv/screen/cart/cart_screen.dart';
import 'package:t2305m_mcv/screen/home/home_screen.dart';
import 'package:t2305m_mcv/screen/profile/profile_screen.dart';
import 'package:t2305m_mcv/screen/search/search_screen.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  // Danh sách các màn hình
  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  // Chỉ số màn hình được chọn
  int _selectedIndex = 0;

  // Biến kiểm soát trạng thái hiển thị menu
  bool isMenuVisible = false;

  // Hàm thay đổi màn hình
  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
      isMenuVisible = false; // Ẩn menu khi đổi màn hình
    });
  }

  // Hàm hiển thị modal tìm kiếm
  void _showSearchModal() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Search",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter search keyword",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print("Search initiated");
                  },
                  child: Text("Search"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Thanh AppBar
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Căn về bên trái
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Baby",
                    style: TextStyle(
                      color: Color(0xFFFF4880), // Màu #ff4880
                      fontSize: 30.0,  // Tăng kích thước chữ
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "Care",
                    style: TextStyle(
                      color: Color(0xFF4D65F9), // Màu #4d65f9
                      fontSize: 30.0,  // Tăng kích thước chữ
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        backgroundColor: Colors.pink[100],
        actions: [
          // Biểu tượng thông báo
          IconButton(
            icon: FaIcon(FontAwesomeIcons.bell, color: Colors.blue),
            onPressed: () {
              print("Notification icon clicked");
              // Thêm hành động khi nhấn vào biểu tượng thông báo
            },
          ),
        ],
      ),

      // Nội dung màn hình
      body: Column(
        children: [
          // Hiển thị nội dung chính của màn hình
          Expanded(
            child: screens[_selectedIndex],
          ),
        ],
      ),

      // Thanh BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Profile",
          ),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black87,
        currentIndex: _selectedIndex,
        onTap: changeScreen,
      ),
    );
  }
}
