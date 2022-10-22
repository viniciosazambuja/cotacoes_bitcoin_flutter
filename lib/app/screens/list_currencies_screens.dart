import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/menu_component.dart';

class CotacaoPage extends StatefulWidget {
  const CotacaoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CotacaoPage> createState() => _CotacaoPageState();
}

class _CotacaoPageState extends State<CotacaoPage> {
  List<String> _list = ['AUD', 'BRL', 'CAD','CHF','RUB'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title, textAlign: TextAlign.center)),
      drawer: Menu(context),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  height: 500,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: _list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Card(
                              child: ListTile(
                                title: Text('${_list[index]}',
                                    style: TextStyle(fontSize: 16)),
                                leading:
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage('./assets/imagens-moedas/${_list[index]}.png'),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(75.0)),
                                            boxShadow: [
                                              BoxShadow(blurRadius: 7.0, color: Colors.black)
                                            ]),
                                      ),
                                ),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _list = _list;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      })),
            ]),
      ),
    );
  }
}
