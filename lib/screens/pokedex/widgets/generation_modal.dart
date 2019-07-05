import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/data/generations.dart';
import 'package:pokedex/widgets/generation_card.dart';

class GenerationModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: true,
      initialChildSize: 0.7,
      maxChildSize: 1,
      minChildSize: 0.5,
      builder: (context, scrollController) => Container(
        padding: EdgeInsets.only(top: 14),
        decoration: BoxDecoration(
          color: Color(0xFFFDFDFD),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 3,
              decoration: ShapeDecoration(
                shape: StadiumBorder(),
                color: Color(0xFFF4F5F4),
              ),
            ),
            SizedBox(height: 18),
            Text(
              "Generation",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(26),
                controller: scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.55,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: generations.length,
                itemBuilder: (context, index) => GenerationCard(generations[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
