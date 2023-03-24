import 'package:flutter/material.dart';
import 'package:visionaryrx/screens/alaxan.dart';
import 'package:visionaryrx/screens/bioflu.dart';
import 'package:visionaryrx/screens/biogesic.dart';
import 'package:visionaryrx/screens/dayzinc.dart';
import 'package:visionaryrx/screens/decolgen.dart';
import 'package:visionaryrx/screens/kremelis.dart';


class DrugPage extends StatefulWidget {
  const DrugPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DrugPageState(); // Create an instance of _DrugPageState
  }
}
class _DrugPageState extends State<DrugPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 45),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildDrugTile(context, 'Alaxan', Colors.red),
                _buildDrugTile(context, 'BioFlu', Colors.orange),
                _buildDrugTile(context, 'Biogesic', Colors.yellow),
                _buildDrugTile(context, 'DayZinc', Colors.green),
                _buildDrugTile(context, 'Decolgen', Colors.blue),
                _buildDrugTile(context, 'Kremelis', Colors.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrugTile(BuildContext context, String drugName, Color color) {
    return GestureDetector(
      onTap: () {
        if (drugName == "BioFlu") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BiofluScreen()),
          );
        } else if (drugName == "Decolgen") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DecolgenScreen()),
          );
        } else if (drugName == "Alaxan") {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AlaxanScreen()),
          );
        } else if (drugName == "Biogesic") {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BiogesicScreen()),
          );
        }
        else if (drugName == "DayZinc") {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DayZincScreen()),
          );
        }
        else if (drugName == "Kremelis") {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => KremelisScreen()),
          );
        }
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_hospital,
              size: 64.0,
              color: color,
            ),
            const SizedBox(height: 8.0),
            Text(
              drugName,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}







