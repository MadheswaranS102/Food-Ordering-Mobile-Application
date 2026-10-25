import 'package:flutter/material.dart';

void main() {
  runApp(const VirundhagamApp());
}

// ============================================================
// COLORS
// ============================================================

const Color purple = Color(0xFF5B2C83);
const Color lightPurple = Color(0xFFF2EAF7);
const Color homeBackground = Color(0xFFF7F2F9);

// ============================================================
// IMAGES
// ============================================================

const String logoUrl =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEoIzLQE9d_9pAuPoLlcda7_1twU_KGJjDN7DBRrdW_A&s=10";

const String profileImageUrl =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8bi3g65ow9-LFsW-AHdumdnFFY-zCgUXuIF11uDRAgZC9qWD2_YzyM-c&s";

const String mealsImage =
    "https://images.unsplash.com/photo-1546833999-b9f581a1996d?auto=format&fit=crop&w=600&q=85";

const String idliImage =
    "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?auto=format&fit=crop&w=600&q=85";

// VERIFIED MASALA DOSA IMAGE
const String dosaImage =
    "https://images.unsplash.com/photo-1743615467363-250466982515?auto=format&fit=crop&w=700&q=85";

// PONGAL IMAGE
const String pongalImage =
    "https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=700&q=85";

// PAROTTA IMAGE
const String parottaImage =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWBI7uLQUgJZTjWwtBng5XxAkDd_if19xRE9KT6-74pw&s";

// VADA IMAGE
const String vadaImage =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfbg5APszUT6fE_9XnB3kDkF8-uMbJYW79nVKHWFRucQ&s";

// VERIFIED BIRYANI IMAGE
const String biryaniImage =
    "https://images.unsplash.com/photo-1705174299330-939dd03cc864?auto=format&fit=crop&w=700&q=85";

const String coffeeImage =
    "https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?auto=format&fit=crop&w=600&q=85";

// ============================================================
// APP
// ============================================================

class VirundhagamApp extends StatelessWidget {
  const VirundhagamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Virundhagam",
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: homeBackground,
        colorScheme: ColorScheme.fromSeed(seedColor: purple),
      ),
      home: const LoginPage(),
    );
  }
}

// ============================================================
// COMMON IMAGE WIDGET - CIRCLE
// ============================================================

class CircleFoodImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final VoidCallback? onTap;

  const CircleFoodImage({
    super.key,
    required this.imageUrl,
    this.size = 80,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final image = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: lightPurple, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return Container(
              color: lightPurple,
              child: const Icon(Icons.restaurant, color: purple, size: 32),
            );
          },
        ),
      ),
    );

    if (onTap == null) {
      return image;
    }

    return GestureDetector(onTap: onTap, child: image);
  }
}

// ============================================================
// CENTER IMAGE DIALOG
// ============================================================

void showFoodImageDialog(BuildContext context, FoodItem food) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 12, 22, 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                  },
                  icon: const Icon(Icons.close, color: Colors.grey, size: 28),
                ),
              ),

              CircleFoodImage(imageUrl: food.imageUrl, size: 190),

              const SizedBox(height: 18),

              Text(
                food.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: purple,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                food.description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),

              const SizedBox(height: 10),

              Text(
                "₹${food.price.toStringAsFixed(0)}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: purple,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: 130,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purple,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("CLOSE"),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// ============================================================
// LOGO
// ============================================================

class CircularLogo extends StatelessWidget {
  final double size;

  const CircularLogo({super.key, this.size = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: purple, width: 2.5),
      ),
      child: ClipOval(
        child: Image.network(
          logoUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return const ColoredBox(
              color: lightPurple,
              child: Icon(Icons.restaurant, color: purple, size: 35),
            );
          },
        ),
      ),
    );
  }
}

// ============================================================
// APP BAR LOGO
// ============================================================

class VirundhagamAppBarTitle extends StatelessWidget {
  const VirundhagamAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1.5),
          ),
          child: ClipOval(
            child: Image.network(
              logoUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return const ColoredBox(
                  color: lightPurple,
                  child: Icon(Icons.restaurant, color: purple, size: 22),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 9),
        const Text(
          "VIRUNDHAGAM",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// LOGIN PAGE
// ============================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;

  void login() {
    if (usernameController.text.trim() == "madhes" &&
        passwordController.text == "123") {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 65),
                SizedBox(height: 12),
                Text(
                  "Login Successful!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: purple,
                  ),
                ),
                SizedBox(height: 6),
                Text("Welcome to Virundhagam", textAlign: TextAlign.center),
              ],
            ),
          );
        },
      );

      Future.delayed(const Duration(milliseconds: 1200), () {
        if (!mounted) return;

        Navigator.of(context).pop();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const FoodHomePage()),
        );
      });
    } else {
      showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Row(
              children: [
                Icon(Icons.error_outline, color: Colors.red),
                SizedBox(width: 8),
                Text("Login Failed"),
              ],
            ),
            content: const Text(
              "Invalid username or password.",
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
                child: const Text("OK", style: TextStyle(color: purple)),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF0E5F5), Colors.white],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const CircularLogo(size: 135),

                  const SizedBox(height: 15),

                  const Text(
                    "VIRUNDHAGAM",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 3,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Traditional Tamil Food",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 28),

                  Container(
                    width: 380,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.10),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: const BoxDecoration(
                            color: lightPurple,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.lock_outline,
                            color: purple,
                            size: 28,
                          ),
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: purple,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          "Login to continue",
                          style: TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 25),

                        TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            labelText: "Username",
                            prefixIcon: const Icon(
                              Icons.person_outline,
                              color: purple,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF8F5FA),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        TextField(
                          controller: passwordController,
                          obscureText: hidePassword,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: purple,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: Icon(
                                hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF8F5FA),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: purple,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  const Text(
                    "Tradition • Taste • Tamil Culture",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// FOOD MODEL
// ============================================================

class FoodItem {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  FoodItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

// ============================================================
// FOOD DATA
// ============================================================

final List<FoodItem> foods = [
  FoodItem(
    name: "South Indian Meals",
    description: "Traditional rice meals with side dishes",
    price: 120,
    imageUrl: mealsImage,
  ),
  FoodItem(
    name: "Idli & Sambar",
    description: "Soft idli served with hot sambar",
    price: 60,
    imageUrl: idliImage,
  ),
  FoodItem(
    name: "Masala Dosa",
    description: "Crispy dosa with potato masala",
    price: 80,
    imageUrl: dosaImage,
  ),
  FoodItem(
    name: "Samosa",
    description: "Traditional South Indian breakfast",
    price: 30,
    imageUrl: pongalImage,
  ),
  FoodItem(
    name: "Parotta",
    description: "Soft layered parotta with curry",
    price: 90,
    imageUrl: parottaImage,
  ),
  FoodItem(
    name: "Vada",
    description: "Crispy traditional South Indian vada",
    price: 40,
    imageUrl: vadaImage,
  ),
  FoodItem(
    name: "Biryani",
    description: "Aromatic and flavorful biryani",
    price: 150,
    imageUrl: biryaniImage,
  ),
  FoodItem(
    name: "Filter Coffee",
    description: "Traditional South Indian filter coffee",
    price: 35,
    imageUrl: coffeeImage,
  ),
];

// ============================================================
// MAIN FOOD HOME
// ============================================================

class FoodHomePage extends StatefulWidget {
  const FoodHomePage({super.key});

  @override
  State<FoodHomePage> createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  int selectedIndex = 0;

  FoodItem? selectedOrderFood;

  final List<FoodItem> favorites = [];
  final Map<String, int> favoriteQuantity = {};

  final List<FoodItem> orders = [];
  final Map<String, int> orderQuantity = {};

  String pageTitle() {
    switch (selectedIndex) {
      case 0:
        return "Virundhagam";
      case 1:
        return "My Orders";
      case 2:
        return "Favourites";
      case 3:
        return "My Profile";
      case 4:
        return "Order Details";
      case 5:
        return "Help & Support";
      case 6:
        return "Settings";
      case 7:
        return "About";
      case 8:
        return "Food Order";
      case 9:
        return "Offers";
      case 10:
        return "Contact Us";
      default:
        return "Virundhagam";
    }
  }

  // ==========================================================
  // DRAWER NAVIGATION
  // ==========================================================

  void drawerNavigate(int index) {
    Navigator.pop(context);

    setState(() {
      selectedIndex = index;

      if (index != 4) {
        selectedOrderFood = null;
      }
    });
  }

  // ==========================================================
  // LOGOUT
  // ==========================================================

  void logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  // ==========================================================
  // FOOD CHOICE
  // ==========================================================

  void showFoodChoice(FoodItem food) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleFoodImage(
                imageUrl: food.imageUrl,
                size: 150,
                onTap: () {
                  Navigator.pop(sheetContext);
                  showFoodImageDialog(context, food);
                },
              ),

              const SizedBox(height: 15),

              Text(
                food.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                food.description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 8),

              Text(
                "₹${food.price.toStringAsFixed(0)}",
                style: const TextStyle(
                  color: purple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(sheetContext);
                        addFavorite(food);
                      },
                      icon: const Icon(Icons.favorite_border, color: purple),
                      label: const Text(
                        "Favourite",
                        style: TextStyle(color: purple),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(sheetContext);
                        startOrder(food);
                      },
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text("Order"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: purple,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  // ==========================================================
  // ADD FAVOURITE
  // ==========================================================

  void addFavorite(FoodItem food) {
    setState(() {
      if (!favorites.contains(food)) {
        favorites.add(food);
        favoriteQuantity[food.name] = 1;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${food.name} added to favourites"),
        backgroundColor: purple,
      ),
    );
  }

  // ==========================================================
  // START ORDER
  // ==========================================================

  void startOrder(FoodItem food) {
    setState(() {
      selectedOrderFood = food;
      selectedIndex = 4;

      orderQuantity[food.name] = orderQuantity[food.name] ?? 1;
    });
  }

  // ==========================================================
  // PLACE SINGLE ORDER
  // ==========================================================

  void placeSingleOrder() {
    if (selectedOrderFood == null) return;

    final food = selectedOrderFood!;
    final quantity = orderQuantity[food.name] ?? 1;

    setState(() {
      if (!orders.contains(food)) {
        orders.add(food);
      }

      orderQuantity[food.name] = quantity;
    });

    showOrderSuccess();
  }

  // ==========================================================
  // PLACE ALL ORDERS
  // ==========================================================

  void placeAllOrders() {
    if (orders.isEmpty) {
      for (final food in favorites) {
        orders.add(food);
        orderQuantity[food.name] = favoriteQuantity[food.name] ?? 1;
      }
    }

    showOrderSuccess();
  }

  // ==========================================================
  // REMOVE FAVOURITE
  // ==========================================================

  void removeFavorite(FoodItem food) {
    setState(() {
      favorites.remove(food);
      favoriteQuantity.remove(food.name);
    });
  }

  // ==========================================================
  // SUCCESS
  // ==========================================================

  void showOrderSuccess() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 70),

              const SizedBox(height: 12),

              const Text(
                "Order Placed!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: purple,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Your food order has been placed successfully.",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(dialogContext);

                  setState(() {
                    selectedIndex = 1;
                    selectedOrderFood = null;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: purple,
                  foregroundColor: Colors.white,
                ),
                child: const Text("VIEW ORDERS"),
              ),
            ],
          ),
        );
      },
    );
  }

  // ==========================================================
  // CURRENT PAGE
  // ==========================================================

  Widget currentPage() {
    switch (selectedIndex) {
      case 0:
        return HomeContent(foods: foods, onFoodPressed: showFoodChoice);

      case 1:
        return OrdersPage(
          orders: orders,
          quantities: orderQuantity,
          onQuantityChanged: (food, value) {
            setState(() {
              orderQuantity[food.name] = value;
            });
          },
          onImagePressed: (food) {
            showFoodImageDialog(context, food);
          },
        );

      case 2:
        return FavoritesPage(
          favorites: favorites,
          quantities: favoriteQuantity,
          onRemove: removeFavorite,
          onOrderAll: placeAllOrders,
          onQuantityChanged: (food, value) {
            setState(() {
              favoriteQuantity[food.name] = value;
            });
          },
          onImagePressed: (food) {
            showFoodImageDialog(context, food);
          },
        );

      case 3:
        return const ProfilePage();

      case 4:
        return OrderDetailPage(
          food: selectedOrderFood,
          quantity: selectedOrderFood == null
              ? 1
              : orderQuantity[selectedOrderFood!.name] ?? 1,
          onQuantityChanged: (value) {
            if (selectedOrderFood != null) {
              setState(() {
                orderQuantity[selectedOrderFood!.name] = value;
              });
            }
          },
          onOrder: placeSingleOrder,
        );

      case 5:
        return const HelpSupportPage();

      case 6:
        return const SettingsPage();

      case 7:
        return const AboutPage();

      case 8:
        return FoodOrderPage(foods: foods, onFoodPressed: showFoodChoice);

      case 9:
        return const OffersPage();

      case 10:
        return const ContactPage();

      default:
        return HomeContent(foods: foods, onFoodPressed: showFoodChoice);
    }
  }

  // ==========================================================
  // DRAWER
  // ==========================================================

  Widget buildDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 225,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [purple, Color(0xFF713B99)],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularLogo(size: 100),

                const SizedBox(height: 10),

                const Text(
                  "VIRUNDHAGAM",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  "Traditional Tamil Food",
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          drawerItem(Icons.home_outlined, "Home", 0),

          drawerItem(Icons.restaurant_menu, "Food Order", 8),

          drawerItem(Icons.receipt_long_outlined, "My Orders", 1),

          drawerItem(Icons.favorite_border, "Favourites", 2),

          drawerItem(Icons.person_outline, "My Profile", 3),

          drawerItem(Icons.local_offer_outlined, "Offers", 9),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Divider(),
          ),

          drawerItem(Icons.help_outline, "Help & Support", 5),

          drawerItem(Icons.contact_support_outlined, "Contact Us", 10),

          drawerItem(Icons.settings_outlined, "Settings", 6),

          drawerItem(Icons.info_outline, "About", 7),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Divider(),
          ),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
            ),
            onTap: logout,
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget drawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: Icon(icon, color: purple),
      onTap: () => drawerNavigate(index),
    );
  }

  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    final bool showMainAppBar = selectedIndex == 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: purple,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: showMainAppBar
            ? const VirundhagamAppBarTitle()
            : Text(
                pageTitle(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
        leading: selectedIndex == 0
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    selectedIndex = 0;
                    selectedOrderFood = null;
                  });
                },
              ),
      ),

      drawer: buildDrawer(),

      body: currentPage(),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex >= 4 ? 0 : selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: lightPurple,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
            selectedOrderFood = null;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: purple),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long, color: purple),
            label: "Orders",
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite, color: purple),
            label: "Favourites",
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: purple),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HOME CONTENT
// ============================================================

class HomeContent extends StatelessWidget {
  final List<FoodItem> foods;
  final Function(FoodItem) onFoodPressed;

  const HomeContent({
    super.key,
    required this.foods,
    required this.onFoodPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: homeBackground,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 16, 15, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==================================================
            // CENTERED QUOTE WITH MINIMUM WIDTH
            // ==================================================

            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 230),
                child: Container(
                  alignment: Alignment.center,
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "“அன்புடன் பரிமாறும் உணவு,”",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: purple,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),

                      SizedBox(height: 1),

                      Text(
                        "மனதை என்றும் நிறைக்கும்.”",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: purple,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),

                      SizedBox(height: 3),

                      Text(
                        "Taste tradition. Feel the warmth.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 9),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Welcome to Virundhagam 🍽️",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: purple,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Discover delicious traditional Tamil food.",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 18),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Popular Foods",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: purple,
                  ),
                ),

                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      color: purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            ListView.builder(
              itemCount: foods.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final food = foods[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.06),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(17),
                    onTap: () => onFoodPressed(food),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CircleFoodImage(imageUrl: food.imageUrl, size: 78),

                          const SizedBox(width: 13),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  food.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  food.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Text(
                                  "₹${food.price.toStringAsFixed(0)}",
                                  style: const TextStyle(
                                    color: purple,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 8),

                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: purple,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 15),

            // ==================================================
            // TASTE TAMIL TRADITION - CENTERED
            // ==================================================
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 230),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: lightPurple,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.restaurant_menu, color: purple, size: 35),

                      SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Taste Tamil Tradition",
                              style: TextStyle(
                                color: purple,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text(
                              "Fresh, traditional and delicious food made for you.",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// FOOD ORDER PAGE
// ============================================================

class FoodOrderPage extends StatelessWidget {
  final List<FoodItem> foods;
  final Function(FoodItem) onFoodPressed;

  const FoodOrderPage({
    super.key,
    required this.foods,
    required this.onFoodPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: homeBackground,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [purple, Color(0xFF713B99)],
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Food Order",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    "Choose your favourite traditional Tamil food",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Available Foods",
              style: TextStyle(
                color: purple,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            ListView.builder(
              itemCount: foods.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final food = foods[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 13),
                  elevation: 2,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(17),
                    onTap: () => onFoodPressed(food),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          CircleFoodImage(imageUrl: food.imageUrl, size: 82),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  food.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  food.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  "₹${food.price.toStringAsFixed(0)}",
                                  style: const TextStyle(
                                    color: purple,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 8),

                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: purple,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// ORDERS PAGE
// ============================================================

class OrdersPage extends StatelessWidget {
  final List<FoodItem> orders;
  final Map<String, int> quantities;
  final Function(FoodItem, int) onQuantityChanged;
  final Function(FoodItem) onImagePressed;

  const OrdersPage({
    super.key,
    required this.orders,
    required this.quantities,
    required this.onQuantityChanged,
    required this.onImagePressed,
  });

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return Container(
        color: homeBackground,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.receipt_long, color: purple, size: 70),

              SizedBox(height: 12),

              Text(
                "No orders yet",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 5),

              Text(
                "Your placed orders will appear here.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    double grandTotal = 0;

    for (final food in orders) {
      grandTotal += food.price * (quantities[food.name] ?? 1);
    }

    return Container(
      color: homeBackground,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
              children: [
                const Text(
                  "My Orders",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: purple,
                  ),
                ),

                const SizedBox(height: 15),

                ...orders.map((food) {
                  final quantity = quantities[food.name] ?? 1;

                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Row(
                        children: [
                          CircleFoodImage(
                            imageUrl: food.imageUrl,
                            size: 76,
                            onTap: () => onImagePressed(food),
                          ),

                          const SizedBox(width: 13),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  food.name,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  food.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  "₹${food.price.toStringAsFixed(0)} per item",
                                  style: const TextStyle(
                                    color: purple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: lightPurple,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        "Qty",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(width: 10),

                                      GestureDetector(
                                        onTap: quantity > 1
                                            ? () => onQuantityChanged(
                                                food,
                                                quantity - 1,
                                              )
                                            : null,
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: quantity > 1
                                                ? Colors.white
                                                : Colors.white54,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                            size: 17,
                                            color: quantity > 1
                                                ? purple
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 13,
                                        ),
                                        child: Text(
                                          "$quantity",
                                          style: const TextStyle(
                                            color: purple,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap: () => onQuantityChanged(
                                          food,
                                          quantity + 1,
                                        ),
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            size: 17,
                                            color: purple,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(18, 12, 18, 14),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Grand Total",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),

                const SizedBox(height: 2),

                Text(
                  "₹${grandTotal.toStringAsFixed(0)}",
                  style: const TextStyle(
                    color: purple,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: 180,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text(
                      "ORDER ALL",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// FAVOURITES PAGE
// ============================================================

class FavoritesPage extends StatelessWidget {
  final List<FoodItem> favorites;
  final Map<String, int> quantities;
  final Function(FoodItem) onRemove;
  final VoidCallback onOrderAll;
  final Function(FoodItem, int) onQuantityChanged;
  final Function(FoodItem) onImagePressed;

  const FavoritesPage({
    super.key,
    required this.favorites,
    required this.quantities,
    required this.onRemove,
    required this.onOrderAll,
    required this.onQuantityChanged,
    required this.onImagePressed,
  });

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return Container(
        color: homeBackground,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.favorite_border, color: purple, size: 70),

              SizedBox(height: 12),

              Text(
                "No favourites",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 5),

              Text(
                "Add your favourite foods here.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    double favouriteTotal = 0;

    for (final food in favorites) {
      favouriteTotal += food.price * (quantities[food.name] ?? 1);
    }

    return Container(
      color: homeBackground,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final food = favorites[index];

                final quantity = quantities[food.name] ?? 1;

                return Card(
                  margin: const EdgeInsets.only(bottom: 14),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleFoodImage(
                          imageUrl: food.imageUrl,
                          size: 82,
                          onTap: () => onImagePressed(food),
                        ),

                        const SizedBox(width: 13),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      food.name,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: () => onRemove(food),
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                      size: 22,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 4),

                              Text(
                                food.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                "₹${food.price.toStringAsFixed(0)} per item",
                                style: const TextStyle(
                                  color: purple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: lightPurple,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      "Qty",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(width: 10),

                                    GestureDetector(
                                      onTap: quantity > 1
                                          ? () => onQuantityChanged(
                                              food,
                                              quantity - 1,
                                            )
                                          : null,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: quantity > 1
                                              ? Colors.white
                                              : Colors.white54,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          size: 17,
                                          color: quantity > 1
                                              ? purple
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 13,
                                      ),
                                      child: Text(
                                        "$quantity",
                                        style: const TextStyle(
                                          color: purple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),

                                    GestureDetector(
                                      onTap: () =>
                                          onQuantityChanged(food, quantity + 1),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          size: 17,
                                          color: purple,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(18, 12, 18, 14),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Favourite Total",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),

                const SizedBox(height: 2),

                Text(
                  "₹${favouriteTotal.toStringAsFixed(0)}",
                  style: const TextStyle(
                    color: purple,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: 180,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: onOrderAll,
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text(
                      "ORDER ALL",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// ORDER DETAIL PAGE
// ============================================================

class OrderDetailPage extends StatelessWidget {
  final FoodItem? food;
  final int quantity;
  final Function(int) onQuantityChanged;
  final VoidCallback onOrder;

  const OrderDetailPage({
    super.key,
    required this.food,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onOrder,
  });

  @override
  Widget build(BuildContext context) {
    if (food == null) {
      return const Center(
        child: Text("No food selected", textAlign: TextAlign.center),
      );
    }

    final total = food!.price * quantity;

    return Container(
      color: homeBackground,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  CircleFoodImage(
                    imageUrl: food!.imageUrl,
                    size: 210,
                    onTap: () => showFoodImageDialog(context, food!),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    food!.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: purple,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Text(
                    food!.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    "₹${food!.price.toStringAsFixed(0)} per item",
                    style: const TextStyle(
                      color: purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Select Quantity",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: purple,
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: lightPurple,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Quantity",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),

                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: quantity > 1
                                          ? () =>
                                                onQuantityChanged(quantity - 1)
                                          : null,
                                      child: Container(
                                        width: 38,
                                        height: 38,
                                        decoration: BoxDecoration(
                                          color: quantity > 1
                                              ? Colors.white
                                              : Colors.white54,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          color: quantity > 1
                                              ? purple
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 18,
                                      ),
                                      child: Text(
                                        "$quantity",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: purple,
                                        ),
                                      ),
                                    ),

                                    GestureDetector(
                                      onTap: () =>
                                          onQuantityChanged(quantity + 1),
                                      child: Container(
                                        width: 38,
                                        height: 38,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: purple,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Total Amount",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),

                        Text(
                          "₹${total.toStringAsFixed(0)}",
                          style: const TextStyle(
                            color: purple,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(18, 10, 18, 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                onPressed: onOrder,
                icon: const Icon(Icons.shopping_cart),
                label: const Text(
                  "PLACE ORDER",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: purple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PROFILE
// ============================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: homeBackground,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 175,
              height: 175,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: purple, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: purple.withOpacity(.18),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  profileImageUrl,
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, -0.45),
                  errorBuilder: (_, __, ___) {
                    return const ColoredBox(
                      color: lightPurple,
                      child: Icon(Icons.person, color: purple, size: 85),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              "Madhes",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: purple,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Virundhagam Customer",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 25),

            profileInfo(Icons.phone, "Phone", "1234567890"),

            profileInfo(Icons.email, "Email", "madhes@gmail.com"),

            profileInfo(Icons.location_on, "Location", "Tamil Nadu"),

            const SizedBox(height: 8),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: lightPurple,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                children: [
                  Icon(Icons.restaurant_menu, color: purple, size: 35),

                  SizedBox(height: 8),

                  Text(
                    "Welcome to Virundhagam",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: purple,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Enjoy traditional Tamil food and easy ordering.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileInfo(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: lightPurple,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: purple),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}

// ============================================================
// HELP & SUPPORT
// ============================================================

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: homeBackground,
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            "Help & Support",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: purple,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "We are here to help you with your food orders.",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 18),

          supportCard(Icons.phone, "Contact Support", "1234567890"),

          supportCard(Icons.email, "Email Support", "support@virundhagam.com"),

          supportCard(
            Icons.question_answer,
            "Frequently Asked Questions",
            "Get answers to common questions",
          ),

          supportCard(
            Icons.local_shipping_outlined,
            "Order Support",
            "Get help with your current orders",
          ),

          supportCard(
            Icons.payment,
            "Payment Help",
            "Get assistance with payment related questions",
          ),
        ],
      ),
    );
  }

  Widget supportCard(IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.only(bottom: 13),
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, color: purple, size: 30),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      ),
    );
  }
}

// ============================================================
// OFFERS
// ============================================================

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: homeBackground,
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            "Special Offers",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: purple,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Enjoy special deals on traditional Tamil food.",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 18),

          offerCard(
            "WELCOME OFFER",
            "Get special value on your first food order.",
            Icons.card_giftcard,
          ),

          offerCard(
            "MEAL SPECIAL",
            "Enjoy delicious South Indian meals.",
            Icons.restaurant,
          ),

          offerCard(
            "FAMILY FOOD",
            "Choose from a variety of traditional dishes.",
            Icons.family_restroom,
          ),
        ],
      ),
    );
  }

  Widget offerCard(String title, String description, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [purple, Color(0xFF713B99)]),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  description,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CONTACT
// ============================================================

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: homeBackground,
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            "Contact Us",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: purple,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "For questions and support, contact Virundhagam.",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          contactCard(Icons.phone, "Phone", "1234567890"),

          contactCard(Icons.email, "Email", "support@virundhagam.com"),

          contactCard(Icons.location_on, "Location", "Tamil Nadu, India"),

          contactCard(Icons.access_time, "Support Hours", "9:00 AM - 8:00 PM"),
        ],
      ),
    );
  }

  Widget contactCard(IconData icon, String title, String value) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 13),
      child: ListTile(
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: lightPurple,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: purple),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}

// ============================================================
// SETTINGS
// ============================================================

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;
  bool orderUpdates = true;
  bool sound = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: homeBackground,
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            "Settings",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: purple,
            ),
          ),

          const SizedBox(height: 15),

          Card(
            color: Colors.white,
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text("Notifications"),
                  subtitle: const Text("Receive app notifications"),
                  value: notifications,
                  activeColor: purple,
                  onChanged: (value) {
                    setState(() {
                      notifications = value;
                    });
                  },
                ),

                const Divider(height: 1),

                SwitchListTile(
                  title: const Text("Order Updates"),
                  subtitle: const Text("Receive updates about your orders"),
                  value: orderUpdates,
                  activeColor: purple,
                  onChanged: (value) {
                    setState(() {
                      orderUpdates = value;
                    });
                  },
                ),

                const Divider(height: 1),

                SwitchListTile(
                  title: const Text("Sound"),
                  subtitle: const Text("Enable app sounds"),
                  value: sound,
                  activeColor: purple,
                  onChanged: (value) {
                    setState(() {
                      sound = value;
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          const Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.person, color: purple),
              title: Text(
                "Account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Madhes"),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// ABOUT
// ============================================================

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: homeBackground,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircularLogo(size: 105),

            const SizedBox(height: 15),

            const Text(
              "Virundhagam",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: purple,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Traditional Tamil Food",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Text(
                "Virundhagam is a simple food ordering app designed to help users explore traditional Tamil food, save favourites and place food orders easily.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, height: 1.5),
              ),
            ),

            const SizedBox(height: 18),

            aboutCard(
              Icons.restaurant,
              "Traditional Food",
              "Explore popular Tamil dishes.",
            ),

            aboutCard(
              Icons.favorite,
              "Favourites",
              "Save foods you love for quick access.",
            ),

            aboutCard(
              Icons.shopping_cart,
              "Easy Ordering",
              "Select quantity and place orders easily.",
            ),

            aboutCard(
              Icons.support_agent,
              "Customer Support",
              "Get simple support whenever needed.",
            ),

            const SizedBox(height: 10),

            const Text("Version 1.0.0", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget aboutCard(IconData icon, String title, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: lightPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: purple),
            ),

            const SizedBox(width: 13),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    description,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
