import 'package:flutter/material.dart';

class VentasChar extends StatefulWidget {
  const VentasChar({super.key});

@override
  State<VentasChar> createState() => _VentasCharState();
}

class _VentasCharState extends State<VentasChar> {
  final List<double> ventas = [65, 90, 75, 110, 100, 135];
  final List<String> meses = ['Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago'];
  
  @override
  @override
  Widget build(BuildContext context) {
  return Container(
  width: double.infinity,
  padding: const EdgeInsets.all(20),

  decoration: BoxDecoration(
   color: Colors.white,
   borderRadius: BorderRadius.circular(20),

   boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 10,
      offset: const Offset(0, 4),
    )
   ]


  ),

  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
  const Text('Analisis de ventas - 2026',
    style: TextStyle(
    color: Color(0xFF164D3C),
    fontWeight: FontWeight.bold,
    fontSize: 16,
    ),
  ),
   Container(
  padding: const EdgeInsets.symmetric(
  horizontal: 12,
  vertical: 8,


  ),
  
  decoration: BoxDecoration(
   color: Color(0xFFF0F5F2),
   borderRadius: BorderRadius.circular(10),
  ),
  
  child: const Text('Mensual',
  style: TextStyle(
  color: Color(0xFF167052),
 fontWeight: FontWeight.bold,
 fontSize: 12,

  ),
  
  ),

  ),
 ],
    ),
    const SizedBox(height: 25),
    SizedBox(height: 175,
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.spaceAround,

    children: List.generate(
    ventas.length,
    (index){

  return Column(
   mainAxisAlignment: MainAxisAlignment.end,

   children: [
   
   Container(
    width: 23,
    height: ventas[index],
   
   decoration: BoxDecoration(
    color: Color(0xFF197354),

    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(7),
      topRight: Radius.circular(7),


    ),
   ),

   ),
   SizedBox(height: 8),

   Text( meses[index],
   style: TextStyle(
    color: Colors.grey,
    fontSize: 12,

   )
   )

   ],
  );
    }


    )


    )
    
    
    
    ),
  



  ]


  ),
  
  );

  }

}

