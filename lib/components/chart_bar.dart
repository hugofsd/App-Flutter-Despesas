import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartBar extends StatelessWidget {
  final String label; //cada dia da semana
  final double value;
  final double percentage;

  ChartBar({
    this.label,
    this.percentage,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, Constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: 20,
              child: FittedBox(
                //diminuir o valor para caber no espaço n importa a quantidade do value
                child: Text('${value.toStringAsFixed(2)}  '),
              ),
            ),
            SizedBox(height: 6),
            Container(
                height: Constraints.maxHeight * 0.49,
                width: 10,
                //stack permite um componente ficar em cima do outro XD
                child: Stack(
                  alignment: Alignment.bottomCenter, //grafico para baixo
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          color: Color.fromRGBO(220, 220, 200, 1)),
                    ),
                    FractionallySizedBox(
                      heightFactor: percentage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 6),
            Text(label)
          ],
        );
      },
    );
  }
}
