import 'package:ecomerce_kotlin/presentations/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Product {
  final String id, name, imageUrl;
  final double price;
  final int rating;
  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static const _products = [
    Product(
      id: '1',
      name: 'Margherita Italian',
      imageUrl: 'https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_1200,q_auto,fl_lossy,dpr_auto,c_fill,f_auto,h_800,g_auto/bhroxavttzwurpwvxcig',
      price: 80,
      rating: 4,
    ),
    Product(
      id: '2',
      name: 'Sausage Pizza',
      imageUrl: 'https://m.media-amazon.com/images/I/71X57RJJKDL._AC_UF894,1000_QL80_.jpg',
      price: 50,
      rating: 4,
    ),
    Product(
      id: '3',
      name: 'Pepperoni Pizza',
      imageUrl: 'https://images.deliveryhero.io/image/fd-my/Products/1093280.jpg?width=%25s',
      price: 60,
      rating: 4,
    ),
    Product(
      id: '4',
      name: 'Cheese Pizza',
      imageUrl: 'https://images.deliveryhero.io/image/fd-my/Products/1093280.jpg?width=%25s',

      // imageUrl: 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2021/03/30/0/FNM_050121-Thin-Crust-Pizza_s4x3.jpg.rend.hgtvcom.1280.1280.suffix/1617129472994.webp',
      price: 50,
      rating: 4,
    ),
  ];

  late List<Product> _filteredProducts;
  final TextEditingController _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredProducts = List.from(_products);
  }

  void _onSearchChanged(String query) {
    final q = query.toLowerCase().trim();
    setState(() {
      if (q.isEmpty) {
        _filteredProducts = List.from(_products);
      } else {
        _filteredProducts = _products
            .where((p) => p.name.toLowerCase().contains(q))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // custom app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.location_on, color: Colors.red),
                          SizedBox(width: 4),
                          Text('Alam sutera', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
                ],
              ),
            ),

            // banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://images.unsplash.com/photo-1534308983496-4fabb1a015ee?q=80&w=2676&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _searchCtrl,
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  hintText: 'Find your pizza here...',

                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // title + view all
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Popular', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () => context.go('/popular'),
                    child: const Text('View All'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: _filteredProducts.length,
                  itemBuilder: (context, i) {
                    final p = _filteredProducts[i];
                    return ProductCard(
                      imageUrl: p.imageUrl,
                      title: p.name,
                      price: p.price,
                      rating: p.rating,
                      onTap: () => context.push('/detail/${p.id}'),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
