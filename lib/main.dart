import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;

  void decrement() {
    setState(() {
      contador--;
    });
  }

  void increment() {
    setState(() {
      contador++;
    });
  }

  bool get estaVazio => contador == 0;
  bool get estaLotado => contador >= 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/image.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              estaLotado ? "Lotado" : "Pode Entrar!",
              style: const TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                "$contador",
                style: TextStyle(
                  fontSize: 100,
                  color: estaLotado ? Colors.red : Colors.black,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: estaVazio ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: estaVazio
                        ? Colors.white.withOpacity(0.2)
                        : Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  child: const Text(
                    "Saiu",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                const SizedBox(width: 32),
                TextButton(
                  onPressed: estaLotado ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor: estaLotado
                        ? Colors.white.withOpacity(0.2)
                        : Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  child: const Text(
                    "Entrou",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
