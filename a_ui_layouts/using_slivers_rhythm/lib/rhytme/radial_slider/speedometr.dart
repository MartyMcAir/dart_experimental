import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(const RadialApp());
}

// https://www.youtube.com/watch?v=eZnBTKoiTJY
class RadialApp extends StatelessWidget {
  const RadialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Radial App Demo",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: const MySpeedometrPage(),
    );
  }
}

class MySpeedometrPage extends StatefulWidget {
  const MySpeedometrPage({super.key});
  // }): title = "some title for MyRadialPage";

  @override
  State<StatefulWidget> createState() => _MySpeedometrPageState();
}

class _MySpeedometrPageState extends State<MySpeedometrPage> {
  var radialValue = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title: Text(widget.title),
        title: const Text("Title for Speedometr PageState"),
      ),
      body: Center(
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 100,
              startAngle: 90,
              endAngle: 360,
              showLabels: true,
              labelsPosition: ElementsPosition.inside,
              showTicks: true,
              radiusFactor: 0.5,
              interval: 20,
              showFirstLabel: false,
              labelFormat: "{value} Km/H",
              axisLineStyle:
                  const AxisLineStyle(cornerStyle: CornerStyle.bothCurve),
              pointers: <GaugePointer>[
                RangePointer(
                  value: radialValue,
                  cornerStyle: CornerStyle.bothCurve,
                  width: 12,
                  sizeUnit: GaugeSizeUnit.logicalPixel,
                  color: Colors.purple,
                ),
                MarkerPointer(
                  value: radialValue,
                  enableDragging: true,
                  onValueChanged: (value) {
                    radialValue = value;
                  },
                  markerHeight: 30,
                  markerWidth: 30,
                  markerType: MarkerType.circle,
                  borderWidth: 2,
                  borderColor: Colors.purpleAccent,
                )
              ],
              annotations: [
                GaugeAnnotation(
                  angle: 90,
                  axisValue: 5,
                  positionFactor: 0.1,
                  widget: Text("${radialValue.ceil().toString()} Km/H",
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
