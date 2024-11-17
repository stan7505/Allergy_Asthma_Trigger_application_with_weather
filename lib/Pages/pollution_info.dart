import 'package:flutter/material.dart';
class PollutionInfo extends StatelessWidget {
  const PollutionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[800],
        centerTitle: true,
        title: Text('Pollution Info', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("CO (Carbon Monoxide) :", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      )),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text("Carbon monoxide is a colorless, odorless, and tasteless gas that is slightly less dense than air. It is toxic to hemoglobic animals when encountered in concentrations above about 35 ppm, although it is also produced in normal animal metabolism in low quantities, and is thought to have some normal biological functions. In the atmosphere, it is spatially variable and short lived, having a role in the formation of ground-level ozone.", style: TextStyle(color: Colors.white, fontSize: 15))),
                      )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("NO2 (Nitrogen Dioxide) :", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      )),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text("Nitrogen dioxide is a chemical compound with the formula NO2. It is one of several nitrogen oxides. NO2 is an intermediate in the industrial synthesis of nitric acid, millions of tons of which are produced each year for use primarily in the production of fertilizers. At higher temperatures it is a reddish-brown gas that has a characteristic sharp, biting odor and is a prominent air pollutant.", style: TextStyle(color: Colors.white, fontSize: 15))),
                      )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("SO2 (Sulfur Dioxide) :", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      )),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text("Sulfur dioxide is a colorless gas with a pungent odor. It is a liquid when under pressure, and it dissolves in water very easily. Sulfur dioxide in the air comes mainly from activities such as the burning of coal and oil at power plants or from copper smelting. In nature, it comes from volcanic eruptions.", style: TextStyle(color: Colors.white, fontSize: 15))),
                      )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("O3 (Ozone) :", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      )),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text("Ozone is a gas. It can be good or bad, depending on where it is. \"Good\" ozone occurs naturally about 10 to 30 miles above the Earth's surface in a layer called the ozone layer. It protects life on Earth from the sun's harmful ultraviolet (UV) rays. \"Bad\" ozone occurs at the Earth's surface, where it is a major part of smog. It is also a greenhouse gas that traps heat and contributes to climate change.", style: TextStyle(color: Colors.white, fontSize: 15))),
                      )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("PM2.5 (Particulate Matter) :", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      )),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text("Particulate matter (PM) is a complex mixture of solid and liquid particles suspended in air. These particles can vary in size, shape, and chemical composition. Some particles are emitted directly; others are formed in the atmosphere when other pollutants react. Particulate matter includes \"inhalable coarse particles,\" with diameters larger than 2.5 micrometers and smaller than 10 micrometers and \"fine particles,\" with diameters that are 2.5 micrometers and smaller.", style: TextStyle(color: Colors.white, fontSize: 15))),
                      )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("PM10 (Particulate Matter) :", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      )),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text("Particulate matter (PM) is a complex mixture of solid and liquid particles suspended in air. These particles can vary in size, shape, and chemical composition. Some particles are emitted directly; others are formed in the atmosphere when other pollutants react. Particulate matter includes \"inhalable coarse particles,\" with diameters larger than 2.5 micrometers and smaller than 10 micrometers and \"fine particles,\" with diameters that are 2.5 micrometers and smaller.", style: TextStyle(color: Colors.white, fontSize: 15))),
                      )),
                    ],
                  ),
                ),
              ),

            ],
          )
        ),
      ),

    );
  }
}
